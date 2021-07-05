import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'sing_controller.g.dart';

@Injectable()
class SingController = _SingControllerBase with _$SingController;

abstract class _SingControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
