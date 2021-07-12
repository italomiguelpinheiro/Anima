import 'package:anima/app/modules/emotion/components/card_emotion.dart';
import 'package:anima/app/modules/emotion/pages/app_record.dart';
import 'package:anima/app/modules/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'emotion_controller.dart';

class EmotionPage extends StatefulWidget {
  final String title;
  const EmotionPage({Key? key, this.title = "Emotion"}) : super(key: key);

  @override
  _EmotionPageState createState() => _EmotionPageState();
}

class _EmotionPageState extends ModularState<EmotionPage, EmotionController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
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
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, right: 15, left: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Oi Aninha",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  DateTime.now().day.toString() +
                                      " DE JULHO " +
                                      DateTime.now().year.toString(),
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              
                              IconButton(
                                  onPressed: () {
                                     Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProfilePage()),
                                          );
                                  },
                                  icon:
                                      Icon(Icons.person, color: Colors.white)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0, left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 10),
                            Text("Relatório de emoções",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/emotions/emotions.svg',
                                  height: 250,
                                ),
                                SizedBox(width: 20),
                                Container(
                                  height: 295,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          LinearPercentIndicator(
                                            lineHeight: 8,
                                            width: 140,
                                            percent: 0.8,
                                            backgroundColor: Colors.black,
                                            progressColor: Color(0xffCDEAE3),
                                          ),
                                          Text("Tranquilo (80%)")
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          LinearPercentIndicator(
                                            lineHeight: 8,
                                            width: 140,
                                            percent: 0.7,
                                            backgroundColor: Colors.black,
                                            progressColor: Color(0xffCDEAE3),
                                          ),
                                          Text("Triste (70%)")
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          LinearPercentIndicator(
                                            lineHeight: 8,
                                            width: 140,
                                            percent: 0.56,
                                            backgroundColor: Colors.black,
                                            progressColor: Color(0xffCDEAE3),
                                          ),
                                          Text("Alegre (56%)")
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          LinearPercentIndicator(
                                            lineHeight: 8,
                                            width: 140,
                                            percent: 0.45,
                                            backgroundColor: Colors.black,
                                            progressColor: Color(0xffCDEAE3),
                                          ),
                                          Text("Valorizado (45%)")
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          LinearPercentIndicator(
                                            lineHeight: 8,
                                            width: 140,
                                            percent: 0.4,
                                            backgroundColor: Colors.black,
                                            progressColor: Color(0xffCDEAE3),
                                          ),
                                          Text("Ansioso (40%)")
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          LinearPercentIndicator(
                                            lineHeight: 8,
                                            width: 140,
                                            percent: 0.3,
                                            backgroundColor: Colors.black,
                                            progressColor: Color(0xffCDEAE3),
                                          ),
                                          Text("Irritado (30%)")
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Meus registros diários",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    alignment: Alignment.topCenter,
                    child: Row(
                      children: [
                        GestureDetector(
                          child: cardEmotion("Candle Crush"),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AppRecord(title: "Candle Crush",)),
                            );
                          },
                        ),
                        GestureDetector(
                          child: cardEmotion("Instagram"),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AppRecord(title: "Instagram",)),
                            );
                          },
                        ),
                        GestureDetector(
                          child: cardEmotion("WhatsApp"),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AppRecord(title: "WhatsApp",)),
                            );
                          },
                        ),
                        GestureDetector(
                          child: cardEmotion("Telegram"),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AppRecord(title: "Telegram",)),
                            );
                          },
                        ),
                        GestureDetector(
                          child: cardEmotion("Twitter"),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AppRecord(title: "Twitter",)),
                            );
                          },
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
