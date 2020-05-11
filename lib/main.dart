import 'package:flutter/material.dart';
import 'constants.dart';

void main() {
  runApp(CodingPal());
}

class CodingPal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            CircleAvatar(
              radius: 18,
              child: ClipOval(
                child: Image.network(
                  'https://www.tuktukdesign.com/wp-content/uploads/2020/01/profile-icon-vector.jpg',
                ),
              ),
            ),
            SizedBox(
              width: 15.0,
            ),
          ],
          title: Text(
            'CodingPal',
            style: TextStyle(
              fontFamily: 'PressStart2P',
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: LogoCards(
                      logoname: 'codechef.jpg',
                    ),
                  ),
                  Expanded(
                    child: LogoCards(
                      logoname: 'codeforces.png',
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  LogoCards(
                    logoname: 'hackerearth.png',
                  ),
                  LogoCards(
                    logoname: 'hackerrank.png',
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  LogoCards(
                    logoname: 'leetcode.jpg',
                  ),
                  LogoCards(
                    logoname: 'topcoder.jpg',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LogoCards extends StatelessWidget {
  LogoCards({this.logoname});
  final String logoname;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'images/$logoname',
        width: 120.0,
        height: 120.0,
      ),
      margin: EdgeInsets.all(15.0),
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: kcardColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
