import 'contestsinfo.dart';

class Contests {

  Contests({this.platform});
  String platform;

  void allcontests() async{
    ContestInfo contest = ContestInfo(platform: platform);
    var contestData = await contest.contestslist();
    var list = contestData['objects'];
    
    for (var x = 0; x < list.length; x++) {
    print(list[x]['event']);
  }
  }

   
  
}