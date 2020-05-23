import 'contestsinfo.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Contests {

  addStringToSF(String string) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('json', string);
  }

  adddatetimeToSF(String date) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('datetime', date);
  }

  getStringValuesSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String json = prefs.getString('json');
  return json;
  }

  getdatetimeValuesSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String datetime = prefs.getString('datetime');
  return datetime;
  }  
  

  Future allcontests() async{
    ContestInfo contest = ContestInfo();
    var contestData = await contest.contestslist();
    if(contestData=='not found'){
      return 'error';
    }
    return contestData;

  }

   
  
}