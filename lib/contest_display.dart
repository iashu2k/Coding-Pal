import 'package:flutter/material.dart';
import 'package:CodingPal/constants.dart';

class ContestDisplayCard extends StatelessWidget {
  const ContestDisplayCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            'LIVE',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.green,
              fontSize: 10.0,
            ),
          ),
          Text(
            'MAY LONG CHALLENGE',
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
                'May 2',
                style: kdates,
              ),
              Text(
                '10 Days',
                style: kdates,
              ),
              Text(
                'May 12',
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
                '15:00 hrs',
                style: kdates,
              ),
              CircleAvatar(
                radius: 20.0,
                backgroundColor: kscaffoldcolor,
                child: Icon(
                  Icons.calendar_today,
                  semanticLabel: 'Add to Calender',
                  color: Colors.pink,
                ),
              ),
              Text(
                '15:00 hrs',
                style: kdates,
              ),
            ],
          )
        ],
      ),
    );
  }
}
