import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesClient {
  static const String _ktoken = 'token';
  static const String _kid = 'id';



  //creating a setter of token
  static Future<void> setToken(String token) async
  {
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setString(_ktoken, token);

  }




  //creating a getter of token
  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userName = prefs.getString(_ktoken);
    return userName!;
  }



  // creating a setter of id

  static Future<void> setId(String id) async
  {
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setString(_kid, id);

  }



  //creating a getter of id
  static Future<String> getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userName = prefs.getString(_kid);
    return userName!;
  }


}