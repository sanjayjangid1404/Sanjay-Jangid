


class BookingResponse {
  BookingResponse({
      bool? status, 
      String? message, 
      List<BookingData>? bookingData,}){
    _status = status;
    _message = message;
    _bookingData = bookingData;
}

  BookingResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['booking_data'] != null) {
      _bookingData = [];
      json['booking_data'].forEach((v) {
        _bookingData?.add(BookingData.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<BookingData>? _bookingData;
BookingResponse copyWith({  bool? status,
  String? message,
  List<BookingData>? bookingData,
}) => BookingResponse(  status: status ?? _status,
  message: message ?? _message,
  bookingData: bookingData ?? _bookingData,
);
  bool? get status => _status;
  String? get message => _message;
  List<BookingData>? get bookingData => _bookingData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_bookingData != null) {
      map['booking_data'] = _bookingData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "2"
/// pnr_no : "TBY4FA"
/// issue_date : "2020-01-08\n15:55:00"
/// flight_id : "563"
/// flight_no : "G8389"
/// flight_class : "Economy\nClass"
/// dep_city_id : "3150"
/// dep_date : "2020-01-10\n00:00:00"
/// dep_time : "08:45:00"
/// arr_city_id : "830"
/// arr_date : "2020-01-10"
/// arr_time : "10:50:00"
/// booking_status : null
/// total_buggage : "15"
/// total_meal : null
/// total_stoppage : "10"
/// total_fare : "3800.00"
/// total_gst : "0.00"
/// total_surcharge : "0.00"
/// total_amount : "3801.00"
/// del_id : null
/// client_id : null
/// cust_name : "SUNIL"
/// cust_mobile : "9828105456"
/// cust_email : "supertravels17@gmail.com"
/// ticket_qty : "1"
/// agent_id : "1"
/// added_by : "Agency"
/// booking_id : "MT10002"
/// cancel_date : null
/// is_cancel : "0"
/// cancel_charge : null
/// agent_refund_amt : null
/// custumer_refund_amt : null
/// total_purchase_price : "5150.00"
/// created_at : "2020-01-08\n15:55:00"
/// updated_at : "2020-01-08 15:55:00"
/// is_deleted : "0"

class BookingData {
  BookingData({
      String? id, 
      String? pnrNo, 
      String? issueDate, 
      String? flightId, 
      String? flightNo, 
      String? flightClass, 
      String? depCityId, 
      String? depDate, 
      String? depTime, 
      String? arrCityId, 
      String? arrDate, 
      String? arrTime, 
      dynamic bookingStatus, 
      String? totalBuggage, 
      dynamic totalMeal, 
      String? totalStoppage, 
      String? totalFare, 
      String? totalGst, 
      String? totalSurcharge, 
      String? totalAmount, 
      dynamic delId, 
      dynamic clientId, 
      String? custName, 
      String? custMobile, 
      String? custEmail, 
      String? ticketQty, 
      String? agentId, 
      String? addedBy, 
      String? bookingId, 
      dynamic cancelDate, 
      String? isCancel, 
      dynamic cancelCharge, 
      dynamic agentRefundAmt, 
      dynamic custumerRefundAmt, 
      String? totalPurchasePrice, 
      String? createdAt, 
      String? updatedAt, 
      String? isDeleted,}){
    _id = id;
    _pnrNo = pnrNo;
    _issueDate = issueDate;
    _flightId = flightId;
    _flightNo = flightNo;
    _flightClass = flightClass;
    _depCityId = depCityId;
    _depDate = depDate;
    _depTime = depTime;
    _arrCityId = arrCityId;
    _arrDate = arrDate;
    _arrTime = arrTime;
    _bookingStatus = bookingStatus;
    _totalBuggage = totalBuggage;
    _totalMeal = totalMeal;
    _totalStoppage = totalStoppage;
    _totalFare = totalFare;
    _totalGst = totalGst;
    _totalSurcharge = totalSurcharge;
    _totalAmount = totalAmount;
    _delId = delId;
    _clientId = clientId;
    _custName = custName;
    _custMobile = custMobile;
    _custEmail = custEmail;
    _ticketQty = ticketQty;
    _agentId = agentId;
    _addedBy = addedBy;
    _bookingId = bookingId;
    _cancelDate = cancelDate;
    _isCancel = isCancel;
    _cancelCharge = cancelCharge;
    _agentRefundAmt = agentRefundAmt;
    _custumerRefundAmt = custumerRefundAmt;
    _totalPurchasePrice = totalPurchasePrice;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _isDeleted = isDeleted;
}

  BookingData.fromJson(dynamic json) {
    _id = json['id'];
    _pnrNo = json['pnr_no'];
    _issueDate = json['issue_date'];
    _flightId = json['flight_id'];
    _flightNo = json['flight_no'];
    _flightClass = json['flight_class'];
    _depCityId = json['dep_city_id'];
    _depDate = json['dep_date'];
    _depTime = json['dep_time'];
    _arrCityId = json['arr_city_id'];
    _arrDate = json['arr_date'];
    _arrTime = json['arr_time'];
    _bookingStatus = json['booking_status'] ??"";
    _totalBuggage = json['total_buggage'];
    _totalMeal = json['total_meal'];
    _totalStoppage = json['total_stoppage'];
    _totalFare = json['total_fare'];
    _totalGst = json['total_gst'];
    _totalSurcharge = json['total_surcharge'];
    _totalAmount = json['total_amount'];
    _delId = json['del_id'];
    _clientId = json['client_id'];
    _custName = json['cust_name'];
    _custMobile = json['cust_mobile'];
    _custEmail = json['cust_email'];
    _ticketQty = json['ticket_qty'];
    _agentId = json['agent_id'];
    _addedBy = json['added_by'];
    _bookingId = json['booking_id'];
    _cancelDate = json['cancel_date'];
    _isCancel = json['is_cancel'];
    _cancelCharge = json['cancel_charge'];
    _agentRefundAmt = json['agent_refund_amt'];
    _custumerRefundAmt = json['custumer_refund_amt'];
    _totalPurchasePrice = json['total_purchase_price'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _isDeleted = json['is_deleted'];
  }
  String? _id;
  String? _pnrNo;
  String? _issueDate;
  String? _flightId;
  String? _flightNo;
  String? _flightClass;
  String? _depCityId;
  String? _depDate;
  String? _depTime;
  String? _arrCityId;
  String? _arrDate;
  String? _arrTime;
  dynamic _bookingStatus;
  String? _totalBuggage;
  dynamic _totalMeal;
  String? _totalStoppage;
  String? _totalFare;
  String? _totalGst;
  String? _totalSurcharge;
  String? _totalAmount;
  dynamic _delId;
  dynamic _clientId;
  String? _custName;
  String? _custMobile;
  String? _custEmail;
  String? _ticketQty;
  String? _agentId;
  String? _addedBy;
  String? _bookingId;
  dynamic _cancelDate;
  String? _isCancel;
  dynamic _cancelCharge;
  dynamic _agentRefundAmt;
  dynamic _custumerRefundAmt;
  String? _totalPurchasePrice;
  String? _createdAt;
  String? _updatedAt;
  String? _isDeleted;
BookingData copyWith({  String? id,
  String? pnrNo,
  String? issueDate,
  String? flightId,
  String? flightNo,
  String? flightClass,
  String? depCityId,
  String? depDate,
  String? depTime,
  String? arrCityId,
  String? arrDate,
  String? arrTime,
  dynamic bookingStatus,
  String? totalBuggage,
  dynamic totalMeal,
  String? totalStoppage,
  String? totalFare,
  String? totalGst,
  String? totalSurcharge,
  String? totalAmount,
  dynamic delId,
  dynamic clientId,
  String? custName,
  String? custMobile,
  String? custEmail,
  String? ticketQty,
  String? agentId,
  String? addedBy,
  String? bookingId,
  dynamic cancelDate,
  String? isCancel,
  dynamic cancelCharge,
  dynamic agentRefundAmt,
  dynamic custumerRefundAmt,
  String? totalPurchasePrice,
  String? createdAt,
  String? updatedAt,
  String? isDeleted,
}) => BookingData(  id: id ?? _id,
  pnrNo: pnrNo ?? _pnrNo,
  issueDate: issueDate ?? _issueDate,
  flightId: flightId ?? _flightId,
  flightNo: flightNo ?? _flightNo,
  flightClass: flightClass ?? _flightClass,
  depCityId: depCityId ?? _depCityId,
  depDate: depDate ?? _depDate,
  depTime: depTime ?? _depTime,
  arrCityId: arrCityId ?? _arrCityId,
  arrDate: arrDate ?? _arrDate,
  arrTime: arrTime ?? _arrTime,
  bookingStatus: bookingStatus ?? _bookingStatus,
  totalBuggage: totalBuggage ?? _totalBuggage,
  totalMeal: totalMeal ?? _totalMeal,
  totalStoppage: totalStoppage ?? _totalStoppage,
  totalFare: totalFare ?? _totalFare,
  totalGst: totalGst ?? _totalGst,
  totalSurcharge: totalSurcharge ?? _totalSurcharge,
  totalAmount: totalAmount ?? _totalAmount,
  delId: delId ?? _delId,
  clientId: clientId ?? _clientId,
  custName: custName ?? _custName,
  custMobile: custMobile ?? _custMobile,
  custEmail: custEmail ?? _custEmail,
  ticketQty: ticketQty ?? _ticketQty,
  agentId: agentId ?? _agentId,
  addedBy: addedBy ?? _addedBy,
  bookingId: bookingId ?? _bookingId,
  cancelDate: cancelDate ?? _cancelDate,
  isCancel: isCancel ?? _isCancel,
  cancelCharge: cancelCharge ?? _cancelCharge,
  agentRefundAmt: agentRefundAmt ?? _agentRefundAmt,
  custumerRefundAmt: custumerRefundAmt ?? _custumerRefundAmt,
  totalPurchasePrice: totalPurchasePrice ?? _totalPurchasePrice,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  isDeleted: isDeleted ?? _isDeleted,
);
  String? get id => _id;
  String? get pnrNo => _pnrNo;
  String? get issueDate => _issueDate;
  String? get flightId => _flightId;
  String? get flightNo => _flightNo;
  String? get flightClass => _flightClass;
  String? get depCityId => _depCityId;
  String? get depDate => _depDate;
  String? get depTime => _depTime;
  String? get arrCityId => _arrCityId;
  String? get arrDate => _arrDate;
  String? get arrTime => _arrTime;
  dynamic get bookingStatus => _bookingStatus;
  String? get totalBuggage => _totalBuggage;
  dynamic get totalMeal => _totalMeal;
  String? get totalStoppage => _totalStoppage;
  String? get totalFare => _totalFare;
  String? get totalGst => _totalGst;
  String? get totalSurcharge => _totalSurcharge;
  String? get totalAmount => _totalAmount;
  dynamic get delId => _delId;
  dynamic get clientId => _clientId;
  String? get custName => _custName;
  String? get custMobile => _custMobile;
  String? get custEmail => _custEmail;
  String? get ticketQty => _ticketQty;
  String? get agentId => _agentId;
  String? get addedBy => _addedBy;
  String? get bookingId => _bookingId;
  dynamic get cancelDate => _cancelDate;
  String? get isCancel => _isCancel;
  dynamic get cancelCharge => _cancelCharge;
  dynamic get agentRefundAmt => _agentRefundAmt;
  dynamic get custumerRefundAmt => _custumerRefundAmt;
  String? get totalPurchasePrice => _totalPurchasePrice;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get isDeleted => _isDeleted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['pnr_no'] = _pnrNo;
    map['issue_date'] = _issueDate;
    map['flight_id'] = _flightId;
    map['flight_no'] = _flightNo;
    map['flight_class'] = _flightClass;
    map['dep_city_id'] = _depCityId;
    map['dep_date'] = _depDate;
    map['dep_time'] = _depTime;
    map['arr_city_id'] = _arrCityId;
    map['arr_date'] = _arrDate;
    map['arr_time'] = _arrTime;
    map['booking_status'] = _bookingStatus;
    map['total_buggage'] = _totalBuggage;
    map['total_meal'] = _totalMeal;
    map['total_stoppage'] = _totalStoppage;
    map['total_fare'] = _totalFare;
    map['total_gst'] = _totalGst;
    map['total_surcharge'] = _totalSurcharge;
    map['total_amount'] = _totalAmount;
    map['del_id'] = _delId;
    map['client_id'] = _clientId;
    map['cust_name'] = _custName;
    map['cust_mobile'] = _custMobile;
    map['cust_email'] = _custEmail;
    map['ticket_qty'] = _ticketQty;
    map['agent_id'] = _agentId;
    map['added_by'] = _addedBy;
    map['booking_id'] = _bookingId;
    map['cancel_date'] = _cancelDate;
    map['is_cancel'] = _isCancel;
    map['cancel_charge'] = _cancelCharge;
    map['agent_refund_amt'] = _agentRefundAmt;
    map['custumer_refund_amt'] = _custumerRefundAmt;
    map['total_purchase_price'] = _totalPurchasePrice;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['is_deleted'] = _isDeleted;
    return map;
  }

}