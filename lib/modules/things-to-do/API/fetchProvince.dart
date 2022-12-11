import '../model/province.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// late Food foodlist;

// bool getStatusBool(Watched isWatched) {
//   if (isWatched == Watched.YES) {
//     return true;
//   }
//   return false;
// }

Future<List<Province>> fetchProvince() async {
  var url = Uri.parse('https://cultural-center.up.railway.app/things-to-do/json/province');
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
  List<Province> provinceList = [];
  for (var d in data) {
    if (d != null) {
      var dataList = Province.fromJson(d);
      provinceList.add(dataList);
      // listStatus.add(getStatusBool(dataList.fields.watched));
    }
  }

  return provinceList;
}
