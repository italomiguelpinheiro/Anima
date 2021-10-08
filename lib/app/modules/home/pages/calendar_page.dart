import 'package:anima/app/modules/home/pages/calendar.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarFilterPage extends StatefulWidget {
  const CalendarFilterPage({Key? key}) : super(key: key);

  @override
  _CalendarFilterPageState createState() => _CalendarFilterPageState();
}

class _CalendarFilterPageState extends State<CalendarFilterPage> {
  List selecionadas = [];
  @override
  Widget build(BuildContext context) {
    double top = MediaQuery.of(context).size.height * 0.4;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 20, top: 20, bottom: 5),
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
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Calendar(),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Períodos de tempo",
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _customFlatButtom('Hoje'),
                    _customFlatButtom('Semanal'),
                    _customFlatButtom('Quinzenal'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _customFlatButtom('Mensal'),
                    _customFlatButtom('Últimos 3 meses'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _customFlatButtom('Últimos 6 meses'),
                    _customFlatButtom('1 ano'),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Turnos",
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _customFlatButtom('Dia inteiro'),
                    _customFlatButtom('Madrugada'),
                    _customFlatButtom('Manhã'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _customFlatButtom('Tarde'),
                    _customFlatButtom('Noite'),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Momento do Registro",
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _customFlatButtom('5 minutos'),
                    _customFlatButtom('30 minutos'),
                    _customFlatButtom('60 minutos'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _customFlatButtom('120 minutos'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 50.0),
                child: FlatButton(
                    minWidth: MediaQuery.of(context).size.width * 0.95,
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    color: Color(0xff2CB289),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Aplicar",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
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
          if (find == true) {
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

  Color returnColor(String name) {
    return selecionadas.contains(name) ? Color(0xff2CB289) : Color(0xffE8E8E8);
  }
}
