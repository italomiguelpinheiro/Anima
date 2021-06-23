import 'package:anima/app/modules/reminder/components/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChallengePage extends StatefulWidget {
  const ChallengePage({Key? key}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black54,
                          blurRadius: 7.0,
                          offset: Offset(0.0, 0.75))
                    ],
                    color: Color(0xff2CB289),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                  ),
                  child: Column(
                   
                    children: [
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:30.0, right: 34),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Escolha \nseu desafio!", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),  ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 70),
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Redução de uso total",
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
                        "Defina um limite de tempo de uso para o seu smartphone e receba notificações quando estiver perto de alcançá-lo.",
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
                        "Redução de tempo de um aplicativo",
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
                        "Defina o limite de tempo para um aplicativo e receba notificações quando estiver perto de alcançá-lo.",
                        style: TextStyle(fontWeight: FontWeight.w300),
                      )),
                ),
              ],
            ),
            Positioned(
              height: 200,

              top: 110,
              //bottom: -219,
              left: -30,
              right: 130,

              child: SvgPicture.asset(
                'assets/reminder/boy_amp.svg',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
