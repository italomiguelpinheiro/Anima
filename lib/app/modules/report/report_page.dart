import 'package:anima/app/modules/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'report_controller.dart';

class ReportPage extends StatefulWidget {
  final String title;
  const ReportPage({Key? key, this.title = "Report"}) : super(key: key);

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends ModularState<ReportPage, ReportController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2CB289),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Oi Aninha",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            Text(
              DateTime.now().day.toString() +
                  " DE SETEMBRO " +
                  DateTime.now().year.toString(),
              style: TextStyle(color: Colors.white, fontSize: 12),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            icon: Icon(Icons.person_outline_sharp),
            padding: EdgeInsets.zero,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 30, bottom: 15),
            child: Text("Relatório",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
          ),
          Center(child: SvgPicture.asset('assets/perfil/ampulheta.svg')),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom:50.0),
                child: FlatButton(
                    minWidth: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                    color: Color(0xff2CB289),
                    onPressed: () {},
                    child: Text(
                      "Baixar Relatório",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
