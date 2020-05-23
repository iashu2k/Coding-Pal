import 'package:CodingPal/homepage.dart';
import 'package:flutter/material.dart';
import 'services/contests.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'errorPage.dart';
import 'dart:convert';


class LoadingPage extends StatefulWidget {
  static const String id = 'loading_page';

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    getdata();
  }

  void getdata() async {
    
    Contests contests = Contests();
    var lastUpdated = await contests.getdatetimeValuesSF();
    var contents;
    if(lastUpdated==null){
      contests.adddatetimeToSF(DateTime.now().toString());
      contents = await contests.allcontests();
      contests.addStringToSF(contents);
    }else{
      DateTime prev = DateTime.parse(lastUpdated);
      DateTime now = DateTime.now();
      var dur = now.difference(prev).inMinutes;

      if(dur>10){
        contests.adddatetimeToSF(DateTime.now().toString());
        contents = await contests.allcontests();
        contests.addStringToSF(contents);
      }else{
        contents = await contests.getStringValuesSF();
      }
    } 

  

    (contents=='error')?Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => ErrorPage()
                )):
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                  contests: jsonDecode(contents)['objects'] as List,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: <Widget>[
          Image.asset('images/cp.png', height: 200, width: 200,),
          SpinKitFadingFour(
            color: Colors.white,
            size: 25.0,
          ),
        ],
      ),
    );
  }
}
