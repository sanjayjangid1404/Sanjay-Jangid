/// status : true
/// message : "Data\nFound"
/// city : [{"id":"9717","city_code":"GOI","city_name":"Goa","country_code":"IN","country_name":"India","created_at":"2022-08-16\n16:20:24","updated_at":"2022-08-16 16:20:24","is_deleted":null}]

class CityResponse {
  CityResponse({
      bool? status, 
      String? message, 
      List<City>? city,}){
    _status = status;
    _message = message;
    _city = city;
}

  CityResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['city'] != null) {
      _city = [];
      json['city'].forEach((v) {
        _city?.add(City.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<City>? _city;
CityResponse copyWith({  bool? status,
  String? message,
  List<City>? city,
}) => CityResponse(  status: status ?? _status,
  message: message ?? _message,
  city: city ?? _city,
);
  bool? get status => _status;
  String? get message => _message;
  List<City>? get city => _city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_city != null) {
      map['city'] = _city?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "9717"
/// city_code : "GOI"
/// city_name : "Goa"
/// country_code : "IN"
/// country_name : "India"
/// created_at : "2022-08-16\n16:20:24"
/// updated_at : "2022-08-16 16:20:24"
/// is_deleted : null

class City {
  City({
      String? id, 
      String? cityCode, 
      String? cityName, 
      String? countryCode, 
      String? countryName, 
      String? createdAt, 
      String? updatedAt, 
      dynamic isDeleted,}){
    _id = id;
    _cityCode = cityCode;
    _cityName = cityName;
    _countryCode = countryCode;
    _countryName = countryName;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _isDeleted = isDeleted;
}

  City.fromJson(dynamic json) {
    _id = json['id'];
    _cityCode = json['city_code'];
    _cityName = json['city_name'];
    _countryCode = json['country_code'];
    _countryName = json['country_name'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _isDeleted = json['is_deleted'];
  }
  String? _id;
  String? _cityCode;
  String? _cityName;
  String? _countryCode;
  String? _countryName;
  String? _createdAt;
  String? _updatedAt;
  dynamic _isDeleted;
City copyWith({  String? id,
  String? cityCode,
  String? cityName,
  String? countryCode,
  String? countryName,
  String? createdAt,
  String? updatedAt,
  dynamic isDeleted,
}) => City(  id: id ?? _id,
  cityCode: cityCode ?? _cityCode,
  cityName: cityName ?? _cityName,
  countryCode: countryCode ?? _countryCode,
  countryName: countryName ?? _countryName,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  isDeleted: isDeleted ?? _isDeleted,
);
  String? get id => _id;
  String? get cityCode => _cityCode;
  String? get cityName => _cityName;
  String? get countryCode => _countryCode;
  String? get countryName => _countryName;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get isDeleted => _isDeleted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['city_code'] = _cityCode;
    map['city_name'] = _cityName;
    map['country_code'] = _countryCode;
    map['country_name'] = _countryName;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['is_deleted'] = _isDeleted;
    return map;
  }

}