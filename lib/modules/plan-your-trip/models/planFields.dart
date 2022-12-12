// To parse this JSON data, do
//
//     final trip = tripFromJson(jsonString);

import 'dart:convert';

List<Trip> tripFromJson(String str) => List<Trip>.from(json.decode(str).map((x) => Trip.fromJson(x)));

String tripToJson(List<Trip> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Trip {
    Trip({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Trip.fromJson(Map<String, dynamic> json) => Trip(
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
        required this.judul,
        required this.destinasi,
        required this.aktivitas,
        required this.hari,
        required this.orang,
        required this.deskripsi,
    });

    int user;
    String judul;
    String destinasi;
    String aktivitas;
    int hari;
    int orang;
    String deskripsi;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        judul: json["judul"],
        destinasi: json["destinasi"],
        aktivitas: json["aktivitas"],
        hari: json["hari"],
        orang: json["orang"],
        deskripsi: json["deskripsi"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "judul": judul,
        "destinasi": destinasi,
        "aktivitas": aktivitas,
        "hari": hari,
        "orang": orang,
        "deskripsi": deskripsi,
    };
}
