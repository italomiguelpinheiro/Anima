import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:usage_stats/usage_stats.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  late List<EventUsageInfo>  events;
  late List<UsageInfo>  usage;

  @override
  void initState() {
    super.initState();
    initUsage();
  }

  Future<void> initUsage() async {
    UsageStats.grantUsagePermission();
    DateTime endDate = new DateTime.now();
    DateTime startDate = DateTime(endDate.year, endDate.month, 09, 0, 0, 0);

    List<EventUsageInfo> queryEvents = await UsageStats.queryEvents(startDate, endDate);
    List<UsageInfo> usageStats = await UsageStats.queryUsageStats(startDate, endDate);

    this.setState(() {
      events = queryEvents.reversed.toList();
      usage = usageStats.reversed.toList();
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.highlight_off), onPressed: controller.logout),
        title: Text(widget.title),
      ),
            body: Container(
            child: ListView.separated(
                itemBuilder: (context, index) {
                 print(usage[index].packageName);
                 print(usage[index].totalTimeInForeground);
                  return ListTile(
                    title: Text(events[index].packageName),
                    subtitle: Text(
                        "length ${events.length}"),
                    trailing: Text("${events[index].eventType}"),
                  );
                  
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: events.length)),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            initUsage();
          },
          child: Icon(
            Icons.refresh,
          ),
          mini: true,
        ),
    );
  }
}
