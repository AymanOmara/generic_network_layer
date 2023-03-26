import 'codable.dart';

class LoginResponse extends Codable {
  String? token;
  String? refreshToken;
  LoginResponse.empty();
  LoginResponse({
    required this.refreshToken,
    required this.token,
  });
  @override
  fromJson(Map<String, dynamic> json) {
    return LoginResponse(refreshToken: json["refreshToken"], token: json["token"]);
  }

  @override
  Map<String, dynamic> toJson() => {"":""} ;



}