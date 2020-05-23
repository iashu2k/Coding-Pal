import 'package:flutter/material.dart';
import 'package:CodingPal/constants.dart';
import 'package:intl/intl.dart';
import 'package:duration/duration.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'fancy_button.dart';
import 'package:add_2_calendar/add_2_calendar.dart';

class ContestDisplayCard extends StatelessWidget {
  ContestDisplayCard(
      {this.name, this.start, this.end, this.duration, this.link});
  final String name;
  final String start;
  final String end;
  final int duration;
  final String link;

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
    DateTime now = DateTime.now();
    var offset = Duration(seconds: now.timeZoneOffset.inSeconds);
    DateTime compStart = DateTime.parse(start).add(offset);
    DateTime compEnd = DateTime.parse(end).add(offset);
    var str = DateFormat.MMMM().format(compStart);
    var en = DateFormat.MMMM().format(compEnd);
    var strdate = DateFormat.d().format(compStart);
    var endate = DateFormat.d().format(compEnd);
    var strtime = DateFormat.jm().format(compStart);
    var entime = DateFormat.jm().format(compEnd);
    var strDay = DateFormat.EEEE().format(compStart);
    var enDay = DateFormat.EEEE().format(compEnd);
    String dur = printDuration(
      Duration(seconds: duration),
      abbreviated: true,
    );

    var offsethr = offset.inHours;
    var offsetmin = (offset.inMinutes) % 60;
    String offsetStr =
        'GMT+' + offsethr.toString() + ':' + offsetmin.toString();
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
        : FancyButton(
            icon: Icons.event,
            label: ' Add to Calendar',
            onPressed: () {
              final Event event = Event(
                  title: name,
                  description: link,
                  startDate: compStart,
                  endDate: compEnd,
                  timeZone: offsetStr);
              Add2Calendar.addEvent2Cal(event);
            },
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
          FancyButton(
              onPressed: () => _launchURL(),
              icon: Icons.open_in_new,
              label: ' Visit Page'),
        ],
      ),
    );
  }
}
