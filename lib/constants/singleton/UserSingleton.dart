
import 'dart:convert';
import 'package:invoice/models/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class UserSingleton {
  factory UserSingleton() => _singleton;

  static UserSingleton _singleton = UserSingleton._internal();

  UserSingleton._internal();

  //be able to access value
  UserModel? get user => _user;
  String? get token => _userToken;

  UserModel? _user;
  String? _userToken;

  //set a value to a Singleton's variable
  late SharedPreferences _prefs;
  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void setAppleEmail(String email){
    _prefs.setString('appleEmail', email);
  }

  void setAppleName(String name){
    _prefs.setString('appleName', name);
  }

  void setAppleToken(String token){
    _prefs.setString('appleToken', token);
  }

  String getAppleEmail(){
    return _prefs.getString('appleEmail') ?? '';
  }

  String getAppleName(){
    return _prefs.getString('appleName') ?? '';
  }

  String getAppleToken(){
    return _prefs.getString('appleToken') ?? '';
  }


  Future setUser(UserModel user, String userToken) async {
    this._user = user;
    this._userToken = userToken;
    await _storeUser(user, _userToken!);
  }

  Future _storeUser(UserModel user, String _userToken) async {
    _prefs.setString(Strings.kUserKeyPrefs, jsonEncode(user.toJson()));
    _prefs.setString(Strings.kUserToken, _userToken);
    print('token after save'+token!);
  }

  Future<String> _getUserToken() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String userToken = _prefs.getString(Strings.kUserToken)!;
    return userToken;
  }

  Future<UserModel?> getStoredUser() async {
    if(_prefs == null){
      print('null');
    }
    else{
      String? _userStrIng = _prefs.getString(Strings.kUserKeyPrefs);
      if (_userStrIng == null) return null;
      print(_userStrIng);
      Map<String, dynamic> _data = jsonDecode(_userStrIng.toString());
      _user = UserModel.fromJson(_data);
      _userToken = await _getUserToken();
      return _user;
    }
  }

  Future logOut() async {
    _prefs.clear();
    _user = null;
    _userToken = null;
  }

  void setCartId(String value) {
    _prefs.setString(_user!.email!, value);
  }

  void setPass(String value) {
    _prefs.setString('password', value);
  }

  String getPassword() {
    String? password = _prefs.getString('password');
    if(password == null)
      return '';
    return password;
  }

  String getCartId() {
    String? cartId = _prefs.getString(_user!.email??'');
    if(cartId == null)
      return '';
    print('cart id from usersingleton : $cartId');
    return cartId;
  }

  void isFirstTime(){
    _prefs.setBool('firstTime', true);
  }

  bool getFirstTime(){
    return _prefs.getBool('firstTime') ?? false;
  }
}
