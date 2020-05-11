import 'package:CodingPal/constants.dart';
import 'package:flutter/material.dart';
import 'home_page_cards.dart';

class HomePage extends StatelessWidget {
  static const String id = 'homepage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          style: kappheading,
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
                    platform: 'CODECHEF',
                  ),
                ),
                Expanded(
                  child: LogoCards(
                    logoname: 'codeforces.png',
                    platform: 'CODEFORCES',
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: LogoCards(
                    logoname: 'hackerearth.jpg',
                    platform: 'HACKEREARTH',
                  ),
                ),
                Expanded(
                  child: LogoCards(
                    logoname: 'hackerrank.png',
                    platform: 'HACKERRANK',
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: LogoCards(
                    logoname: 'leetcode.jpg',
                    platform: 'LEETCODE',
                  ),
                ),
                Expanded(
                  child: LogoCards(
                    logoname: 'topcoder.jpg',
                    platform: 'TOPCODER',
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
