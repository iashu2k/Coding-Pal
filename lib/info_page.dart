import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'contest_display.dart';
import 'constants.dart';
import 'services/platform_code.dart';

class InfoPage extends StatelessWidget {
  InfoPage({this.platform, this.logoname, this.competitions});
  final String platform;
  final String logoname;
  final competitions;

  @override
  Widget build(BuildContext context) {
    var filteredList = competitions
        .where((val) => val['resource']['id'] == platcode[platform])
        .toList();
    Widget show = (filteredList.length == 0)
        ? SliverFillRemaining(
            child: Center(child: Text('Oops! No Contests Available :(')),
          )
        : SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ContestDisplayCard(
                name: filteredList[index]['event'],
                start: filteredList[index]['start'],
                end: filteredList[index]['end'],
                duration: filteredList[index]['duration'],
                link: filteredList[index]['href'],
              ),
              childCount: filteredList.length,
            ),
          );

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: AutoSizeText(
                platform,
                style: kinfoheading,
                maxLines: 2,
                textAlign: TextAlign.center,
                minFontSize: 5,
              ),
              background: Row(
                children: <Widget>[
                  Spacer(),
                  ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
                  child: Hero(
                    tag: platform,
                                      child: Image.asset(
              'images/$logoname', height: 130.0, width: 130.0,
          ),
                  ),
        ),
                  Spacer(),
                ],
              ),
            ),
            expandedHeight: 200,
          ),
          show,
        ],
      ),
    );
  }
}
