import '../model/food.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// late Food foodlist;

// bool getStatusBool(Watched isWatched) {
//   if (isWatched == Watched.YES) {
//     return true;
//   }
//   return false;
// }

Future<List<Food>> fetchFood(int provId) async {
  var url = Uri.parse('https://cultural-center.up.railway.app/things-to-do/json/food/$provId/');
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
  List<Food> foodList = [];
  for (var d in data) {
    if (d != null) {
      var dataList = Food.fromJson(d);
      foodList.add(dataList);
      // listStatus.add(getStatusBool(dataList.fields.watched));
    }
  }

  return foodList;
}
