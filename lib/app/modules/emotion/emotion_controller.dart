import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'emotion_controller.g.dart';

@Injectable()
class EmotionController = _EmotionControllerBase with _$EmotionController;

abstract class _EmotionControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
