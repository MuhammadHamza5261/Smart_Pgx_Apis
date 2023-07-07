import '../../model/model/patient_list/patient_list_model.dart';
import '../../model/model/search_api/search_api_model.dart';

abstract class SmartPgxState{}

class SmartPgxInitialState extends SmartPgxState{}

class SmartPgxInProgressState extends SmartPgxState{}



class SmartPgxInProgressStateTwo extends SmartPgxState{}

class SmartPgxDataIsLoadedState extends SmartPgxState{

  SmartPgxApiModel smartPgxApiModel;
  SmartPgxDataIsLoadedState({required this.smartPgxApiModel});

}


class SmartPgxDataIssLoadedState extends SmartPgxState{
  SearchApiModel searchApiModel;
  SmartPgxDataIssLoadedState({required this.searchApiModel});

}


class SmartPgxFailure extends SmartPgxState{

  final String  errorMessage;
  SmartPgxFailure(this.errorMessage);





}