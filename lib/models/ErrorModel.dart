
enum NetworkStatus {
  success,
  error,
}

class ErrorModel {
  ErrorModel({
    this.status,
    this.error,
    this.message,
    this.stack,
  });

  NetworkStatus? status;
  String? error;
  String? message;
  String? stack;

  ErrorModel.fromJson(Map<String, dynamic>? json) {
      this.status = json!["statusCode"] == 400
          ? NetworkStatus.error
          : NetworkStatus.success;
      this.error =  json["error"];
      this.message =  json["message"] is String ? json["message"] : 'Error';
      this.stack = json["stack"];
  }
}

class Error {
  Error({
    this.statusCode,
    this.status,
    this.isOperational,
  });

  final int? statusCode;
  final NetworkStatus? status;
  final bool? isOperational;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        statusCode: json["statusCode"],
        status: json["status"] == "success"
            ? NetworkStatus.success
            : NetworkStatus.error,
        isOperational: json["isOperational"],
      );
}
