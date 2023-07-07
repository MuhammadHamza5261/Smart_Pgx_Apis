import 'package:smartpgxproject/service/search_api_service/search_api_service_class.dart';

import '../../model/model/search_api/search_api_model.dart';

//
class SearchListRepository{

//  firstly we can use the model

  SearchApiModel? searchApiModel;

  // and then use the service class

  SearchApiService? searchApiService = SearchApiService();

  Future<SearchApiModel> setDatatoSearchSearch({required String search})
  async{
    searchApiModel = await  searchApiService!.getDataToApiService(search);
    return searchApiModel!;




  }

}