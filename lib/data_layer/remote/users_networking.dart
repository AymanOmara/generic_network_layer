import 'package:generic_network_layer/data_layer/remote/target_type.dart';

class Login implements TargetTypeBase {
  String? userName;
  String? password;

  Login({
    required this.userName,
    required this.password,
  }) {
    headers = {'Content-Type': 'application/json', 'Accept': '*/*'};
    requestParameters = {"Email": "karim557@gmail.com", "Password": "123Pa\$\$word!"};
  }

  @override
  late Map<String, dynamic>? headers;

  @override
  HttpMethod? method = HttpMethod.post;

  @override
  String? path = "/api/Auth/token";

  @override
  Map<String, dynamic>? requestParameters = {};
}
