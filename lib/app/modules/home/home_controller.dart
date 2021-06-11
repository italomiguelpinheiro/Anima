import 'package:anima/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
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
}
