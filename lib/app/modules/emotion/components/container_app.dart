import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget containerApp(String pic) {
  return Padding(
    padding: const EdgeInsets.only(right: 10.0),
    child: Column(
      children: [
        Container(
          height: 120,
          width: 240,
          decoration: BoxDecoration(
            color: Color(0xffE8E8E8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  pic,
                ),
                Padding(
                  padding: const EdgeInsets.only(left:10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.access_time),
                          Container(
                            width: 80,
                            child: Text("HORÁRIO DO REGISTRO", style: TextStyle(fontSize: 8),),
                          )
                        ],
                      ),
                      Text(
                        "06h:35min",
                        style: TextStyle(fontSize: 28),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
