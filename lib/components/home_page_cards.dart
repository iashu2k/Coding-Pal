import 'package:flutter/material.dart';
import 'home_page_cardContent.dart';
import 'package:CodingPal/constants.dart';
import 'package:CodingPal/screens/info_page.dart';

class LogoCards extends StatelessWidget {
  LogoCards({this.logoname, this.platform, this.contests});
  final String logoname;
  final String platform;
  final contests;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InfoPage(
                platform: platform,
                logoname: logoname,
                competitions: contests,
              ),
            ));
      },
      child: Container(
        child: Cardcontent(
          logoname: logoname,
          platform: platform,
        ),
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: kcardColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
