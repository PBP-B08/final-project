// To parse this JSON data, do
//
//     final review = reviewFromJson(jsonString);

import 'dart:convert';

List<Review> reviewFromJson(String str) => List<Review>.from(json.decode(str).map((x) => Review.fromJson(x)));

String reviewToJson(List<Review> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Review {
    Review({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Review.fromJson(Map<String, dynamic> json) => Review(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    Fields({
        required this.user,
        required this.username,
        required this.dateAdd,
        required this.title,
        required this.review,
    });

    int user;
    String username;
    DateTime dateAdd;
    String title;
    String review;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        username: json["username"],
        dateAdd: DateTime.parse(json["date_add"]),
        title: json["title"],
        review: json["review"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "username": username,
        "date_add": "${dateAdd.year.toString().padLeft(4, '0')}-${dateAdd.month.toString().padLeft(2, '0')}-${dateAdd.day.toString().padLeft(2, '0')}",
        "title": title,
        "review": review,
    };
}
