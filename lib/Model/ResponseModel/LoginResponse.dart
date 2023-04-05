/// status : true
/// message : "Login successful"
/// user : {"id":"1","user_name":"8888888888","pass":"123456","owner_name":"Air\nEdge Agent","mobile_number":"9829898298","phone_number":"","agency_name":"Air\nEdge","agency_address":"","agency_city":"JAIPUR","agency_state":"RAJASTHAN","agency_country":"IN","agency_pincode":"302021","agency_email":"support@airedge.com","pan_number":"ACCFS2755G","logo":"","address_proof":"","aadhar_number":"582496159148","aadhar_copy":"Aadhar_0_AIR25.pdf","is_active":"1","agency_code":"AE10001","agency_code_prefix":"SUP\n00","rating":"5","account_number":"90935456000001","ifsc_code":"IDFB0020101","upi_id":"\ncfmer.5456001@icici","apiKey":"yN4Rj8AsWIzoGxETgYmF0D6akcZw35Vq","created_at":null,"updated_at":"2022-11-17\n17:30:35","is_deleted":null}

class LoginResponse {
  LoginResponse({
      bool? status, 
      String? message, 
      User? user,}){
    _status = status;
    _message = message;
    _user = user;
}

  LoginResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  bool? _status;
  String? _message;
  User? _user;
LoginResponse copyWith({  bool? status,
  String? message,
  User? user,
}) => LoginResponse(  status: status ?? _status,
  message: message ?? _message,
  user: user ?? _user,
);
  bool? get status => _status;
  String? get message => _message;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

/// id : "1"
/// user_name : "8888888888"
/// pass : "123456"
/// owner_name : "Air\nEdge Agent"
/// mobile_number : "9829898298"
/// phone_number : ""
/// agency_name : "Air\nEdge"
/// agency_address : ""
/// agency_city : "JAIPUR"
/// agency_state : "RAJASTHAN"
/// agency_country : "IN"
/// agency_pincode : "302021"
/// agency_email : "support@airedge.com"
/// pan_number : "ACCFS2755G"
/// logo : ""
/// address_proof : ""
/// aadhar_number : "582496159148"
/// aadhar_copy : "Aadhar_0_AIR25.pdf"
/// is_active : "1"
/// agency_code : "AE10001"
/// agency_code_prefix : "SUP\n00"
/// rating : "5"
/// account_number : "90935456000001"
/// ifsc_code : "IDFB0020101"
/// upi_id : "\ncfmer.5456001@icici"
/// apiKey : "yN4Rj8AsWIzoGxETgYmF0D6akcZw35Vq"
/// created_at : null
/// updated_at : "2022-11-17\n17:30:35"
/// is_deleted : null

class User {
  User({
      String? id, 
      String? userName, 
      String? pass, 
      String? ownerName, 
      String? mobileNumber, 
      String? phoneNumber, 
      String? agencyName, 
      String? agencyAddress, 
      String? agencyCity, 
      String? agencyState, 
      String? agencyCountry, 
      String? agencyPincode, 
      String? agencyEmail, 
      String? panNumber, 
      String? logo, 
      String? addressProof, 
      String? aadharNumber, 
      String? aadharCopy, 
      String? isActive, 
      String? agencyCode, 
      String? agencyCodePrefix, 
      String? rating, 
      String? accountNumber, 
      String? ifscCode, 
      String? upiId, 
      String? apiKey, 
      dynamic createdAt, 
      String? updatedAt, 
      dynamic isDeleted,}){
    _id = id;
    _userName = userName;
    _pass = pass;
    _ownerName = ownerName;
    _mobileNumber = mobileNumber;
    _phoneNumber = phoneNumber;
    _agencyName = agencyName;
    _agencyAddress = agencyAddress;
    _agencyCity = agencyCity;
    _agencyState = agencyState;
    _agencyCountry = agencyCountry;
    _agencyPincode = agencyPincode;
    _agencyEmail = agencyEmail;
    _panNumber = panNumber;
    _logo = logo;
    _addressProof = addressProof;
    _aadharNumber = aadharNumber;
    _aadharCopy = aadharCopy;
    _isActive = isActive;
    _agencyCode = agencyCode;
    _agencyCodePrefix = agencyCodePrefix;
    _rating = rating;
    _accountNumber = accountNumber;
    _ifscCode = ifscCode;
    _upiId = upiId;
    _apiKey = apiKey;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _isDeleted = isDeleted;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _userName = json['user_name'];
    _pass = json['pass'];
    _ownerName = json['owner_name'];
    _mobileNumber = json['mobile_number'];
    _phoneNumber = json['phone_number'];
    _agencyName = json['agency_name'];
    _agencyAddress = json['agency_address'];
    _agencyCity = json['agency_city'];
    _agencyState = json['agency_state'];
    _agencyCountry = json['agency_country'];
    _agencyPincode = json['agency_pincode'];
    _agencyEmail = json['agency_email'];
    _panNumber = json['pan_number'];
    _logo = json['logo'];
    _addressProof = json['address_proof'];
    _aadharNumber = json['aadhar_number'];
    _aadharCopy = json['aadhar_copy'];
    _isActive = json['is_active'];
    _agencyCode = json['agency_code'];
    _agencyCodePrefix = json['agency_code_prefix'];
    _rating = json['rating'];
    _accountNumber = json['account_number'];
    _ifscCode = json['ifsc_code'];
    _upiId = json['upi_id'];
    _apiKey = json['apiKey'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _isDeleted = json['is_deleted'];
  }
  String? _id;
  String? _userName;
  String? _pass;
  String? _ownerName;
  String? _mobileNumber;
  String? _phoneNumber;
  String? _agencyName;
  String? _agencyAddress;
  String? _agencyCity;
  String? _agencyState;
  String? _agencyCountry;
  String? _agencyPincode;
  String? _agencyEmail;
  String? _panNumber;
  String? _logo;
  String? _addressProof;
  String? _aadharNumber;
  String? _aadharCopy;
  String? _isActive;
  String? _agencyCode;
  String? _agencyCodePrefix;
  String? _rating;
  String? _accountNumber;
  String? _ifscCode;
  String? _upiId;
  String? _apiKey;
  dynamic _createdAt;
  String? _updatedAt;
  dynamic _isDeleted;
User copyWith({  String? id,
  String? userName,
  String? pass,
  String? ownerName,
  String? mobileNumber,
  String? phoneNumber,
  String? agencyName,
  String? agencyAddress,
  String? agencyCity,
  String? agencyState,
  String? agencyCountry,
  String? agencyPincode,
  String? agencyEmail,
  String? panNumber,
  String? logo,
  String? addressProof,
  String? aadharNumber,
  String? aadharCopy,
  String? isActive,
  String? agencyCode,
  String? agencyCodePrefix,
  String? rating,
  String? accountNumber,
  String? ifscCode,
  String? upiId,
  String? apiKey,
  dynamic createdAt,
  String? updatedAt,
  dynamic isDeleted,
}) => User(  id: id ?? _id,
  userName: userName ?? _userName,
  pass: pass ?? _pass,
  ownerName: ownerName ?? _ownerName,
  mobileNumber: mobileNumber ?? _mobileNumber,
  phoneNumber: phoneNumber ?? _phoneNumber,
  agencyName: agencyName ?? _agencyName,
  agencyAddress: agencyAddress ?? _agencyAddress,
  agencyCity: agencyCity ?? _agencyCity,
  agencyState: agencyState ?? _agencyState,
  agencyCountry: agencyCountry ?? _agencyCountry,
  agencyPincode: agencyPincode ?? _agencyPincode,
  agencyEmail: agencyEmail ?? _agencyEmail,
  panNumber: panNumber ?? _panNumber,
  logo: logo ?? _logo,
  addressProof: addressProof ?? _addressProof,
  aadharNumber: aadharNumber ?? _aadharNumber,
  aadharCopy: aadharCopy ?? _aadharCopy,
  isActive: isActive ?? _isActive,
  agencyCode: agencyCode ?? _agencyCode,
  agencyCodePrefix: agencyCodePrefix ?? _agencyCodePrefix,
  rating: rating ?? _rating,
  accountNumber: accountNumber ?? _accountNumber,
  ifscCode: ifscCode ?? _ifscCode,
  upiId: upiId ?? _upiId,
  apiKey: apiKey ?? _apiKey,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  isDeleted: isDeleted ?? _isDeleted,
);
  String? get id => _id;
  String? get userName => _userName;
  String? get pass => _pass;
  String? get ownerName => _ownerName;
  String? get mobileNumber => _mobileNumber;
  String? get phoneNumber => _phoneNumber;
  String? get agencyName => _agencyName;
  String? get agencyAddress => _agencyAddress;
  String? get agencyCity => _agencyCity;
  String? get agencyState => _agencyState;
  String? get agencyCountry => _agencyCountry;
  String? get agencyPincode => _agencyPincode;
  String? get agencyEmail => _agencyEmail;
  String? get panNumber => _panNumber;
  String? get logo => _logo;
  String? get addressProof => _addressProof;
  String? get aadharNumber => _aadharNumber;
  String? get aadharCopy => _aadharCopy;
  String? get isActive => _isActive;
  String? get agencyCode => _agencyCode;
  String? get agencyCodePrefix => _agencyCodePrefix;
  String? get rating => _rating;
  String? get accountNumber => _accountNumber;
  String? get ifscCode => _ifscCode;
  String? get upiId => _upiId;
  String? get apiKey => _apiKey;
  dynamic get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get isDeleted => _isDeleted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_name'] = _userName;
    map['pass'] = _pass;
    map['owner_name'] = _ownerName;
    map['mobile_number'] = _mobileNumber;
    map['phone_number'] = _phoneNumber;
    map['agency_name'] = _agencyName;
    map['agency_address'] = _agencyAddress;
    map['agency_city'] = _agencyCity;
    map['agency_state'] = _agencyState;
    map['agency_country'] = _agencyCountry;
    map['agency_pincode'] = _agencyPincode;
    map['agency_email'] = _agencyEmail;
    map['pan_number'] = _panNumber;
    map['logo'] = _logo;
    map['address_proof'] = _addressProof;
    map['aadhar_number'] = _aadharNumber;
    map['aadhar_copy'] = _aadharCopy;
    map['is_active'] = _isActive;
    map['agency_code'] = _agencyCode;
    map['agency_code_prefix'] = _agencyCodePrefix;
    map['rating'] = _rating;
    map['account_number'] = _accountNumber;
    map['ifsc_code'] = _ifscCode;
    map['upi_id'] = _upiId;
    map['apiKey'] = _apiKey;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['is_deleted'] = _isDeleted;
    return map;
  }

}