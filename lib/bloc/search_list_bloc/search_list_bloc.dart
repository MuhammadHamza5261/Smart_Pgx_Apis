import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpgxproject/bloc/search_list_bloc/search_list_event.dart';
import 'package:smartpgxproject/bloc/search_list_bloc/search_list_state.dart';
import 'package:smartpgxproject/repository/search_list_repository/searchlist_repository.dart';
import '../../model/model/search_api/search_api_model.dart';

class SearchListBloc extends Bloc<SearchListEvent,SearchListState>{

//  firstly we use the model class

  SearchApiModel? searchApiModel;

//  use the repository class

  SearchListRepository searchListRepository = SearchListRepository();


  SearchListBloc():super(SearchInitialState()){

    on<SearchListEvent>((event,emit) async{


      if(event is SetDataToSearch){
        emit(SearchInProgressState());


        try{

          searchApiModel = (await searchListRepository.setDatatoSearchSearch(search: event.search));
          emit(SearchDataIsLoadedState(searchApiModel: searchApiModel!));


        }
            catch(e){

          emit(SearchIsFailure('Something went wrong'));

            }
      }
    });
  }
}