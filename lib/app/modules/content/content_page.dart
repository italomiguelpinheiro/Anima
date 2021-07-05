import 'package:anima/app/modules/content/components/content_scroller.dart';
import 'package:anima/app/modules/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'components/container_topic.dart';
import 'content_controller.dart';

class ContentPage extends StatefulWidget {
  final String title;
  const ContentPage({Key? key, this.title = "Content"}) : super(key: key);

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends ModularState<ContentPage, ContentController> {
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
                  " DE JULHO " +
                  DateTime.now().year.toString(),
              style: TextStyle(color: Colors.white, fontSize: 12),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            padding: EdgeInsets.zero,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
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
            Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/content/cel.png',
                  fit: BoxFit.cover,
                )),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Chega de espiadinha!",
                style: TextStyle(
                  color: Color(0xff208062),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                "5 passos para pensar menos em notificações.",
                style: TextStyle(),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: Color(0xffE8E8E8),
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
                        containerTopic("podcast"),
                        containerTopic("artigos"),
                        containerTopic("equilibrio"),
                        containerTopic("produtividade"),
                        containerTopic("remoçar"),
                        containerTopic("celular"),
                        containerTopic("insonia"),
                        containerTopic("ansiedade"),
                        containerTopic("emocoes"),
                      ],
                    ),
                  )),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Seus últimos acessos",
                    style: TextStyle(fontSize: 20),
                  ),
                  GestureDetector(
                    child: Text("VER TUDO",
                        style: TextStyle(
                            color: Color(0xff208062),
                            fontWeight: FontWeight.w700)),
                    onTap: () {},
                  )
                ],
              ),
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
                        contentScroller(
                            context,
                            SvgPicture.asset(
                                'assets/content/content_image.svg'),
                            "Abstinencia de redes",
                            "Nesse programa falamos sobre vontade de se desconectar..."),
                        contentScroller(
                            context,
                            SvgPicture.asset(
                                'assets/content/content_image.svg'),
                            "Vida Off",
                            "Nesse programa falamos sobre vontade de se desconectar..."),
                        contentScroller(
                            context,
                            SvgPicture.asset(
                                'assets/content/content_image.svg'),
                            "Abstinencia de redes",
                            "Nesse programa falamos sobre vontade de se desconectar..."),
                        contentScroller(
                            context,
                            SvgPicture.asset(
                                'assets/content/content_image.svg'),
                            "Abstinencia de redes",
                            "Nesse programa falamos sobre vontade de se desconectar..."),
                        contentScroller(
                            context,
                            SvgPicture.asset(
                                'assets/content/content_image.svg'),
                            "Abstinencia de redes",
                            "Nesse programa falamos sobre vontade de se desconectar..."),
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Que tal uma leitura hoje?",
                    style: TextStyle(fontSize: 20),
                  ),
                  GestureDetector(
                    child: Text("VER TUDO",
                        style: TextStyle(
                            color: Color(0xff208062),
                            fontWeight: FontWeight.w700)),
                    onTap: () {},
                  )
                ],
              ),
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
                        contentScroller(
                            context,
                            SvgPicture.asset(
                                'assets/content/content_image.svg'),
                            "Leituras Minimalistas",
                            "Nesse programa falamos sobre vontade de se desconectar..."),
                        contentScroller(
                            context,
                            SvgPicture.asset(
                                'assets/content/content_image.svg'),
                            "Vida Off",
                            "Nesse programa falamos sobre vontade de se desconectar..."),
                        contentScroller(
                            context,
                            SvgPicture.asset(
                                'assets/content/content_image.svg'),
                            "Abstinencia de redes",
                            "Nesse programa falamos sobre vontade de se desconectar..."),
                        contentScroller(
                            context,
                            SvgPicture.asset(
                                'assets/content/content_image.svg'),
                            "Abstinencia de redes",
                            "Nesse programa falamos sobre vontade de se desconectar..."),
                        contentScroller(
                            context,
                            SvgPicture.asset(
                                'assets/content/content_image.svg'),
                            "Abstinencia de redes",
                            "Nesse programa falamos sobre vontade de se desconectar..."),
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Um podcast para animar?",
                    style: TextStyle(fontSize: 20),
                  ),
                  GestureDetector(
                    child: Text("VER TUDO",
                        style: TextStyle(
                            color: Color(0xff208062),
                            fontWeight: FontWeight.w700)),
                    onTap: () {},
                  )
                ],
              ),
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
                        contentScroller(
                            context,
                            SvgPicture.asset(
                                'assets/content/content_image.svg'),
                            "Leituras Minimalistas",
                            "Nesse programa falamos sobre vontade de se desconectar..."),
                        contentScroller(
                            context,
                            SvgPicture.asset(
                                'assets/content/content_image.svg'),
                            "Vida Off",
                            "Nesse programa falamos sobre vontade de se desconectar..."),
                        contentScroller(
                            context,
                            SvgPicture.asset(
                                'assets/content/content_image.svg'),
                            "Abstinencia de redes",
                            "Nesse programa falamos sobre vontade de se desconectar..."),
                        contentScroller(
                            context,
                            SvgPicture.asset(
                                'assets/content/content_image.svg'),
                            "Abstinencia de redes",
                            "Nesse programa falamos sobre vontade de se desconectar..."),
                        contentScroller(
                            context,
                            SvgPicture.asset(
                                'assets/content/content_image.svg'),
                            "Abstinencia de redes",
                            "Nesse programa falamos sobre vontade de se desconectar..."),
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
