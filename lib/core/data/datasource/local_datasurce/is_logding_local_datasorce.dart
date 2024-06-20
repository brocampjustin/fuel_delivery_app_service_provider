import 'package:shared_preferences/shared_preferences.dart';

class CheckLoginLocalDataSorce  {
  Future<bool> setLoginDatasorce() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
   return await preferences.setBool("isLogedIn", true);
  }

  Future<bool> getIsLogedInDatasorce() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool("isLogedIn")??false;
  }
}
