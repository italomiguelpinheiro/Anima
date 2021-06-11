import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:anima/app/shared/auth/auth_controller.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  
  AuthController auth = Modular.get();

  @observable
  bool loading = false;

  @observable
  int value = 0;

@action
  Future loginWithGoogle() async {
    try {
      loading = true;
      await auth.loginWithGoogle();
      Modular.to.pushReplacementNamed('/home');
    } catch (e) {
      loading = false;
    }
  }

  @action
  Future loginWithEmailAndPassword() async {
    try {
      loading = true;
      await auth.loginWithEmailAndPassword();
      Modular.to.pushReplacementNamed('/home');
    } catch (e) {
      loading = false;
    }
  }

  @action
  void increment() {
    value++;
  }
}
