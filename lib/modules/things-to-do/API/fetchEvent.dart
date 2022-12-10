import 'package:counter_7/model/watch_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

late WatchList showedWatchList;
List<bool> listStatus = [];
int indexStatus = 0;

bool getStatusBool(Watched isWatched) {
  if (isWatched == Watched.YES) {
    return true;
  }
  return false;
}

Future<List<WatchList>> fetchWatchList() async {
  var url = Uri.parse('http://katalog-app-pbp.herokuapp.com/mywatchlist/json/');
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
  List<WatchList> watchList = [];
  for (var d in data) {
    if (d != null) {
      var dataList = WatchList.fromJson(d);
      watchList.add(dataList);
      listStatus.add(getStatusBool(dataList.fields.watched));
    }
  }

  return watchList;
}
