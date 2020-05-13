import 'package:flutter/material.dart';
import 'package:CodingPal/constants.dart';
import 'package:intl/intl.dart';
import 'package:duration/duration.dart';

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

  @override
  Widget build(BuildContext context) {
    var str = compDate(start);
    var en = compDate(end);
    var strtime = compTime(start);
    var entime = compTime(end);
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

    return Container(
      margin: EdgeInsets.all(20.0),
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
              color: Colors.green,
              fontSize: 12.0,
            ),
          ),
          Text(
            name,
            style: kcontestname,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                str,
                style: kdates,
              ),
              Text(
                printDuration(dur, abbreviated: true),
                style: kdates,
              ),
              Text(
                en,
                style: kdates,
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                strtime,
                style: kdates,
              ),
              CircleAvatar(
                radius: 20.0,
                backgroundColor: kscaffoldcolor,
                child: Icon(
                  Icons.calendar_today,
                  color: Colors.pink,
                ),
              ),
              Text(
                entime,
                style: kdates,
              ),
            ],
          )
        ],
      ),
    );
  }
}
