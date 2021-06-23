import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'reminder_controller.g.dart';

@Injectable()
class ReminderController = _ReminderControllerBase with _$ReminderController;

abstract class _ReminderControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
