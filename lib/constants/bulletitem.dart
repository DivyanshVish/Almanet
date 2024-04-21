import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class BulletText extends StatelessWidget {
  final String text;
  final double height;
  BulletText({ required this.text,required this.height} );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: height*0.004),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(

            margin: EdgeInsets.only(top: 5.0, right: 10.0),
            height: 6.0,
            width: 6.0,
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          ),
          Flexible(
            child: Text(
              text,
              softWrap: true,
              overflow: TextOverflow.visible,
            
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}