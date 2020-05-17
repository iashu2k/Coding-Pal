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
    
    
    var filteredList = competitions.where((val) => val['resource']['id']==platcode[platform]).toList();
    
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
                  CircleAvatar(
                    radius: 68.0,
                    backgroundColor: kscaffoldcolor,
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
                name: filteredList[index]['event'],
                start: filteredList[index]['start'],
                end: filteredList[index]['end'],
                duration: filteredList[index]['duration'],
                link: filteredList[index]['href'],
              ),
              childCount: filteredList.length,
            ),
          ),
        ],
      ),
    );
  }
}
