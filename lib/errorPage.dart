import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'loadingpage.dart';


class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff080210),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(flex: 5, child: Image.asset('images/astronaut.jpg')),
            Expanded(flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20.0),
                  AutoSizeText('Can\'t Connect to Server'),
                  SizedBox(height: 20.0),            
                  FloatingActionButton(onPressed: (){
                    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => LoadingPage()
                ));
                  }, child: Icon(Icons.replay),),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
