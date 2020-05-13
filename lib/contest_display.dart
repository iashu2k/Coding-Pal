import 'package:flutter/material.dart';
import 'package:CodingPal/constants.dart';
import 'package:intl/intl.dart';
import 'package:duration/duration.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ContestDisplayCard extends StatelessWidget {
  ContestDisplayCard({this.name, this.start, this.end, this.duration});
  final String name;
  final String start;
  final String end;
  final int duration;

  String compDate(String compD) {
    return DateFormat.MMMMd().format(DateTime.parse(compD));
  }

  String compTime(String compT) {
    return DateFormat.jm().format(DateTime.parse(compT));
  }

  String compDay(String compDy) {
    return DateFormat.EEEE().format(DateTime.parse(compDy));
  }

  @override
  Widget build(BuildContext context) {
    var str = compDate(start);
    var en = compDate(end);
    var strtime = compTime(start);
    var entime = compTime(end);
    var strDay = compDay(start);
    var enDay = compDay(end);
    var dur = Duration(seconds: duration);
    DateTime compStart = DateTime.parse(start);
    DateTime now = DateTime.now();
    int status = now.compareTo(compStart);
    String compStaus = (status >= 0)
        ? 'LIVE'
        : printDuration(
            now.difference(compStart),
            abbreviated: true,
          );

    var colour = (compStaus == 'LIVE') ? Colors.greenAccent : Colors.blue.shade200;
    IconData reminder = (compStaus == 'LIVE') ? Icons.open_in_new : Icons.calendar_today;

    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0), color: kcardColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            compStaus,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: colour,
              fontSize: 12.0,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          // Text(
          //   name,
          //   style: kcontestname,
          //   textAlign: TextAlign.center,

          // ),
          AutoSizeText(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, fontFamily: 'Raleway', color: Colors.tealAccent),
            maxLines: 2,
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    strDay.substring(0, 3).toUpperCase(),
                  ),
                  Text(
                    str,
                    style: kdates,
                  ),
                  Text(
                    strtime,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    printDuration(dur, abbreviated: true),
                  ),
                  SizedBox(height: 10,),
                  CircleAvatar(
                    radius: 20.0,
                    backgroundColor: kscaffoldcolor,
                    child: Icon(
                      reminder,
                      color: Colors.pink,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    enDay.substring(0, 3).toUpperCase(),
                  ),
                  Text(
                    en,
                    style: kdates,
                  ),
                  Text(
                    entime,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
