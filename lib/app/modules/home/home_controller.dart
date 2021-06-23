import 'package:anima/app/shared/auth/auth_controller.dart';
import 'package:anima/app/shared/database/database_controller.dart';
import 'package:anima/app/shared/models/emotion_model.dart';
import 'package:anima/app/shared/models/event_model.dart';
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
  int value = 0;

  @action
  void increment() {
    value++;
  }

  logout() async {
    await Modular.get<AuthController>().logout();
    Modular.to.pushReplacementNamed('/');
  }

  getToken() async {
    await Modular.get<AuthController>().getToken();
  }

  @action
  void addEvent(List<EventUsageInfo> eventUsageList) {
    db.addEvents(eventUsageList);
  }

  @action
  Future<void> getEvent() async {
    List<QueryDocumentSnapshot<EventModel>> events =
        await db.getEvents().get().then((snapshot) => snapshot.docs);

    events.forEach((element) {
      print(element.toString());
    });
  }

  @action
  void addUsage(List<UsageInfo> usageInfoList) {
    db.addUsage(usageInfoList);
  }

  @action
  void addEmotion() {
    db.addEmotion("com.example.anima", EmotionStatus.Alegre,
        new DateTime.now().toString(), "exposedContent", "thoughts");
  }

  @action
  void addConfig() {
    db.addConfigs(true, false, false, false, false, false);
  }
}
