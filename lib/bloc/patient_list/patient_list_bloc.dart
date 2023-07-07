import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpgxproject/bloc/patient_list/patient_list_event.dart';
import 'package:smartpgxproject/bloc/patient_list/patient_list_state.dart';
import '../../model/model/patient_list/patient_list_model.dart';
import '../../model/model/search_api/search_api_model.dart';
import '../../repository/patient_list/patient_list_repository.dart';
import '../../repository/search_list_repository/searchlist_repository.dart';



class SmartPgxBloc extends Bloc<SmartPgxEvent,SmartPgxState>{


  //use the model class
  SmartPgxApiModel? smartPgxApiModel;
  //2nd
  SearchApiModel? searchApiModel;


   //  use the repository class
  SmartPgxRepository smartPgxRepository = SmartPgxRepository();

  //2nd
  SearchListRepository searchListRepository = SearchListRepository();




  SmartPgxBloc():super(SmartPgxInitialState()){

    on<SmartPgxEvent>((event,emit) async{

      if(event is SetDataToSmartPgx) {
        emit(SmartPgxInProgressState());

        try {
          smartPgxApiModel = (await smartPgxRepository.setDatatoSmartSmart());



          emit(
              SmartPgxDataIsLoadedState(smartPgxApiModel: smartPgxApiModel!));


        }
        catch(e){
          emit(SmartPgxFailure('Something went wrong'));

        }

      }





      if (event is SetDataToSearch) {
        emit(SmartPgxInProgressState());

        try {

          searchApiModel = await searchListRepository.setDatatoSearchSearch(search: event.search);

          emit(SmartPgxDataIssLoadedState(searchApiModel: searchApiModel!));
        }

        catch (e) {
          emit(SmartPgxFailure('Something went wrong'));
        }






      }
    });
  }

}