import 'ErrorModel.dart';

class BaseModel {
  NetworkStatus? status;
  int? pagesNum;
  ErrorModel? errorModel;

  BaseModel({
    this.status,
    this.pagesNum,
    this.errorModel,
  });

  BaseModel.fromJson(Map<String, dynamic> json) {
    status = json['statusCode'] == 400
        ? NetworkStatus.error
        : NetworkStatus.success;
    pagesNum = json['pagesNum'];
    errorModel = ErrorModel.fromJson(json);
  }
}