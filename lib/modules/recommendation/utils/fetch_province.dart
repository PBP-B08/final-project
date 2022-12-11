import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cultural_center/modules/recommendation/models/province.dart';

Future<List<Province>> fetchMyWatchlist() async {
  var url = Uri.parse('https://cultural-center.up.railway.app/recommendation/json/');
  var response = await http.get(url, headers: {
    "Access-Control-Allow-Origin": "*",
    'Content-Type': 'application/json',
  },);

  // decode response to json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // convert json to list of MyWatchlist
  List<Province> arrMywatchlist = [];
  for (var item in data) {
    if (item != null) {
      arrMywatchlist.add(Province.fromJson(item));
    }
  }

  return arrMywatchlist;
}
