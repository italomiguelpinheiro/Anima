import 'package:anima/app/modules/reminder/page/challange_page.dart';
import 'package:anima/app/modules/reminder/reminder_page.dart';
import 'package:flutter/material.dart';

class DescribePage extends StatefulWidget {
  const DescribePage({Key? key}) : super(key: key);

  @override
  _DescribePageState createState() => _DescribePageState();
}

class _DescribePageState extends State<DescribePage> {
  final _malef = TextEditingController();
  final _benef = TextEditingController();
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
                        Navigator.of(context).popUntil((route) => route.isFirst);
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
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right:20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Instagram", style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25),),
                    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_drop_down), iconSize: 60,)
                  ],
                ),
              ),
              Container(
                height: 2,
                width: MediaQuery.of(context).size.width,
                color: Color(0xffE8E8E8),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                        "Quais os malefícios em usar esse aplicativo?",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              TextFielDescription(
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _malef,
                  decoration: InputDecoration(
                      hintText: "Registre seu pensamento",
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 2,
                width: MediaQuery.of(context).size.width,
                color: Color(0xffE8E8E8),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                        "Quais os benefícios em não usar esse aplicativo?",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              TextFielDescription(
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _malef,
                  decoration: InputDecoration(
                      hintText: "Registre seu pensamento",
                      border: InputBorder.none),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class TextFielDescription extends StatelessWidget {
  final Widget child;
  const TextFielDescription({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        height: 200,
        width: size.width * 0.9,
        decoration: BoxDecoration(
          color: Color(0xffE8E8E8),
          borderRadius: BorderRadius.circular(5),
        ),
        child: child,
      ),
    );
  }
}
