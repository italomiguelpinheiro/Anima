import 'package:anima/app/modules/reminder/components/custom_switch.dart';
import 'package:anima/app/modules/reminder/page/challange_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'reminder_controller.dart';

class ReminderPage extends StatefulWidget {
  final String title;
  const ReminderPage({Key? key, this.title = "Reminder"}) : super(key: key);

  @override
  _ReminderPageState createState() => _ReminderPageState();
}

class _ReminderPageState
    extends ModularState<ReminderPage, ReminderController> {
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
                  " DE JUNHO " +
                  DateTime.now().year.toString(),
              style: TextStyle(color: Colors.white, fontSize: 12),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person_outline_sharp),
            padding: EdgeInsets.zero,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30),
            Center(child: SvgPicture.asset('assets/reminder/girl.svg')),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 17.0, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Desafios",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChallengePage()),
                        );
                      },
                      icon: Icon(Icons.arrow_forward_outlined)),
                ],
              ),
            ),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: Color(0xffE8E8E8),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20.0),
              child: Text(
                "Estratégias de uso",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ativar/Desativar Notificações",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  CrazySwitch()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 30),
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    "Ativa ou desativa todas as notificações de estratégia: cartões de enfrentamento, registro de emoções e lembretes.",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  )),
            ),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: Color(0xffE8E8E8),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Registro de emoções",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  CrazySwitch()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 30),
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    "Registre suas emoções durante acessos longos em aplicativos selecionados.",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  )),
            ),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: Color(0xffE8E8E8),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Cartões de enfrentamento",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  CrazySwitch()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 30),
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    "Seja notificado sobre os benefícios e malefícios em usar aplicativos por muito tempo.",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  )),
            ),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: Color(0xffE8E8E8),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sincronizar Google Agenda",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  CrazySwitch()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 30),
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    "Sincronize sua agenda para receber notificações personalizadas ao sair da rotina planejada.",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  )),
            ),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: Color(0xffE8E8E8),
            ),
          ],
        ),
      ),
    );
  }
}
