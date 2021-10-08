import 'dart:async';
import 'package:anima/app/modules/emotion/pages/app_record.dart';
import 'package:anima/app/modules/emotion/pages/app_register.dart';
import 'package:anima/app/modules/home/components/analise.dart';
import 'package:anima/app/modules/home/pages/calendar_page.dart';
import 'package:anima/app/modules/profile/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:usage_stats/usage_stats.dart';
import 'home_controller.dart';
import 'package:date_format/date_format.dart';
class HomePageView extends StatefulWidget {
  final String title;
  const HomePageView({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends ModularState<HomePageView, HomeController> {
  //use 'controller' variable to access controller

  late List<dynamic> longEvents = controller.acessoLongo;
  late List<dynamic> shortEvents = controller.acessoCurto;

  late List<EventUsageInfo> events = [];
  late List<UsageInfo> usage = [];
  late User _user;
  late List<bool> _selected = [true, false, false];
  late int selectedIndex = 0;
  @override
  void initState() {
    initUsage();
    setState(() {
      _user = controller.getUser()!;
    });
    super.initState();
  }

  Future<void> initUsage() async {
    UsageStats.grantUsagePermission();
    DateTime endDate = new DateTime.now();
    DateTime startDate = DateTime(endDate.year, endDate.month, 1, 0, 0, 0);

    List<EventUsageInfo> queryEvents =
        await UsageStats.queryEvents(startDate, endDate);
    List<UsageInfo> usageStats =
        await UsageStats.queryUsageStats(startDate, endDate);

    this.setState(() {
      events = queryEvents.reversed.toList();
      usage = usageStats.reversed.toList();
    });
    controller.addAccess(events);
    controller.getAccess(events);
  }

  @override
  Widget build(BuildContext context) {
    //controller.addAccess();

    return SafeArea(
      child: Scaffold(
        appBar: null,
        body: SingleChildScrollView(
          child: Container(
            child: Stack(
              children: [
                Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.4,
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
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      
                                      Text(_user.displayName.toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                        DateTime.now().day.toString() +
                                            " DE SETEMBRO "  +
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
                                        icon: Icon(Icons.person,
                                            color: Colors.white)),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 40),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "12h",
                                      style: TextStyle(
                                          fontSize: 50,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "30min",
                                      style: TextStyle(
                                          fontSize: 33,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '''é o seu tempo diário\n   usando o celular
                                ''',
                              style: TextStyle(fontSize: 24),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "40",
                                  style: TextStyle(fontSize: 25),
                                ),
                                Text(" acessos realizados")
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 34.0, right: 34, top: 25, bottom: 25),
                              child: Text(
                                "Seus acessos diários",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CalendarFilterPage()),
                                    );
                                  },
                                  icon: Icon(Icons.filter_alt_outlined,
                                      color: Color(0xff208062))),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = 0;
                                });
                              },
                              child: Text(
                                "Acessos rápidos",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: selectedIndex == 0
                                        ? Color(0xff2CB289)
                                        : Colors.black),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = 1;
                                });
                              },
                              child: Text(
                                "Acessos longos",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: selectedIndex == 1
                                        ? Color(0xff2CB289)
                                        : Colors.black),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = 2;
                                });
                              },
                              child: Text(
                                "Análise",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: selectedIndex == 2
                                        ? Color(0xff2CB289)
                                        : Colors.black),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                            color: Color(0xffE8E8E8),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: _returnList()),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  height: 470,
                  top: -110,
                  //bottom: -219,
                  left: 50,
                  right: 40,

                  child: Image.asset(
                    'assets/home/circle.png',
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff2CB289),
          onPressed: () {
            controller.getAccess(events);

            print("POPULOOU " + controller.acessoCurto.toString());
            print("POPULOOU " + controller.acessoLongo.toString());
          },
          child: Icon(
            Icons.refresh,
          ),
          mini: true,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );

    // ignore: dead_code
    Widget CustomRadio(String text, int index) {
      return OutlineButton(
        onPressed: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Text(
          text,
          style: TextStyle(
              color: selectedIndex == index ? Color(0xff2CB289) : Colors.black),
        ),
      );
    }

    Widget AcessoRapido() {
      return ListView.builder(
          itemBuilder: (context, index) {
            List<String> titleList = events[index].packageName.split(".");
            return Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          titleList[titleList.length - 1],
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/home/clock.svg'),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${DateTime.fromMillisecondsSinceEpoch(int.parse(events[index].timeStamp)).toIso8601String()}",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text("Tempo de Uso")
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/home/seta.svg'),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  events[index].eventType,
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text("Quantidade de acessos")
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SvgPicture.asset('assets/home/emotions.svg'),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AppRegister(
                                      title: titleList[titleList.length - 1])),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xff333131)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Center(
                                child: Text(
                                  "Ver registro emocional",
                                  style: TextStyle(
                                      color: Color(0xff333131),
                                      fontSize: 14,
                                      decoration: TextDecoration.none),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AppRecord(
                                      title: titleList[titleList.length - 1])),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xff333131)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Center(
                                child: Text(
                                  "Adicionar Registro Emocional",
                                  style: TextStyle(
                                      color: Color(0xff333131),
                                      fontSize: 14,
                                      decoration: TextDecoration.none),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 2,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                ),
              ],
            );
          },
          itemCount: events.length);
    }
  }

  _acessoLongo() {
    return ListView.builder(
        itemBuilder: (context, index) {
          List<String> titleList = events[index].packageName.split(".");
          return Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titleList[titleList.length - 1],
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('assets/home/clock.svg'),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${DateTime.fromMillisecondsSinceEpoch(int.parse(events[index].timeStamp)).toIso8601String()}",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Text("Tempo de Uso")
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('assets/home/seta.svg'),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                events[index].eventType,
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Text("Quantidade de acessos")
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SvgPicture.asset('assets/home/emotions.svg'),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AppRegister(
                                    title: titleList[titleList.length - 1])),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff333131)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Center(
                              child: Text(
                                "Ver registro emocional",
                                style: TextStyle(
                                    color: Color(0xff333131),
                                    fontSize: 14,
                                    decoration: TextDecoration.none),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AppRecord(
                                    title: titleList[titleList.length - 1])),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff333131)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Center(
                              child: Text(
                                "Adicionar Registro Emocional",
                                style: TextStyle(
                                    color: Color(0xff333131),
                                    fontSize: 14,
                                    decoration: TextDecoration.none),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 2,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
              ),
            ],
          );
        },
        itemCount: events.length);
  }


  Widget _returnList() {
    if (selectedIndex == 0) {
      return _acessoLongo();
    } else if (selectedIndex == 1) {
      return _acessoLongo();
    } else {
      return Analise();
    }
  }
}
