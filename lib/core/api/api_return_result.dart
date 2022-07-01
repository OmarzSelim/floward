// To parse this JSON data, do
//
//     final ApiReturnResult = ApiReturnResultFromJson(jsonString);

import 'dart:convert';

ApiReturnResult apiReturnResultFromJson(String str) =>
    ApiReturnResult.fromJson(json.decode(str));

String apiReturnResultToJson(ApiReturnResult data) =>
    json.encode(data.toJson());

class ApiReturnResult {
  ApiReturnResult({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,
  });

  dynamic result;
  dynamic targetUrl;
  bool? success;
  Error? error;
  bool? unAuthorizedRequest;
  bool? abp;

  factory ApiReturnResult.fromJson(Map<String, dynamic> json) =>
      ApiReturnResult(
        result: json["result"],
        targetUrl: json["targetUrl"],
        success: json["success"],
        error: json["error"] == null ? null : Error.fromJson(json["error"]),
        unAuthorizedRequest: json["unAuthorizedRequest"],
        abp: json["__abp"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "targetUrl": targetUrl,
        "success": success,
        "error": error?.toJson(),
        "unAuthorizedRequest": unAuthorizedRequest,
        "__abp": abp,
      };
}

class Error {
  Error({
    this.code,
    this.message,
    this.details,
    this.validationErrors,
  });

  int? code;
  String? message;
  dynamic details;
  dynamic validationErrors;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        code: json["code"],
        message: json["message"],
        details: json["details"],
        validationErrors:
             json["validationErrors"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "details": details,
        "validationErrors": validationErrors,
      };
}

// class ApiReturnResult {
//   final int? code;
//   final String? message;
//   final dynamic data;
//   final List<String>? error;

//   ApiReturnResult({this.code, this.message, this.data, this.error});

//   //mapping json data
//   factory ApiReturnResult.fromJSON(Map<String, dynamic> jsonMap) {
//     final data = ApiReturnResult(
//         code: jsonMap["code"],
//         message: jsonMap["message"],
//         error: jsonMap["error"] == null
//             ? null
//             : List<String>.from(jsonMap["error"].map((x) => x)),
//         data: jsonMap["data"]);
//     return data;
//   }
//   Map<String, dynamic> toJson() => {
//         "code": code,
//         "message": message,
//         "error": error,
//         "data": data,
//       };
// }

// class DataModel {
//   final int length;
//   final List<dynamic> items;

//   DataModel({required this.length, required this.items});

//   factory DataModel.fromJSON(Map<String, dynamic> jsonMap) {
//     final data = DataModel(length: jsonMap["length"], items: jsonMap["items"]);
//     return data;
//   }
// }