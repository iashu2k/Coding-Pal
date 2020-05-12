import 'package:CodingPal/constants.dart';
import 'package:flutter/material.dart';
import 'services/contests.dart';
import 'contest_header.dart';
import 'contest_display.dart';

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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            child: ContestDisplay(logoname: logoname, platform: platform),
          ),
          ContestDisplayCard(),
        ],
      ),
      appBar: AppBar(),
    );
  }
}

