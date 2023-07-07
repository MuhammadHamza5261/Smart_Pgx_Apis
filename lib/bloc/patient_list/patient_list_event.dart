abstract class SmartPgxEvent{}

class SetDataToSmartPgx extends SmartPgxEvent{}

class SetDataToSearch extends SmartPgxEvent{

  final String search;
  SetDataToSearch({required this.search});






}