import 'package:CodingPal/homepage.dart';
import 'package:flutter/material.dart';
import 'services/contests.dart';

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

  void getdata() async{
    Contests contests = Contests();
    var contents = await contests.allcontests();    
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomePage(
        contests: contents,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}