import 'package:flutter/cupertino.dart';

import 'current_date_time.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_config/flutter_config.dart';

class ContestInfo {
  

  
  CurrentTime currentTime = CurrentTime();
  String currenttime = CurrentTime().getcurrent();
  String nextmonth = CurrentTime().getnextMonth();


  Future contestslist() async {
    

    try {
      WidgetsFlutterBinding.ensureInitialized();
    await FlutterConfig.loadEnvVariables();

    String userid = FlutterConfig.get('USER_ID').toString();
    String apiKey = FlutterConfig.get('API_KEY').toString();
      String url = '''
https://clist.by/api/v1/json/contest/?username=$userid&api_key=$apiKey&end__gt=$currenttime&end__lt=$nextmonth&order_by=start''';
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      
      return jsonDecode(data);
    } else {
      print(response.statusCode);
      return 'not found';
    }
      
    } catch (e) {
      print(e);
      return 'not found';
    }
    
    
  }
}
