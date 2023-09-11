import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static Future<bool> savestate(String state) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final res = pref.setString('onboard', state);
    return res;
  }

  static Future<bool> hasData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final res = pref.getString('onboard') ?? '';

    return res.isNotEmpty;
  }

  static Future<String> saveToken(String token) {
    return SharedPreferences.getInstance().then((pref) {
      pref.setString('token', token);
      return token;
    });
  }

  static Future<String> getToken() {
    return SharedPreferences.getInstance().then((pref) {
      print(pref.getString('token'));
      return pref.getString('token') ?? '';
    });
  }

  static Future<bool> isLogin() {
    return SharedPreferences.getInstance().then((pref) {
      return pref.getString('token')?.isNotEmpty ?? false;
    });
  }
}
