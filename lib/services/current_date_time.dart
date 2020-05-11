
class CurrentTime{
  String get(){
        DateTime now = new DateTime.now();
        DateTime date = new DateTime(now.year, now.month, now.day, now.hour, now.minute, now.second);


        String datetime = date.year.toString()+'-'+date.month.toString()+'-'+date.day.toString()+'T'+date.hour.toString()+'%3A'+date.minute.toString()+'%3A'+date.second.toString();
       
        return datetime;
  }
}