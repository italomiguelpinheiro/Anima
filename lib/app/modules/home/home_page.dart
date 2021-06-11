import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                color: Color(0xff2CB289),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
              ),
              child: Column(
                children: [],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Color(0xff2CB289),),
              title: Text("Dados")
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border,color: Color(0xff2CB289),),
              title: Text("Emoções")
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.note, color: Color(0xff2CB289),),
              title: Text("Conteúdo")

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.doorbell_outlined,color: Color(0xff2CB289),),
              title: Text("Lembretes")
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person,color: Color(0xff2CB289),),
              title: Text("Perfil")
            )
          ],
        ),
      ),
    );
  }
}
