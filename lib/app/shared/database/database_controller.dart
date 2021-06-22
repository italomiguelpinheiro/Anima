import 'package:anima/app/shared/models/event_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:usage_stats/usage_stats.dart';

import 'repository/database_repository_interface.dart';

part 'database_controller.g.dart';

class DatabaseController = _DatabaseControllerBase with _$DatabaseController;

abstract class _DatabaseControllerBase with Store {
  final IDatabaseRepository _databaseRepository = Modular.get();

  @observable
  SyncStatus status = SyncStatus.loading;

  @action
  CollectionReference<EventModel> getEvents() {
    return _databaseRepository.getEvents();
  }

  @action
  Future<void> addEvents(List<EventUsageInfo> usageInfoList) async {
    usageInfoList.forEach((element) async {
      await _databaseRepository.addEvent(element.eventType, element.timeStamp,
          element.packageName, element.className);
    });
  }
}

enum SyncStatus { loading, off, complete }
