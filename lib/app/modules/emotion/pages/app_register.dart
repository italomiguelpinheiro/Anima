import 'package:anima/app/modules/emotion/components/container_app.dart';
import 'package:flutter/material.dart';

class AppRegister extends StatefulWidget {
  final String title;
  const AppRegister({Key? key, required this.title}) : super(key: key);

  @override
  _AppRegisterState createState() => _AppRegisterState();
}

class _AppRegisterState extends State<AppRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff2CB289),
          title: Text("Registros Emocionais"),
        ),
        body: ListView(
          children: [

            SizedBox(height: 20,),
            Center(child: Text("Aplicativo: " + widget.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),)),
            SizedBox(height: 20,),
            containerApp('assets/emotions/joy.svg', context),
            containerApp('assets/emotions/sadness.svg', context),
            containerApp('assets/emotions/joy.svg', context),
            containerApp('assets/emotions/sadness.svg', context),
            containerApp('assets/emotions/joy.svg', context),
            containerApp('assets/emotions/sadness.svg', context),
            containerApp('assets/emotions/joy.svg', context),
            containerApp('assets/emotions/sadness.svg', context),
            containerApp('assets/emotions/joy.svg', context),
            containerApp('assets/emotions/sadness.svg', context),
            containerApp('assets/emotions/joy.svg', context),
            containerApp('assets/emotions/sadness.svg', context),
          ],
        ));
  }
}
