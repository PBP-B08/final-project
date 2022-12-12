import 'package:cultural_center/modules/faq_review/model/modelReview.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Review>> fetchReview() async {
  var url = Uri.parse('https://cultural-center.up.railway.app/faq-review/show_json_review/');
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
  List<Review> listReview = [];
  for (var d in data) {
    if (d != null) {
      listReview.add(Review.fromJson(d));
    }
  }
    return listReview;
}