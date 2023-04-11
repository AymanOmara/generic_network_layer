import 'package:generic_network_layer/data_layer/remote/target_type.dart';

class Login implements TargetTypeBase {
  String? userName;
  String? password;

  Login({
    required this.userName,
    required this.password,
  }) {
    headers = {'Content-Type': 'application/json', 'Accept': '*/*'};
    requestParameters = {"Email": userName, "Password": password};
  }

  @override
  Map<String, dynamic>? headers;

  @override
  HttpMethod method = HttpMethod.post;

  @override
  String path = "/api/Auth/token";

  @override
  dynamic requestParameters;
}
