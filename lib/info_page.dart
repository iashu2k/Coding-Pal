import 'package:CodingPal/constants.dart';
import 'package:flutter/material.dart';
import 'services/contests.dart';
//import 'package:auto_size_text/auto_size_text.dart';

class InfoPage extends StatelessWidget {
  InfoPage({this.platform, this.logoname});
  final String platform;
  final String logoname;

  @override
  Widget build(BuildContext context) {
    //Contests contests = Contests(platform: platform);
    //contests.allcontests();

    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
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
              ]),
        ],
      ),
      appBar: AppBar(),
    );
  }
}
