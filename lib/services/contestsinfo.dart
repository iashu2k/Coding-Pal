import 'current_date_time.dart';
import 'platform_code.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ContestInfo {
  ContestInfo({this.platform});

  String platform;
  CurrentTime currentTime = CurrentTime();
  String currenttime = CurrentTime().getcurrent();
  String nextmonth = CurrentTime().getnextMonth();
  String userid = 'iashu2k';
  String apiKey = '81c3bece1c696d9f9534fefc4b2627d54f396e0a';

  Future contestslist() async {
    String reqplatform = platcode[platform];
    String url = '''
https://clist.by/api/v1/json/contest/?username=$userid&api_key=$apiKey&resource__id=$reqplatform&end__gt=$currenttime&end__lt=$nextmonth&order_by=end''';
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
