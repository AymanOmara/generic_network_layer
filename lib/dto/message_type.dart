class Message {
  String message = "";
  Message({
    required MessageType messageType,
  }) {
    switch (messageType) {
      case MessageType.serverError:
        message = "server_error";
        break;
      case MessageType.success:
        message = "success";
        break;
      case MessageType.timeOut:
        message = "time_out";
        break;
      case MessageType.failed:
        message = "failed";
        break;
      case MessageType.noConnection:
        message = "no_connection";
        break;
    }
  }
}

enum MessageType {
  serverError(),
  success(),
  timeOut(),
  failed(),
  noConnection();
}