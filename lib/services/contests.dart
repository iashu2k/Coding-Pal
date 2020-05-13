import 'contestsinfo.dart';



class Contests {

  Contests({this.platform});
  String platform;
  
  

  Future allcontests() async{
    ContestInfo contest = ContestInfo(platform: platform);
    var contestData = await contest.contestslist();
    return contestData['objects'];
    

  }

   
  
}