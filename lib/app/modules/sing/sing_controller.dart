import 'package:anima/app/shared/database/database_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'sing_controller.g.dart';

@Injectable()
class SingController = _SingControllerBase with _$SingController;

abstract class _SingControllerBase with Store {
  DatabaseController db = Modular.get();

  @observable
  int value = 0;

  @action
  Future<UserCredential?> createUserWithEmailAndPassword(
      String displayName, String email, String password) async {
    
    UserCredential? userCredential =
        await db.addUser(displayName, email, password);
    Modular.to.pushReplacementNamed('/home');
    return userCredential;
  }

  @action
  void increment() {
    value++;
  }
}
