import 'package:invoice/models/BaseModel.dart';
import 'package:invoice/models/UserModel.dart';

class LoginModel extends BaseModel {
  String? token;
  UserModel? user;

  LoginModel.fromJson(Map<String, dynamic> json) : super.fromJson(json){
    this.token = json['token'];
    this.user = UserModel.fromJson(json['user']);
  }
}