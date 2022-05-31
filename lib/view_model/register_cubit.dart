import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice/constants/constants.dart';
import 'package:invoice/constants/singleton/UserSingleton.dart';
import 'package:invoice/models/ErrorModel.dart';
import 'package:invoice/models/loginModel.dart';
import 'package:invoice/utils/NetworkHelper/networking_helper.dart';
import 'package:invoice/view_model/login_cubit.dart';
import 'package:invoice/view_model/register_state.dart';
import 'package:invoice/views/widgets/Dialogs.dart';
import 'login_state.dart';

class RegisterCubit extends Cubit<RegisterState>{
  RegisterCubit() : super(RegisterInitState());

  bool isLoading = false;


  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);

  LoginModel? user;

  Future registerUser (
      BuildContext context,
      {
    required String firstName,
    required String lastName,
    required String phone,
    required String country,
    required String company,
    required String email,
    required String password,
    required GlobalKey<ScaffoldState> scaffoldKey
  }) async {
    Map<String, String> postRequestData = {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "phone": phone,
      "country": country,
      "company": company,
      "password": password
    };
    isLoading = true;
    emit(RegisterLoadingState());
    await NetworkingHelper(endPoint: kSignUpApi)
        .postData(postRequest: postRequestData).then((value) {
      print(value.toString());
      if(value['statusCode'] != 200 && value['statusCode'] != null){
        isLoading = false;
        print(value['message']);
        Dialogs.buildSnackBar(value['message'].toString(), scaffoldKey);
        emit(RegisterFailedState());
      }else{
        print('value : '+value.toString());
        loginUser(email: email, password: password, scaffoldKey: scaffoldKey);
        // user = LoginModel.fromJson(value);
        // UserSingleton().setUser(user!.user!, user!.token!);
        // print('token : '+UserSingleton().user.email!);
        emit(RegisterSuccessState());
      }
    }).catchError((onError){
      print('error : '+onError.toString());
      Dialogs.buildSnackBar(onError.toString(), scaffoldKey);
      emit(RegisterFailedState());
    });
  }

  Future loginUser ({
    required String email,
    required String password,
    required GlobalKey<ScaffoldState> scaffoldKey
  }) async {
    Map<String, String> postRequestData = {
      "email": email,
      "password": password,
    };
    await NetworkingHelper(endPoint: kLoginApi)
        .postData(postRequest: postRequestData).then((value) {
      print(value.toString());
      if(value['statusCode'] != 200 && value['statusCode'] != null){
        isLoading = false;
        print(value['message']);
        Dialogs.buildSnackBar(value['message'].toString(), scaffoldKey);
      }else{
        isLoading = false;
        user = LoginModel.fromJson(value);
        UserSingleton().setUser(user!.user!, user!.token!);
        print('token : '+UserSingleton().user!.email!);
        emit(RegisterSuccessState());
      }
    }).catchError((onError){
      isLoading = false;
      print('error : '+onError.toString());
      Dialogs.buildSnackBar(onError.toString(), scaffoldKey);
    });
  }
}