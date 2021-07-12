import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget cardEmotion(String app) {
  return Padding(
    padding: const EdgeInsets.only(right:8.0),
    child: 
    
    
    
    Column(
      children: [
        Container(
          height: 180,
          width: 170,
          decoration: BoxDecoration(
            color: Color(0xff2CB289),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(app, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),),
                SvgPicture.asset('assets/emotions/emotion_app.svg')
              ],
            ),
          )
        )
      ],
    ),
  );
}
