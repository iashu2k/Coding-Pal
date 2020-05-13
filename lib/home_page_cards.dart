import 'package:CodingPal/info_page.dart';
import 'package:flutter/material.dart';
import 'package:CodingPal/home_page_cardContent.dart';
import 'constants.dart';
import 'services/contests.dart';

class LogoCards extends StatelessWidget {
  LogoCards({this.logoname, this.platform});
  final String logoname;
  final String platform;
  @override
  Widget build(BuildContext context) {
    void handleList() async {
      var competitions = await Contests(platform: platform).allcontests();
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InfoPage(
              platform: platform,
              logoname: logoname,
              competitions: competitions,
            ),
          ));
    }

    return GestureDetector(
      onTap: () {
        handleList();
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
