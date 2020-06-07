import 'package:CodingPal/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
        ClipRRect(
          borderRadius: BorderRadius.circular(24.0),
          child: Hero(
            tag: platform,
            child: Image.asset(
              'images/$logoname',
              height: 100.0,
              width: 100.0,
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        AutoSizeText(
          platform,
          style: kplatname,
          maxLines: 2,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
