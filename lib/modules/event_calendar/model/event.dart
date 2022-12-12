// To parse this JSON data, do
//
//     final event = eventFromJson(jsonString);

import 'dart:convert';

List<Event> eventFromJson(String str) =>
    List<Event>.from(json.decode(str).map((x) => Event.fromJson(x)));

String eventToJson(List<Event> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Event {
  Event({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
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
    required this.province,
    required this.name,
    required this.date,
    required this.description,
    required this.image,
  });

  String province;
  String name;
  DateTime date;
  String description;
  String image;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        province: json["province"],
        name: json["name"],
        date: DateTime.parse(json["date"]),
        description: json["description"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "province": province,
        "name": name,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "description": description,
        "image": image,
      };
}
