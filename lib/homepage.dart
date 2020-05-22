import 'package:CodingPal/constants.dart';
import 'package:flutter/material.dart';
import 'home_page_cards.dart';
import 'platformlist.dart';

class HomePage extends StatelessWidget {
  static const String id = 'homepage';
  HomePage({this.contests});
  final contests;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Center(
          child: Text(
            'CodingPal',
            style: kappheading,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: platforms.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return PlatformList(
              logo1: platforms[index].logo1,
              logo2: platforms[index].logo2,
              name1: platforms[index].name1,
              name2: platforms[index].name2,
              contests: contests,
            );
          }),
    );
  }
}

class PlatformList extends StatelessWidget {
  PlatformList({this.logo1, this.name1, this.logo2, this.name2, this.contests});
  final String logo1;
  final String name1;
  final String logo2;
  final String name2;
  final contests;

  @override
  Widget build(BuildContext context) {
    return Row(
      
      children: <Widget>[
        Expanded(
          child: LogoCards(
            logoname: logo1,
            platform: name1,
            contests: contests,
          ),
        ),
        Expanded(
          child: LogoCards(
            logoname: logo2,
            platform: name2,
            contests: contests,
          ),
        )
      ],
    );
  }
}
