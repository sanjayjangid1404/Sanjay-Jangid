
class LoginRequestModel {
  String username;
  String password;


  LoginRequestModel(this.username, this.password);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'user_name': username.trim(),
      'password': password.trim(),

    };

    return map;
  }
}