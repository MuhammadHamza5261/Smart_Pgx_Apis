import 'dart:convert';
import 'package:http/http.dart'as http;
import '../../model/model/login_model/login_api_model_class.dart';
import '../../model/model/search_api/search_api_model.dart';
import '../../shared_preferences/shared_preference_client.dart';
import '../../ui/api_const.dart';

class SearchApiService
{
  Future<SearchApiModel> getDataToApiService(String search,)
  async{

    //simply get the id from shared preference class

    String id =  await SharedPreferencesClient.getId();
    String token =  await SharedPreferencesClient.getToken();
    print(id);


    final response = await http.get(Uri.parse(
        '${ApiConstants.baseUrl}v1.1/Providers/$id/AssociatedPatients/$search/${1}/${25}'),

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
      return SearchApiModel.fromJson(data);

    }
    else
    {
      throw Exception('${response.statusCode} : ${response.reasonPhrase}');
    }
  }
}