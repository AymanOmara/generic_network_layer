abstract class TargetTypeBase {
  String path;
  dynamic requestParameters;
  Map<String, dynamic>? headers;
  HttpMethod method;

  TargetTypeBase({
    required this.path,
    required this.method,
    required this.headers,
    required this.requestParameters,
  });
}

enum HttpMethod {
  get("GET"),
  put("PUT"),
  delete("DELETE"),
  post("POST");

  final String value;

  const HttpMethod(this.value);
}