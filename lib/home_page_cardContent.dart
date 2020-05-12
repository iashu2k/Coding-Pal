import 'package:CodingPal/constants.dart';
import 'package:flutter/material.dart';

class Cardcontent extends StatelessWidget {
  Cardcontent({this.logoname, this.platform});
  final String logoname;
  final String platform;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 60.0,
          backgroundColor: kcardColor,
          child: ClipOval(
            child: Image.asset(
              'images/$logoname',
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          platform,
          style: kplatname,
        )
      ],
    );
  }
}
