import 'package:cultural_center/modules/faq_review/model/modelFaq.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Faq>> fetchFaq() async {
  var url = Uri.parse('https://cultural-center.up.railway.app/faq-review/show_json_faq/');
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
  List<Faq> listFaq = [];
  for (var d in data) {
    if (d != null) {
      listFaq.add(Faq.fromJson(d));
    }
  }
    return listFaq;
}