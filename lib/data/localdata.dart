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

  static Future<void>deleteToken()async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove('token');
  }

  static Future<String>saveCart(String data)async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('cart', data);
    return data;
  }

  static Future<String>getCart()async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('cart')??'[]';
  }
 static Future<String> saveId(String id) {
    return SharedPreferences.getInstance().then((pref) {
      pref.setString('id', id);
      return id;
    });
  }

    static Future<String> getId() {
    return SharedPreferences.getInstance().then((pref) {
   
      return pref.getString('id') ?? '';
    });
  }

}
