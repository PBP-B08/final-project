// To parse this JSON data, do
//
//     final province = provinceFromJson(jsonString);

import 'dart:convert';

List<Province> provinceFromJson(String str) => List<Province>.from(json.decode(str).map((x) => Province.fromJson(x)));

String provinceToJson(List<Province> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Province {
    Province({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Province.fromJson(Map<String, dynamic> json) => Province(
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
        required this.title,
        required this.header,
        required this.summary,
        required this.image,
    });

    String title;
    String header;
    String summary;
    String image;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        title: json["title"],
        header: json["header"],
        summary: json["summary"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "header": header,
        "summary": summary,
        "image": image,
    };
}
