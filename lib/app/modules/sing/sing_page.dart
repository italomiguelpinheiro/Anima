import 'package:anima/app/app_controller.dart';
import 'package:anima/app/modules/sing/sing_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SingPage extends StatefulWidget {
  final String title;
  const SingPage({Key? key, this.title = "Login"}) : super(key: key);

  @override
  _SingPageState createState() => _SingPageState();
}

class _SingPageState extends ModularState<SingPage, SingController> {
  final _controller = Modular.get<SingController>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var store = Modular.get<AppController>();

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
                    "Crie sua conta",
                    style: TextStyle(fontSize: 36),
                  ),
                  Row(
                    children: [
                      Text(
                        "Já tem uma conta?",
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Modular.to.pushReplacementNamed('/login');
                        },
                        child: Text(
                          "Faça Login",
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff208062),
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Text("Nome"),
                  TextFieldContainer(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: _nameController,
                      decoration: InputDecoration(
                          hintText: "Digite seu nome",
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text("Email"),
                  TextFieldContainer(
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      decoration: InputDecoration(
                          hintText: "Digite seu email favorito",
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text("Senha"),
                  TextFieldContainer(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Crie uma senha",
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.visibility,
                            color: Color(0xff208062),
                          )),
                    ),
                  ),
                  Text(
                    "Mínimo de 8 caracteres. Combine letras e números.",
                    style: TextStyle(fontSize: 10),
                  ),
                  SizedBox(height: 15),
                  TextFieldContainer(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Digite sua senha novamente",
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.visibility,
                            color: Color(0xff208062),
                          )),
                    ),
                  ),
                  SizedBox(height: 15),
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
                        _controller.createUserWithEmailAndPassword(
                            _nameController.text, _emailController.text, _passwordController.text);
                      }), //controller.loginWithEmailAndPassword),
                  SizedBox(height: 20),
                  Center(child: Text("Ou")),
                  SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: GestureDetector(
                      onTap: () {},
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
