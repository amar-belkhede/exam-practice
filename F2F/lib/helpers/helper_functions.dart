import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  static String authTokenSP = "authToken";
  static String studentIdSP = "studentId";
  static String refreshSP = "refresh";

  static Future saveAuthTokenSharedPreference(String authToken) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(authTokenSP, authToken);
  }

  static Future<String> getAuthTokenSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(authTokenSP);
  }

  static Future saveStudentIdSharedPreference(String studentId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(studentIdSP, studentId);
  }

  static Future<String> getStudentIdSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(studentIdSP);
  }

  static Future saveRefresh(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(refreshSP, value);
  }

  static Future<bool> getRefresh() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(refreshSP);
  }

  static clearSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
