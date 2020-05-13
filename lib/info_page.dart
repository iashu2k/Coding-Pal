import 'package:flutter/material.dart';
import 'contest_display.dart';
import 'constants.dart';

class InfoPage extends StatelessWidget {
  InfoPage({this.platform, this.logoname, this.competitions});
  final String platform;
  final String logoname;
  final competitions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                platform,
                style: kinfoheading,
              ),
              background: Row(
                children: <Widget>[
                  Spacer(),
                  CircleAvatar(
                    radius: 68.0,
                    child: ClipOval(
                      child: Image.asset(
                        'images/$logoname',
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            expandedHeight: 200,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ContestDisplayCard(
                name: competitions[index]['event'],
                start: competitions[index]['start'],
                end: competitions[index]['end'],
                duration: competitions[index]['duration'],
              ),
              childCount: competitions.length,
            ),
          ),
        ],
      ),
    );
  }
}
