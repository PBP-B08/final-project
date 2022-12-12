import '../models/planFields.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Trip>> fetchTrip() async {
  var url = Uri.parse('https://cultural-center.up.railway.app/plan/show_json');
  var response = await http.get(
  url,
  headers: {
    "Access-Control-Allow-Origin": "*",
    "Content-Type": "application/json",
    },
  );
    // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object ToDo
  List<Trip> listTrip = [];
  for (var d in data) {
    if (d != null) {
      listTrip.add(Trip.fromJson(d));
    }
  }
    return listTrip;
}