
class FlightRequestModel {
  String fromCity;
  String toCity;
  String date;
  String count;


  FlightRequestModel(this.fromCity, this.toCity,this.date,this.count);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'toCity': toCity.trim(),
      'fromCity': fromCity.trim(),
      'date': date.trim(),
      'count': count.trim(),


    };

    return map;
  }
}