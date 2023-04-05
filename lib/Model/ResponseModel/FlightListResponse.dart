

class FlightListResponse {
  FlightListResponse({
      bool? status, 
      String? message, 
      List<FlightData>? flightData,}){
    _status = status;
    _message = message;
    _flightData = flightData;
}

  FlightListResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['flight_data'] != null) {
      _flightData = [];
      json['flight_data'].forEach((v) {
        _flightData?.add(FlightData.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<FlightData>? _flightData;
FlightListResponse copyWith({  bool? status,
  String? message,
  List<FlightData>? flightData,
}) => FlightListResponse(  status: status ?? _status,
  message: message ?? _message,
  flightData: flightData ?? _flightData,
);
  bool? get status => _status;
  String? get message => _message;
  List<FlightData>? get flightData => _flightData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_flightData != null) {
      map['flight_data'] = _flightData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "1"
/// from_city : "JAIPUR"
/// to_city : "Mumbai"
/// airline : "GoAir"
/// flight_no : "G8389"
/// pnr_no : "TBY4FA"
/// departure_date : "2020-01-10"
/// departure_time : "08:45:00"
/// arrival_date : "2020-01-10"
/// arrival_time : "10:50:00"
/// purchase_price : "5150.00"
/// agent_price : "5450.00"

class FlightData {
  FlightData({
      String? id, 
      String? fromCity, 
      String? toCity, 
      String? airline, 
      String? flightNo, 
      String? pnrNo, 
      String? departureDate, 
      String? departureTime, 
      String? arrivalDate, 
      String? arrivalTime, 
      String? purchasePrice, 
      String? agentPrice,}){
    _id = id;
    _fromCity = fromCity;
    _toCity = toCity;
    _airline = airline;
    _flightNo = flightNo;
    _pnrNo = pnrNo;
    _departureDate = departureDate;
    _departureTime = departureTime;
    _arrivalDate = arrivalDate;
    _arrivalTime = arrivalTime;
    _purchasePrice = purchasePrice;
    _agentPrice = agentPrice;
}

  FlightData.fromJson(dynamic json) {
    _id = json['id'];
    _fromCity = json['from_city'];
    _toCity = json['to_city'];
    _airline = json['airline'];
    _flightNo = json['flight_no'];
    _pnrNo = json['pnr_no'];
    _departureDate = json['departure_date'];
    _departureTime = json['departure_time'];
    _arrivalDate = json['arrival_date'];
    _arrivalTime = json['arrival_time'];
    _purchasePrice = json['purchase_price'];
    _agentPrice = json['agent_price'];
  }
  String? _id;
  String? _fromCity;
  String? _toCity;
  String? _airline;
  String? _flightNo;
  String? _pnrNo;
  String? _departureDate;
  String? _departureTime;
  String? _arrivalDate;
  String? _arrivalTime;
  String? _purchasePrice;
  String? _agentPrice;
FlightData copyWith({  String? id,
  String? fromCity,
  String? toCity,
  String? airline,
  String? flightNo,
  String? pnrNo,
  String? departureDate,
  String? departureTime,
  String? arrivalDate,
  String? arrivalTime,
  String? purchasePrice,
  String? agentPrice,
}) => FlightData(  id: id ?? _id,
  fromCity: fromCity ?? _fromCity,
  toCity: toCity ?? _toCity,
  airline: airline ?? _airline,
  flightNo: flightNo ?? _flightNo,
  pnrNo: pnrNo ?? _pnrNo,
  departureDate: departureDate ?? _departureDate,
  departureTime: departureTime ?? _departureTime,
  arrivalDate: arrivalDate ?? _arrivalDate,
  arrivalTime: arrivalTime ?? _arrivalTime,
  purchasePrice: purchasePrice ?? _purchasePrice,
  agentPrice: agentPrice ?? _agentPrice,
);
  String? get id => _id;
  String? get fromCity => _fromCity;
  String? get toCity => _toCity;
  String? get airline => _airline;
  String? get flightNo => _flightNo;
  String? get pnrNo => _pnrNo;
  String? get departureDate => _departureDate;
  String? get departureTime => _departureTime;
  String? get arrivalDate => _arrivalDate;
  String? get arrivalTime => _arrivalTime;
  String? get purchasePrice => _purchasePrice;
  String? get agentPrice => _agentPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['from_city'] = _fromCity;
    map['to_city'] = _toCity;
    map['airline'] = _airline;
    map['flight_no'] = _flightNo;
    map['pnr_no'] = _pnrNo;
    map['departure_date'] = _departureDate;
    map['departure_time'] = _departureTime;
    map['arrival_date'] = _arrivalDate;
    map['arrival_time'] = _arrivalTime;
    map['purchase_price'] = _purchasePrice;
    map['agent_price'] = _agentPrice;
    return map;
  }

}