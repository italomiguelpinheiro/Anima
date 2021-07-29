import 'package:anima/app/app_controller.dart';
import 'package:anima/app/shared/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  final _controller = Modular.get<LoginController>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var store = Modular.get<AppController>();
  final _authController = Modular.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      Modular.to.popAndPushNamed('/');
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/splash/back.svg',
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 60),
                  Text(
                    "Entrar",
                    style: TextStyle(fontSize: 36),
                  ),
                  Row(
                    children: [
                      Text(
                        "Não tem uma conta?",
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Modular.to.pushReplacementNamed('/sing-up');
                        },
                        child: Text(
                          "Cadastre-se agora",
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff208062),
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 70),
                  TextFieldContainer(
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: Color(0xff208062),
                          ),
                          hintText: "Digite seu login",
                          border: InputBorder.none),
                    ),
                  ),
                  TextFieldContainer(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.lock,
                            color: Color(0xff208062),
                          ),
                          hintText: "Digite sua senha",
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.visibility,
                            color: Color(0xff208062),
                          )),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Esqueceu sua senha?",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff208062),
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(height: 40),
                  FlatButton(
                      height: 50,
                      minWidth: MediaQuery.of(context).size.width,
                      color: Color(0xff2CB289),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "Continuar",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      //_controller.authUser(_emailController.text, _passwordController.text).then((data) { store.setUser(data);
                      onPressed: () {
                        controller.loginWithEmailAndPassword(
                            "barry.allen@example.com", "SuperSecretPassword!");
                      }),
                  SizedBox(height: 20),
                  Center(child: Text("Ou")),
                  SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: GestureDetector(
                      onTap: controller.loginWithGoogle,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xff333131)),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/splash/google.png",
                                ),
                                SizedBox(width: 20),
                                Text(
                                  "Continuar com Gmail",
                                  style: TextStyle(
                                      color: Color(0xff333131),
                                      fontSize: 14,
                                      decoration: TextDecoration.none),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      height: 50,
      width: size.width,
      decoration: BoxDecoration(
        color: Color(0xffE8E8E8),
        borderRadius: BorderRadius.circular(5),
      ),
      child: child,
    );
  }
}
