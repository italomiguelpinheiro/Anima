import 'package:anima/app/shared/models/emotion_model.dart';
import 'package:anima/app/shared/models/emotion_model.dart';
import 'package:flutter/material.dart';

class RadioStatus extends StatefulWidget {

   final EmotionStatus status = EmotionStatus.Alegre;
  final String emotion = '';
  final EmotionStatus group = EmotionStatus.Alegre;


 const RadioStatus({ Key? key , status, group, emotion}) : super(key: key); 
 

  @override
  _RadioStatusState createState() => _RadioStatusState();
}

class _RadioStatusState extends State<RadioStatus> {

  late EmotionStatus sts = widget.status;
  late String emot = widget.emotion;
  
  
  

  @override
  Widget build(BuildContext context) {
  return Row(
                    children: [
                      Radio(
                          activeColor: Color(0xff2CB289),
                          value: widget.status,
                          groupValue: widget.group,
                          onChanged: (val) {
                          print(emot);
                            setState(() {
                            sts = val as EmotionStatus; 
                            });

                            print(sts);
                          }),
                      Text(
                        emot,
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),

                      //Radio(value: value, groupValue: groupValue, onChanged: onChanged)
                    ],
                  );


  }
}
