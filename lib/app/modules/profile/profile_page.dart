import 'package:anima/app/modules/splash/splash_page.dart';
import 'package:anima/app/shared/auth/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'profile_controller.dart';

class ProfilePage extends StatefulWidget {
  final String title;
  const ProfilePage({Key? key, this.title = "Profile"}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends ModularState<ProfilePage, ProfileController> {
  //use 'controller' variable to access controller
  late User _user;
  List selecionadas = [];
  final _authController = Modular.get<AuthController>();

  @override
  void initState() {
    setState(() {
      _user = controller.getUser()!;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black54,
                      blurRadius: 7.0,
                      offset: Offset(0.0, 0.75))
                ],
                color: Color(0xff2CB289),
              ),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios_new))
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            _user.photoURL.toString() == "null"
                ? Image.asset(
                    'assets/perfil/photo.png',
                  )
                : Image.network(_user.photoURL.toString()),
            SizedBox(
              height: 80,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _user.displayName.toString(),
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff2CB289)),
                  ),
                  Text(
                    _user.email.toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    "Status",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _customFlatButtom('No trabalho'),
                        _customFlatButtom('Na igreja'),
                        _customFlatButtom('Universidade'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _customFlatButtom('Lendo'),
                        _customFlatButtom('Viagem com a família'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                    height: 2,
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xffE8E8E8),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FlatButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    color: Color(0xffE8E8E8),
                    child: Text("Informações do software"),
                    minWidth: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FlatButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    color: Color(0xffE8E8E8),
                    child: Text("Excluir conta"),
                    minWidth: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FlatButton(
                    onPressed: () {
                      _authController.logout();

                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SplashPage(),
                        ),
                        ModalRoute.withName('/'),
                      );
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    color: Colors.black,
                    child: Text(
                      "Sair",
                      style: TextStyle(color: Colors.white),
                    ),
                    minWidth: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _returnColor(String name) {
    return selecionadas.contains(name) ? Color(0xff2CB289) : Color(0xffE8E8E8);
  }

  _customFlatButtom(String str) {
     bool find = false;
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        onPressed: () {
          print(selecionadas);
          setState(() {
            if (selecionadas.contains(str)) {
              selecionadas.remove(str);
              find = true;
              
              // selecionadas = selecionadas;
            }
          });
          print(" REMOVEU: {$str} - " + selecionadas.toString());
          //selecionadas = [];
          print("MEIO " + selecionadas.toString());
          print("MEIO adi " + selecionadas.toString());
          print("MEIO dentro " + selecionadas.toString());

          setState(() {
            selecionadas.add(str);
          });
          if (find == true){
            selecionadas.remove(str);
            
          }
          print("FIM" + selecionadas.toString());

          print("--------------------------------");
        },
        color:
            selecionadas.contains(str) ? Color(0xff2CB289) : Color(0xffE8E8E8),
        child: Text(str),
      ),
    );
  }
}
