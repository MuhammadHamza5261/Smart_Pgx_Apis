import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smartpgxproject/ui/api_const.dart';
import 'package:smartpgxproject/ui/patient_list_screen.dart';
import '../../model/model/login_model/login_api_model_class.dart';
import '../../shared_preferences/shared_preference_client.dart';



class LoginService
{
  Future<void> setDataToLoginService({required String email, required String password, required BuildContext context})

  async {

    final body = jsonEncode({
      "Email": email,
      "Password": password,
    });

    final response = await http.post(Uri.parse(ApiConstants.loginUrl),


    headers: <String,String>
      {
        'Content-type': 'application/json',
        'Accept': 'application/json',

      },
      body: body,
    );


    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      String token = LoginModel.fromJson(json).data.token;
      debugPrint('My token is : $token');

      // set token from shared preferences
      SharedPreferencesClient.setToken(token);


      //set the id
      String id = LoginModel.fromJson(json).data.physicianId.toString() ;
      print('My token is : $id');

      // set token from shared preferences
      SharedPreferencesClient.setId(id);









      if(context.mounted){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const SmartPgxSTF()),
        );
      }

    }

    else
    {
      throw Exception('${response.statusCode} : ${response.reasonPhrase}');
    }

  }
}