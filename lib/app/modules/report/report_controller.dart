import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'report_controller.g.dart';

@Injectable()
class ReportController = _ReportControllerBase with _$ReportController;

abstract class _ReportControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
