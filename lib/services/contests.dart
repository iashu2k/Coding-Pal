import 'contestsinfo.dart';



class Contests {

  
  
  

  Future allcontests() async{
    ContestInfo contest = ContestInfo();
    var contestData = await contest.contestslist();
    if(contestData=='not found'){
      return 'error';
    }
    return contestData['objects'] as List;
    

  }

   
  
}