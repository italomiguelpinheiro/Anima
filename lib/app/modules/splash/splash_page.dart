import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(color: Color(0xffCDEAE3)),
        child: ListView(
          children: [
            SizedBox(
              height: 100,
            ),
            SvgPicture.asset('assets/splash/logo.svg'),
            SizedBox(height: 110),
            SvgPicture.asset('assets/splash/guy.svg'),
            SizedBox(height: 110),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                    height: 50,
                    minWidth: MediaQuery.of(context).size.width * 0.4,
                    color: Color(0xff2CB289),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "Entrar",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Modular.to.pushReplacementNamed('/login');
                    }),
                FlatButton(
                    height: 50,
                    minWidth: 145,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Text("Cadastre-se"),
                    onPressed: () {
                         Modular.to.pushReplacementNamed('/sing-up');

                    }),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: GestureDetector(
                  onTap: () {
                    print("Tocou aqui");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff333131)),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
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
            ),
            SizedBox(height: 70)
          ],
        ),
      ),
    );
  }
}
