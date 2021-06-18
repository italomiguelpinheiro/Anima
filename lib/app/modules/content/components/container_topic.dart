import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget containerTopic(String topic) {
  return Padding(
    padding: const EdgeInsets.only(right:8.0),
    child: FlatButton(
      height: 33,
      minWidth: 73,
      child: Text(topic),
      color: Color(0xffE8E8E8),
      onPressed: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );
}
