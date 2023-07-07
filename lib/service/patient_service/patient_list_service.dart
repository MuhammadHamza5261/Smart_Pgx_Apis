import 'dart:convert';
import 'package:http/http.dart'as http;
import '../../model/model/patient_list/patient_list_model.dart';
import '../../shared_preferences/shared_preference_client.dart';
import '../../ui/api_const.dart';


class SmartPgxGetService
{
  Future<SmartPgxApiModel> getDataToSmartService()
  async{

  //  get the service class
  //   get the token
  String token =  await SharedPreferencesClient.getToken();

    final response = await http.get(Uri.parse(
      '${ApiConstants.baseUrl}v1.1/Providers/${161.toInt()}/AssociatedPatients/${1.toInt()}/${25.toInt()}'
    ),
      headers: <String,String>
      {
        "Content-type": "application/json",
        "Accept": "application/json",
        'Authorization': 'Bearer $token',
      },

    );

    if(response.statusCode == 200)
    {
      final data = jsonDecode(response.body);
      return SmartPgxApiModel.fromJson(data);
    }
    else
    {
      throw Exception('${response.statusCode} : ${response.reasonPhrase}');
    }
  }
}