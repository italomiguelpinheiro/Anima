import 'package:anima/app/shared/auth/repository/auth_repository_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'auth_controller.g.dart';

@Injectable()
class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  
  final IAuthRepository _authRepository = Modular.get();

  @observable
  AuthStatus status = AuthStatus.loading;

  @observable
  User? user;

  @action
  setUser(User? value) {
    user = value;
    status = value == null ? AuthStatus.logoff : AuthStatus.login;
  }

   _AuthControllerBase() {
    User? value = _authRepository.getUser();
    setUser(value);
  }

  @action
  Future loginWithGoogle() async {
     print('auth_controller');
    UserCredential userCredential = await _authRepository.getGoogleLogin();
    user = userCredential.user;
  }
}

enum AuthStatus { loading, login, logoff }