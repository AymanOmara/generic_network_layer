import 'codable.dart';
import 'message_type.dart';

class BaseResponse<T extends Codable> implements Codable {
  String? message;
  bool? status;
  T? data;
  List<T> array = [];
  MessageType? messageType;
  BaseResponse(T da,this.messageType) {
    data = da;
  }


  @override
  fromJson(Map<String, dynamic>? json) {
    if (json?["data"] is List) {
      array = (json?["data"] as List)
          .map<T>((e) => data?.fromJson(e ?? {}))
          .toList();
    } else {
      data = json?["data"] != null ? data?.fromJson(json?["data"] ?? {}) : null;
    }
    return this;
  }


@override
Map<String, dynamic> toJson() {
  return data?.toJson() ?? {};
}}

enum ErrorType {
  serverError("server_error"),
  noConnection("no_connection");

  final String value;

  const ErrorType(this.value);
}
