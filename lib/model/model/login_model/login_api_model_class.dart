// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

class LoginModel {
  int statusCode;
  String message;
  Data data;
  dynamic error;

  LoginModel({
    required this.statusCode,
    required this.message,
    required this.data,
    this.error,
  });

  factory LoginModel.fromRawJson(String str) => LoginModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
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

class Data {
  String token;
  String expires;
  int physicianId;
  String name;
  String guid;
  String email;
  String npi;

  Data({
    required this.token,
    required this.expires,
    required this.physicianId,
    required this.name,
    required this.guid,
    required this.email,
    required this.npi,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json["Token"],
    expires: json["expires"],
    physicianId: json["PhysicianId"],
    name: json["Name"],
    guid: json["Guid"],
    email: json["Email"],
    npi: json["NPI"],
  );

  Map<String, dynamic> toJson() => {
    "Token": token,
    "expires": expires,
    "PhysicianId": physicianId,
    "Name": name,
    "Guid": guid,
    "Email": email,
    "NPI": npi,
  };
}
