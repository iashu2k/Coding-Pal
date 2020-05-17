import 'contestsinfo.dart';



class Contests {

  
  
  

  Future allcontests() async{
    ContestInfo contest = ContestInfo();
    var contestData = await contest.contestslist();
    return contestData['objects'] as List;
    

  }

   
  
}