import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice/constants/constants.dart';
import 'package:invoice/constants/singleton/UserSingleton.dart';
import 'package:invoice/models/ErrorModel.dart';
import 'package:invoice/models/loginModel.dart';
import 'package:invoice/utils/NetworkHelper/networking_helper.dart';
import 'package:invoice/views/widgets/Dialogs.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit() : super(LoginInitState());

  bool isLoading = false;


  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  LoginModel? user;

  Future loginUser ({
    required String email,
    required String password,
    required GlobalKey<ScaffoldState> scaffoldKey
  }) async {
    Map<String, String> postRequestData = {
      "email": email,
      "password": password,
    };
    isLoading = true;
    emit(LoginLoadingState());
    await NetworkingHelper(endPoint: kLoginApi)
        .postData(postRequest: postRequestData).then((value) {
          isLoading = false;
          print(value.toString());
      if(value['statusCode'] != 200 && value['statusCode'] != null){
        print(value['message']);
        Dialogs.buildSnackBar(value['message'].toString(), scaffoldKey);
        emit(LoginFailedState());
      }else{
        user = LoginModel.fromJson(value);
        UserSingleton().setUser(user!.user!, user!.token!);
        print('token : '+UserSingleton().token!);
        emit(LoginSuccessState());
      }
    }).catchError((onError){
      print('error : '+onError.toString());
      Dialogs.buildSnackBar(onError.toString(), scaffoldKey);
      emit(LoginFailedState());
    });
  }
}