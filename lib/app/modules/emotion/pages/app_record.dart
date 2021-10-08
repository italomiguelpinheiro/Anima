import 'package:anima/app/modules/emotion/components/container_app.dart';
import 'package:anima/app/modules/emotion/components/radio_status.dart';
import 'package:anima/app/modules/emotion/emotion_controller.dart';
import 'package:anima/app/modules/reminder/components/custom_switch.dart';
import 'package:anima/app/shared/models/emotion_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppRecord extends StatefulWidget {
  final String title;
  const AppRecord({Key? key, required this.title}) : super(key: key);

  @override
  _AppRecordState createState() => _AppRecordState();
}

class _AppRecordState extends State<AppRecord> {
  late List selecionadas = [];
  final _description = TextEditingController();
  final _controller = Modular.get<EmotionController>();
  late EmotionStatus status = EmotionStatus.Alegre;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
              child: Column(children: [
        Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, right: 20, left: 10),
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
                        _controller.addEmotion(
                            widget.title,
                            status,
                            DateTime.now().toString(),
                            selecionadas.toString(),
                            _description.text);
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.check,
                        size: 40,
                        color: Color(0xff208062),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    DateTime.now().day.toString() +
                        " DE JULHO " +
                        DateTime.now().year.toString(),
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 2,
          width: MediaQuery.of(context).size.width,
          color: Color(0xffE8E8E8),
        ),
        SizedBox(
          height: 40,
        ),
        /* Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Emoções registradas",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, left: 12.0),
                        child: Row(
                          children: [
                            containerApp('assets/emotions/joy.svg'),
                            containerApp('assets/emotions/sadness.svg'),
                            containerApp('assets/emotions/joy.svg'),
                            containerApp('assets/emotions/sadness.svg')
                          ],
                        ),
                      ),
                    )),
                    Irritado,
  Alegre,
  Triste,
  Entediado,
  Surpreso,
  Motivado,
  Preocupado,
  Inspirado,
  Assustado,
  Nostalgico,
  Com_Nojo,
  Frustrado
              ),*/

        Row(
          children: [
            Container(
              height: 345,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                children: [
                  RadioListTile(
                    activeColor: Color(0xff2CB289),
                    value: EmotionStatus.Alegre,
                    groupValue: status,
                    onChanged: (val) {
                      status = val as EmotionStatus;
                      setState(() {});
                    },
                    title: Text("Alegre"),
                  ),
                  RadioListTile(
                    activeColor: Color(0xff2CB289),
                    value: EmotionStatus.Triste,
                    groupValue: status,
                    onChanged: (val) {
                      status = val as EmotionStatus;
                      setState(() {});
                    },
                    title: Text("Triste"),
                  ),
                  RadioListTile(
                    activeColor: Color(0xff2CB289),
                    value: EmotionStatus.Entediado,
                    groupValue: status,
                    onChanged: (val) {
                      status = val as EmotionStatus;
                      setState(() {});
                    },
                    title: Text("Entendiado"),
                  ),
                  RadioListTile(
                    activeColor: Color(0xff2CB289),
                    value: EmotionStatus.Surpreso,
                    groupValue: status,
                    onChanged: (val) {
                      status = val as EmotionStatus;
                      setState(() {});
                    },
                    title: Text("Surpreso"),
                  ),
                  RadioListTile(
                    activeColor: Color(0xff2CB289),
                    value: EmotionStatus.Motivado,
                    groupValue: status,
                    onChanged: (val) {
                      status = val as EmotionStatus;
                      setState(() {});
                    },
                    title: Text("Motivado"),
                  ),
                  RadioListTile(
                    activeColor: Color(0xff2CB289),
                    value: EmotionStatus.Preocupado,
                    groupValue: status,
                    onChanged: (val) {
                      status = val as EmotionStatus;
                      setState(() {});
                    },
                    title: Text("Preocupado"),
                  ),
                ],
              ),
            ),
            Container(
              height: 345,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                children: [
                  RadioListTile(
                    activeColor: Color(0xff2CB289),
                    value: EmotionStatus.Inspirado,
                    groupValue: status,
                    onChanged: (val) {
                      status = val as EmotionStatus;
                      setState(() {});
                    },
                    title: Text("Inspirado"),
                  ),
                  RadioListTile(
                    activeColor: Color(0xff2CB289),
                    value: EmotionStatus.Assustado,
                    groupValue: status,
                    onChanged: (val) {
                      status = val as EmotionStatus;
                      setState(() {});
                    },
                    title: Text("Assustado"),
                  ),
                  RadioListTile(
                    activeColor: Color(0xff2CB289),
                    value: EmotionStatus.Nostalgico,
                    groupValue: status,
                    onChanged: (val) {
                      status = val as EmotionStatus;
                      setState(() {});
                    },
                    title: Text("Nostalgico"),
                  ),
                  RadioListTile(
                    activeColor: Color(0xff2CB289),
                    value: EmotionStatus.Com_Nojo,
                    groupValue: status,
                    onChanged: (val) {
                      status = val as EmotionStatus;
                      setState(() {});
                      print(status);
                    },
                    title: Text("Com Nojo"),
                  ),
                  RadioListTile(
                    activeColor: Color(0xff2CB289),
                    value: EmotionStatus.Frustrado,
                    groupValue: status,
                    onChanged: (val) {
                      status = val as EmotionStatus;
                      setState(() {});
                    },
                    title: Text("Frustado"),
                  ),
                  RadioListTile(
                    activeColor: Color(0xff2CB289),
                    value: EmotionStatus.Irritado,
                    groupValue: status,
                    onChanged: (val) {
                      status = val as EmotionStatus;
                      setState(() {});
                    },
                    title: Text("Irritado"),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 2,
          width: MediaQuery.of(context).size.width,
          color: Color(0xffE8E8E8),
        ),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  "A quais tipos de conteúdo você foi exposto?",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              _customFlatButtom('Política'),
              _customFlatButtom('Jogos'),
              _customFlatButtom('Comida'),
              _customFlatButtom('LGBT'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              _customFlatButtom('Clima'),
              _customFlatButtom('Preconceito'),
              _customFlatButtom('Celebridades'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              _customFlatButtom('Humo'),
              _customFlatButtom('Violência'),
              _customFlatButtom('Horoscopo'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              _customFlatButtom('Religião'),
              _customFlatButtom('Festas'),
              _customFlatButtom('Turismo'),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 2,
          width: MediaQuery.of(context).size.width,
          color: Color(0xffE8E8E8),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  "Quais pensamentos passaram na sua mente ao utilizar o aplicativo?",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
        TextFielDescription(
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            controller: _description,
            decoration: InputDecoration(
                hintText: "Registre seu pensamento", border: InputBorder.none),
          ),
        ),
      ]))),
    );
  }

  _buildRadioStatus(EmotionStatus emotionState, EmotionStatus group,
      Function setState, String emotion) {
    return RadioStatus();

/*
  Row(
                    children: [
                      Radio(
                          activeColor: Color(0xff2CB289),
                          value: emotionState,
                          groupValue: group,
                          onChanged: (val) {
                            group = val as EmotionStatus;
                            setState;
                            print(group);
                          }),
                      Text(
                        emotion,
                        style: TextStyle(fontSize: 20),
                      ),

                      //Radio(value: value, groupValue: groupValue, onChanged: onChanged)
                    ],
                  );*/
  }

  Color returnColor(String name) {
    return selecionadas.contains(name) ? Color(0xff2CB289) : Color(0xffE8E8E8);
  }

  _customFlatButtom(String str) {
     bool find = false;
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        onPressed: () {
          print(selecionadas);
          setState(() {
            if (selecionadas.contains(str)) {
              selecionadas.remove(str);
              find = true;
              
              // selecionadas = selecionadas;
            }
          });
          print(" REMOVEU: {$str} - " + selecionadas.toString());
          //selecionadas = [];
          print("MEIO " + selecionadas.toString());
          print("MEIO adi " + selecionadas.toString());
          print("MEIO dentro " + selecionadas.toString());

          setState(() {
            selecionadas.add(str);
          });
          if (find == true){
            selecionadas.remove(str);
            
          }
          print("FIM" + selecionadas.toString());

          print("--------------------------------");
        },
        color:
            selecionadas.contains(str) ? Color(0xff2CB289) : Color(0xffE8E8E8),
        child: Text(str),
      ),
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
