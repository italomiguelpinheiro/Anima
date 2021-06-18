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
      ),
      body: Container(
        color: Color(0xffE8E8E8),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Suas emoções diárias",
                    style: TextStyle(fontSize: 20),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.filter_alt_outlined,
                          color: Color(0xff208062)))
                ],
              ),
              SizedBox(height: 25),
              Text(
                "Ranking de emoções",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/emotions/emotions.svg',
                    height: 270,
                  ),
                  SizedBox(width: 20),
                  Container(
                    height: 325,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(                          
                          children: [
                            LinearPercentIndicator(
                              lineHeight: 10,
                              width: 140,
                              percent: 0.2,
                              backgroundColor: Colors.grey,
                              progressColor: Color(0xff2CB289),
                            ),
                            Text("Tranquilo (20%)")
                          ],
                        ),
                        Row(
                          children: [
                            LinearPercentIndicator(
                              lineHeight: 10,
                              width: 140,
                              percent: 0.4,
                              backgroundColor: Colors.grey,
                              progressColor: Color(0xff2CB289),
                            ),
                            Text("Triste (40%)")
                          ],
                        ),
                        Row(
                          children: [
                            LinearPercentIndicator(
                              lineHeight: 10,
                              width: 140,
                              percent: 0.9,
                              backgroundColor: Colors.grey,
                              progressColor: Color(0xff2CB289),
                            ),
                            Text("Alegre (90%)")
                          ],
                        ),
                        Row(
                          children: [
                            LinearPercentIndicator(
                              lineHeight: 10,
                              width: 140,
                              percent: 0.3,
                              backgroundColor: Colors.grey,
                              progressColor: Color(0xff2CB289),
                            ),
                            Text("Valorizado (30%)")
                          ],
                        ),
                        Row(
                          children: [
                            LinearPercentIndicator(
                              lineHeight: 10,
                              width: 140,
                              percent: 0.5,
                              backgroundColor: Colors.grey,
                              progressColor: Color(0xff2CB289),
                            ),
                            Text("Ansioso (50%)")
                          ],
                        ),
                        Row(
                          children: [
                            LinearPercentIndicator(
                              lineHeight: 10,
                              width: 140,
                              percent: 0.1,
                              backgroundColor: Colors.grey,
                              progressColor: Color(0xff2CB289),
                            ),
                            Text("Irritado (10%)")
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
      ),
    );
  }
}
