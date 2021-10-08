import 'package:anima/app/modules/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Analise extends StatelessWidget {
  const Analise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 10.0, right: 15, left: 15),
        child: Column(
          children: [
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(right: 15.0, left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Container(
                        height: 205,

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _customLinear(0.9, "Whatsapp", "9h 25min"),
                            _customLinear(0.8, "Instagram", "6h 10min"),
                            _customLinear(0.7, "Tiktok", "5h 10min"),
                            _customLinear(0.6, "YouTube", "4h 12min"),
                            _customLinear(0.5, "Telegram", "1h 03min"),
                            _customLinear(0.4, "Tinder", "30min"),
                            _customLinear(0.3, "Notes", "20min"),
                            _customLinear(0.2, "Anima", "14min"),
                            _customLinear(0.25, "Subway Surf", "5min"),

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
      );

  _customLinear(double percent,String app,  String text) {
    return Row(
      children: [
        LinearPercentIndicator(
          leading: Text(app, style: TextStyle(fontSize: 16)),
          lineHeight: 8,
          width: 140,
          percent: percent,
          backgroundColor: Colors.black,
          progressColor: Color(0xff2CB289),
        ),
        Text(text, style: TextStyle(fontSize: 16),)
      ],
    );
  }
}
