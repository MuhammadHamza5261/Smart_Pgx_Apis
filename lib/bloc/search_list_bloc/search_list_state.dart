import '../../model/model/search_api/search_api_model.dart';

abstract class SearchListState{}

class SearchInitialState extends SearchListState{}


class SearchInProgressState extends SearchListState{}




// class SearchResultsState extends SearchListState {
//   final List<SearchResultsState> results;
//
//   SearchResultsState({required this.results});
// }


class SearchDataIsLoadedState extends SearchListState{

   SearchApiModel searchApiModel;
   SearchDataIsLoadedState({required this.searchApiModel});

}


class SearchIsFailure extends SearchListState{

  final String errorMesssage;
  SearchIsFailure(this.errorMesssage);


}