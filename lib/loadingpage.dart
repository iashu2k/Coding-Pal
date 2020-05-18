import 'package:CodingPal/homepage.dart';
import 'package:flutter/material.dart';
import 'services/contests.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    var contents = await contests.allcontests();

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                  contests: contents,
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
