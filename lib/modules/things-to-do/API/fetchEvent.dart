import '../../../model/event.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// late Food foodlist;

// bool getStatusBool(Watched isWatched) {
//   if (isWatched == Watched.YES) {
//     return true;
//   }
//   return false;
// }

Future<List<Event>> fetchEvent(int provId) async {
  var url = Uri.parse('https://cultural-center.up.railway.app/things-to-do/json/event/$provId/');
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
  List<Event> eventList = [];
  for (var d in data) {
    if (d != null) {
      var dataList = Event.fromJson(d);
      eventList.add(dataList);
      // listStatus.add(getStatusBool(dataList.fields.watched));
    }
  }

  return eventList;
}
