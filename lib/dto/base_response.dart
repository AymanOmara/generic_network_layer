

import 'codable.dart';

class BaseResponse<T extends Codable> implements Codable {
  String? message;
  bool? status;
  T? data;

  BaseResponse(T da){
    data = da;
  }
  BaseResponse.parameterize({required this.status, required this.data, required this.message});
  @override
  fromJson(Map<String, dynamic>? json) {
    data = (json?["data"] is List) ? (json?["data"] as List).map((e) => data?.fromJson( e ?? {})).toList() : data?.fromJson(json?["data"] ?? {});
    return BaseResponse.parameterize(status: json!["status"], data:  data, message: json["message"]);

  }

  @override
  Map<String, dynamic> toJson() {
    return data?.toJson() ?? {};
  }
}

enum ErrorType {
  serverError("server_error"),
  noConnection("no_connection");

  final String value;

  const ErrorType(this.value);
}
