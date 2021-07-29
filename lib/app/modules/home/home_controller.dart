import 'dart:convert';

import 'package:anima/app/shared/auth/auth_controller.dart';
import 'package:anima/app/shared/database/database_controller.dart';
import 'package:anima/app/shared/models/access_model.dart';
import 'package:anima/app/shared/models/config_model.dart';
import 'package:anima/app/shared/models/emotion_model.dart';
import 'package:anima/app/shared/models/event_model.dart';
import 'package:anima/app/shared/models/usage_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:usage_stats/usage_stats.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  DatabaseController db = Modular.get();

  @observable
  List acessoLongo = [];

  @observable
  List acessoCurto = [];

  logout() async {
    await Modular.get<AuthController>().logout();
    Modular.to.pushReplacementNamed('/');
  }

  getToken() async {
    await Modular.get<AuthController>().getToken();
  }

  @action
  void addAccess(List<EventUsageInfo> eventUsageList) {
    db.addAccess(eventUsageList);
  }

  @action
  Future<List<AccessModel>> getAccess(
      List<EventUsageInfo> eventUsageList) async {
    List<AccessModel> access = await db.getAccess(eventUsageList);
    print("Access");
    print(access);
    return access;
  }

  @action
  void addEvent(List<EventUsageInfo> eventUsageList) {
    db.addEvents(eventUsageList);
  }

  @action
  Future<void> getEvent() async {
    CollectionReference<EventModel> events =
        db.getEvents("com.example.anima", "1");
    events.get().then((value) => value.docs.forEach((element) {
          print(element.data().toJson());
        }));
  }

  @action
  void addUsage(List<UsageInfo> usageInfoList) {
    db.addUsage(usageInfoList);
  }

  @action
  void getUsage() {
    CollectionReference<UsageModel> usages = db.getUsages("com.example.anima");
    usages.get().then((value) => value.docs.forEach((element) {
          print(element.data().toJson());
        }));
  }

  @action
  void addEmotion() {
    db.addEmotion("com.example.anima", EmotionStatus.Alegre,
        new DateTime.now().toString(), "exposedContent", "thoughts");
  }

  @action
  void getEmotions() {
    CollectionReference<EmotionModel> emotions =
        db.getEmotions("com.example.anima");
    emotions.get().then((value) => value.docs.forEach((element) {
          print(element.data().toJson());
        }));
  }

  @action
  void addConfig() {
    db.addConfigs(true, false, false, false, false, false);
  }

  @action
  void getConfigs() {
    CollectionReference<ConfigModel> configs = db.getConfigs();
    configs.get().then((value) => value.docs.forEach((element) {
          print(element.data().toJson());
        }));
  }
}
