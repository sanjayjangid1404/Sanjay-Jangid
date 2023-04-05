
class BookingRequest {
  String userID;
  String keyword;


  BookingRequest(this.userID, this.keyword);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'user_id': userID.trim(),
      'keyword': keyword.trim(),

    };

    return map;
  }
}