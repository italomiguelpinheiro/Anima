import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:usage_stats/usage_stats.dart';
import 'home_controller.dart';

class HomePageView extends StatefulWidget {
  final String title;
  const HomePageView({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends ModularState<HomePageView, HomeController> {
  //use 'controller' variable to access controller
  late List<EventUsageInfo> events;
  late List<UsageInfo> usage;

  @override
  void initState() {
    initUsage();
    super.initState();
  }

  Future<void> initUsage() async {
    UsageStats.grantUsagePermission();
    DateTime endDate = new DateTime.now();
    DateTime startDate = DateTime(endDate.year, endDate.month, 09, 0, 0, 0);

    List<EventUsageInfo> queryEvents =
        await UsageStats.queryEvents(startDate, endDate);
    List<UsageInfo> usageStats =
        await UsageStats.queryUsageStats(startDate, endDate);

    this.setState(() {
      events = queryEvents.reversed.toList();
      usage = usageStats.reversed.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: null,
        body: Column(
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
                                  " DE JUNHO " +
                                  DateTime.now().year.toString(),
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.calendar_today_rounded,
                                  color: Colors.white)),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.person, color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  
                  
                  Center(
                    child: Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white
                          
                          
                        )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text(
                              "12h",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "30min",
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '''é o seu tempo diário\n   usando o celular
                      ''',
                    style: TextStyle(fontSize: 24),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("40", style: TextStyle(fontSize: 25),),
                      Text(" acessos realizados")
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        "Seus acessos diários",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.filter_alt_outlined,
                            color: Color(0xff208062)))
                  ],
                ),
                Container(
                    color: Color(0xffE8E8E8),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.41,
                    child: ListView.builder(
                        itemBuilder: (context, index) {
                          List<String> titleList =events[index].packageName.split("."); 
                          return ListTile(
                            title: Text(titleList[titleList.length -1]),
                            subtitle: Text(
                                "Last time used: ${DateTime.fromMillisecondsSinceEpoch(int.parse(events[index].timeStamp)).toIso8601String()}"),
                            trailing: Text(events[index].eventType),
                          );
                        },
                        itemCount: events.length)),
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff2CB289),
          onPressed: () {
            print("presio");
            initUsage();
          },
          child: Icon(
            Icons.refresh,
          ),
          mini: true,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
