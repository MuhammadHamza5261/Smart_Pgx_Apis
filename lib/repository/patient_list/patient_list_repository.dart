import '../../model/model/patient_list/patient_list_model.dart';
import '../../service/patient_service/patient_list_service.dart';

class SmartPgxRepository{

  SmartPgxApiModel? smartPgxApiModel;
//  use the service class
  SmartPgxGetService? smartPgxGetService = SmartPgxGetService();

  Future<SmartPgxApiModel> setDatatoSmartSmart()
  async{
    smartPgxApiModel = await smartPgxGetService!.getDataToSmartService();
    return smartPgxApiModel!;

  }

}