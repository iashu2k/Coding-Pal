import 'current_date_time.dart';
import 'platform_code.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ContestInfo {
  ContestInfo({this.platform});

  String platform;
  String currenttime = CurrentTime().get();
  String userid = 'iashu2k';
  String apiKey = '81c3bece1c696d9f9534fefc4b2627d54f396e0a';

  void livecontests() async {
    String reqplatform = platcode[platform];
    String url = '''
https://clist.by/api/v1/json/contest/?username=$userid&api_key=$apiKey&resource__id=$reqplatform&start__lt=$currenttime&end__gt=$currenttime&order_by=end''';
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
