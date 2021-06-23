import 'package:anima/app/app_controller.dart';
import 'package:anima/app/modules/content/content_page.dart';
import 'package:anima/app/modules/emotion/emotion_page.dart';
import 'package:anima/app/modules/home/home_controller.dart';
import 'package:anima/app/modules/home/home_page_view.dart';
import 'package:anima/app/modules/reminder/reminder_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  final _controllerHome = Modular.get<HomeController>();
  final _controllerApp = Modular.get<AppController>();
  
  
  int _currentIndex = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  final tabs = [HomePageView(), EmotionPage(), ContentPage(), ReminderPage(), Container()];
   
@override
 void initState()  {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:PageStorage(
        bucket: bucket,
        child: tabs[_currentIndex],
      ), 
      //HomePageView(widthCel: _widthCel),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        unselectedItemColor: Colors.grey,
        elevation: 3,
        showSelectedLabels: false,
        selectedItemColor: Color(0xff2CB289),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text("Receitas"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wysiwyg_outlined),
            title: Text("Conversa"),
          ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.add_alert_outlined),
            title: Text("Conversa"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Perfil"),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}


