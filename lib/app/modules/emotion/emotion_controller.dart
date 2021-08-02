import 'package:anima/app/shared/database/database_controller.dart';
import 'package:anima/app/shared/models/emotion_model.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'emotion_controller.g.dart';

@Injectable()
class EmotionController = _EmotionControllerBase with _$EmotionController;

abstract class _EmotionControllerBase with Store {

  DatabaseController db = Modular.get();

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

   @action
  Future addEmotion(String packageName, EmotionStatus status, String timeStamp, String exposedContent, String thoughts) async {
    try {
      db.addEmotion(packageName, status, timeStamp, exposedContent, thoughts);
    } catch (e) {
      print(e.toString());
    }
  }
}
