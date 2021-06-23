import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'content_controller.g.dart';

@Injectable()
class ContentController = _ContentControllerBase with _$ContentController;

abstract class _ContentControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
