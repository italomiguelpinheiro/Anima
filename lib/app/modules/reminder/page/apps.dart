import 'package:anima/app/modules/reminder/components/custom_switch.dart';
import 'package:anima/app/modules/reminder/page/describe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppsPage extends StatefulWidget {
  const AppsPage({Key? key}) : super(key: key);

  @override
  _AppsPageState createState() => _AppsPageState();
}

class _AppsPageState extends State<AppsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 20, top: 20, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_left_outlined,
                        size: 40,
                        color: Color(0xff208062),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                         Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => (DescribePage())),
                          );
                      },
                      icon: Icon(
                        Icons.check,
                        size: 40,
                        color: Color(0xff208062),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  "Selecione os aplicativos que você deseja monitorar.",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              _buildCrazeSwitch("Instagram"),
              _buildCrazeSwitch("Facebook"),
              _buildCrazeSwitch("Candle Crush"),
              _buildCrazeSwitch("YouTube"),
              _buildCrazeSwitch("Whatsapp"),
              _buildCrazeSwitch("Twitter"),
              _buildCrazeSwitch("Telegram"),
              _buildCrazeSwitch("TikTok"),
              _buildCrazeSwitch("Kwai"),
              _buildCrazeSwitch("PK XD"),
            ],
          ),
        ),
      )),
    );
  }

  Widget _buildCrazeSwitch(String str) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25, left: 20, right: 20, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                str,
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
              ),
              CrazySwitch()
            ],
          ),
        ),
        Container(
          height: 2,
          width: MediaQuery.of(context).size.width,
          color: Color(0xffE8E8E8),
        ),
      ],
    );
  }
}
