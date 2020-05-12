import 'package:flutter/material.dart';
import 'constants.dart';

class ContestDisplay extends StatelessWidget {
  const ContestDisplay({
    Key key,
    @required this.logoname,
    @required this.platform,
  }) : super(key: key);

  final String logoname;
  final String platform;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 30.0,
            child: ClipOval(
              child: Image.asset(
                'images/$logoname',
              ),
            ),
          ),
          SizedBox(
            width: 15.0,
          ),
          Text(
            platform,
            style: kinfoheading,
          ),
        ]);
  }
}