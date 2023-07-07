// To parse this JSON data, do
//
//     final smartPgxApiModel = smartPgxApiModelFromJson(jsonString);

import 'dart:convert';

class SearchApiModel {
  int statusCode;
  String message;
  Data data;
  dynamic error;

  SearchApiModel({
    required this.statusCode,
    required this.message,
    required this.data,
    this.error,
  });

  factory SearchApiModel.fromRawJson(String str) => SearchApiModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchApiModel.fromJson(Map<String, dynamic> json) => SearchApiModel(
    statusCode: json["StatusCode"],
    message: json["Message"],
    data: Data.fromJson(json["Data"]),
    error: json["Error"],
  );

  Map<String, dynamic> toJson() => {
    "StatusCode": statusCode,
    "Message": message,
    "Data": data.toJson(),
    "Error": error,
  };
}


// data ka inside list of patient
class Data {
  List<Patient> patients;
  int id;
  String firstName;
  String lastName;
  String email;

  Data({
    required this.patients,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    patients: List<Patient>.from(json["Patients"].map((x) => Patient.fromJson(x))),
    id: json["Id"],
    firstName: json["FirstName"],
    lastName: json["LastName"],
    email: json["Email"],
  );

  Map<String, dynamic> toJson() => {
    "Patients": List<dynamic>.from(patients.map((x) => x.toJson())),
    "Id": id,
    "FirstName": firstName,
    "LastName": lastName,
    "Email": email,
  };
}

class Patient {
  int id;
  String firstName;
  String lastName;
  String dob;
  String? email;
  int age;
  String gender;
  String? token;
  String? status;
  String guid;
  List<Drug> drugs;

  Patient({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.dob,
    this.email,
    required this.age,
    required this.gender,
    this.token,
    this.status,
    required this.guid,
    required this.drugs,
  });

  factory Patient.fromRawJson(String str) => Patient.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
    id: json["Id"],
    firstName: json["FirstName"],
    lastName: json["LastName"],
    dob: json["DOB"],
    email: json["Email"],
    age: json["Age"],
    gender: json["Gender"],
    token: json["Token"],
    status: json["Status"],
    guid: json["GUID"],
    drugs: List<Drug>.from(json["Drugs"].map((x) => Drug.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "FirstName": firstName,
    "LastName": lastName,
    "DOB": dob,
    "Email": email,
    "Age": age,
    "Gender": gender,
    "Token": token,
    "Status": status,
    "GUID": guid,
    "Drugs": List<dynamic>.from(drugs.map((x) => x.toJson())),
  };
}

class Drug {
  String id;
  String drug;
  dynamic drugTherapeuticArea;

  Drug({
    required this.id,
    required this.drug,
    this.drugTherapeuticArea,
  });

  factory Drug.fromRawJson(String str) => Drug.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Drug.fromJson(Map<String, dynamic> json) => Drug(
    id: json["Id"],
    drug: json["Drug"],
    drugTherapeuticArea: json["DrugTherapeuticArea"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Drug": drug,
    "DrugTherapeuticArea": drugTherapeuticArea,
  };
}
