import 'dart:async';
import 'package:anima/app/shared/models/access_model.dart';
import 'package:anima/app/shared/models/config_model.dart';
import 'package:anima/app/shared/models/emotion_model.dart';
import 'package:anima/app/shared/models/event_model.dart';
import 'package:anima/app/shared/models/usage_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:usage_stats/usage_stats.dart';

import 'access_repository/access_database_repository_interface.dart';
import 'configs_reposiroty/configs_database_repository_interface.dart';
import 'emotions_reposiroty/emotions_database_repository_interface.dart';
import 'events_repository/events_database_repository_interface.dart';
import 'usage_reposiroty/usage_database_repository_interface.dart';

part 'database_controller.g.dart';

class DatabaseController = _DatabaseControllerBase with _$DatabaseController;

abstract class _DatabaseControllerBase with Store {
  final IEventsDatabaseRepository _eventsDatabaseRepository = Modular.get();
  final IUsageDatabaseRepository _usageDatabaseRepository = Modular.get();
  final IEmotionsDatabaseRepository _emotionDatabaseRepository = Modular.get();
  final IConfigsDatabaseRepository _configDatabaseRepository = Modular.get();
  final IAccessDatabaseRepository _accessDatabaseRepository = Modular.get();

  @observable
  SyncStatus status = SyncStatus.loading;

  @action
  Future<List<AccessModel>> getAccess(
      List<EventUsageInfo> usageInfoList) async {
    List<AccessModel> aceessList = [];

    usageInfoList.forEach((element) async {
      CollectionReference<AccessModel> collectionReference =
          _accessDatabaseRepository.getAccess(element.packageName);

      QuerySnapshot<AccessModel> querySnapshot =
          await collectionReference.get();

      for (var item in querySnapshot.docs) {
        //print("element" + item.data().packageName + " - " + item.data().count);
        aceessList.add(item.data());
      }
    });

    print("AccessList");
    print(aceessList);

    return aceessList;
  }

  @action
  Future<void> addAccess(List<EventUsageInfo> usageInfoList) async {
    List allEvents = [];
    List times = [];

    var start, stop;

    usageInfoList.forEach((element) {
      if (['1', '2', '23'].contains(element.eventType)) {
        allEvents.add(element);
      }
    });

    allEvents
        .sort((item1, item2) => item1.timeStamp.compareTo(item2.timeStamp));

    allEvents.forEach((element) {
      if (element.eventType == "1") {
        start = element.timeStamp;
      } else {
        stop = element.timeStamp;
        if (start != null && stop != null) {
          times.add({
            "start": start,
            "stop": {"event": element.eventType, "timestamp": stop},
            "packageName": element.packageName,
            "count": int.parse(stop) - int.parse(start)
          });
        }
        start = null;
        stop = null;
      }
    });

    times.forEach((element) async {
      if (!element["packageName"].contains("android") &&
          !element["packageName"].contains("miui") &&
          !element["packageName"].contains("xiaomi")) {
        print(element["packageName"]);

        await _accessDatabaseRepository.addAccess(
            element["start"],
            element["stop"].toString(),
            element["packageName"],
            element["count"].toString());
      }
    });
  }

  @action
  CollectionReference<EventModel> getEvents(
      String packageName, String eventType) {
    return _eventsDatabaseRepository.getEvents(packageName, eventType);
  }

  @action
  Future<void> addEvents(List<EventUsageInfo> usageInfoList) async {
    List blacklist = ["android", "com.miui", "com.xiaomi"];
    String currentItem = '';
    usageInfoList.forEach((element) async {
      blacklist.forEach((item) async {
        if (!element.packageName.contains(item) &&
            element.packageName != currentItem) {
          await _eventsDatabaseRepository.addEvent(element.eventType,
              element.timeStamp, element.packageName, element.className);
        } else {
          currentItem = element.packageName;
        }
      });
    });
  }

  @action
  Future<void> addUsage(List<UsageInfo> usageInfoList) async {
    List blacklist = ["android", "com.miui", "com.xiaomi"];
    String currentItem = '';
    usageInfoList.forEach((element) async {
      blacklist.forEach((item) async {
        if (!element.packageName.contains(item) &&
            element.packageName != currentItem) {
          await _usageDatabaseRepository.addUsage(
              element.firstTimeStamp,
              element.lastTimeStamp,
              element.packageName,
              element.lastTimeUsed,
              element.totalTimeInForeground);
        } else {
          currentItem = element.packageName;
        }
      });
    });
  }

  @action
  CollectionReference<UsageModel> getUsages(String packageName) {
    return _usageDatabaseRepository.getUsages(packageName);
  }

  @action
  Future<void> addEmotion(String packageName, EmotionStatus emotionStatus,
      String timeStamp, String exposedContent, String thoughts) async {
    await _emotionDatabaseRepository.addEmotions(
        packageName, emotionStatus, timeStamp, exposedContent, thoughts);
  }

  @action
  CollectionReference<EmotionModel> getEmotions(String packageName) {
    return _emotionDatabaseRepository.getEmotions(packageName);
  }

  @action
  Future<void> addConfigs(
      bool nudgets,
      bool emotions,
      bool confrontation,
      bool googleCalendar,
      bool challengesTotalReduction,
      bool challengesDowntimeApp) async {
    await _configDatabaseRepository.addConfigs(nudgets, emotions, confrontation,
        googleCalendar, challengesTotalReduction, challengesDowntimeApp);
  }

  @action
  CollectionReference<ConfigModel> getConfigs() {
    return _configDatabaseRepository.getConfigs();
  }
}

enum SyncStatus { loading, off, complete }
