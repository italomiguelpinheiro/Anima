import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget contentScroller(
    BuildContext context, SvgPicture asset, String title, String description) {
  return Container(
    margin:  new EdgeInsets.all(0.0),
    width: 180,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        asset,
        SizedBox(height: 5),
        Text(
          title,
          style:
              TextStyle(color: Color(0xff208062), fontWeight: FontWeight.w600),
        ),
        Text(
          description,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border_outlined, color: Color(0xff208062),
              ),
              padding: new EdgeInsets.all(0.0),
              splashRadius: 1,
            ),
            IconButton(
              
              splashRadius: 1,
              onPressed: () {},
              icon: Icon(Icons.share,  color: Color(0xff208062),),
              padding: new EdgeInsets.all(0.0),
            )
          ],
        ),
      ],
    ),
  );
}
