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
    print(res);
    return res.isNotEmpty;
  }
}
