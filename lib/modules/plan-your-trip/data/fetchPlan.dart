

// To parse this JSON data, do
//
//     final planTrip = planTripFromJson(jsonString);

import 'dart:convert';

List<PlanTrip> planTripFromJson(String str) => List<PlanTrip>.from(json.decode(str).map((x) => PlanTrip.fromJson(x)));

String planTripToJson(List<PlanTrip> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PlanTrip {
    PlanTrip({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory PlanTrip.fromJson(Map<String, dynamic> json) => PlanTrip(
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



/*
  user = models.ForeignKey(User, on_delete = models.CASCADE)
    judul = models.CharField(max_length=50)
    destinasi = models.CharField(max_length=150)
    #tanggal = models.DateField()
    aktivitas = models.CharField(max_length=50)
    hari = models.IntegerField()
    orang = models.IntegerField()
    deskripsi = models.TextField()
*/

/*
STRUKTUR JSON
[{
  "model": "PlanYourTrip.planproperties", 
  "pk": 5, 
  "fields": 
    {
      "user": 38, 
      "judul": "Holiday", 
      "destinasi": "Bandung", 
      "aktivitas": "Berenang", 
      "hari": 1, 
      "orang": 1, 
      "deskripsi": 
      "Bermain main"}
      }]
*/