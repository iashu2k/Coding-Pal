import 'package:flutter/material.dart';
import 'package:CodingPal/constants.dart';
import 'package:intl/intl.dart';
import 'package:duration/duration.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:url_launcher/url_launcher.dart';

class ContestDisplayCard extends StatelessWidget {
  ContestDisplayCard({this.name, this.start, this.end, this.duration, this.link});
  final String name;
  final String start;
  final String end;
  final int duration;
  final String link;

  String compMonth(String compD) {
    return DateFormat.MMMM().format(DateTime.parse(compD));
  }

  String compDate(String compD) {
    return DateFormat.d().format(DateTime.parse(compD));
  }

  String compTime(String compT) {
    return DateFormat.jm().format(DateTime.parse(compT));
  }

  String compDay(String compDy) {
    return DateFormat.EEEE().format(DateTime.parse(compDy));
  }

  _launchURL() async {
  String url = link;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

  @override
  Widget build(BuildContext context) {
    var str = compMonth(start);
    var en = compMonth(end);
    var strdate = compDate(start);
    var endate = compDate(end);
    var strtime = compTime(start);
    var entime = compTime(end);
    var strDay = compDay(start);
    var enDay = compDay(end);
    String dur = printDuration(
      Duration(seconds: duration),
      abbreviated: true,
    );

    DateTime compStart = DateTime.parse(start);
    DateTime now = DateTime.now();
    int status = now.compareTo(compStart);
    Widget compStaus = (status >= 0)
        ? Text(
            'LIVE',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.lightGreenAccent,
              fontSize: 12.0,
            ),
          )
        : RawMaterialButton(
            onPressed: () {},
            fillColor: kscaffoldcolor,
            splashColor: kcardColor,
            shape: const StadiumBorder(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.event,
                    color: Colors.pinkAccent,
                  ),
                  Text(
                    ' Add to Calendar',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          );

    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0), color: kcardColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AutoSizeText(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 25, fontFamily: 'Raleway', color: Colors.tealAccent),
            maxLines: 2,
          ),
          SizedBox(
            height: 5.0,
          ),
          compStaus,
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      strDay.substring(0, 3).toUpperCase(),
                    ),
                    Text(
                      str.substring(0, 3) + ' ' + strdate,
                      style: kdates,
                    ),
                    Text(
                      strtime,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                  ),
                  child: Text(
                    dur,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      enDay.substring(0, 3).toUpperCase(),
                    ),
                    Text(
                      en.substring(0, 3) + ' ' + endate,
                      style: kdates,
                    ),
                    Text(
                      entime,
                    ),
                  ],
                ),
              ),
            ],
          ),
          InkWell(
            child: Text('Visit Page', style: TextStyle(color: Colors.orangeAccent, fontSize: 12),),
            onTap: () => _launchURL(),
            
            
            
          ),
        ],
      ),
    );
  }
}
