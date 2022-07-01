// To parse this JSON data, do
//
//     final usersModel = usersModelFromJson(jsonString);

import 'dart:convert';

List<UsersModel> usersModelFromJson(String str) => List<UsersModel>.from(json.decode(str).map((x) => UsersModel.fromJson(x)));

String usersModelToJson(List<UsersModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UsersModel {
    UsersModel({
        this.albumId,
        this.userId,
        this.name,
        this.url,
        this.thumbnailUrl,
    });

    int? albumId;
    int? userId;
    String? name;
    String? url;
    String? thumbnailUrl;

    factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        albumId: json["albumId"],
        userId: json["userId"],
        name: json["name"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
    );

    Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "userId": userId,
        "name": name,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
    };
}
