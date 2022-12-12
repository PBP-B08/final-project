import 'dart:convert';
import 'package:cultural_center/modules/recommendation/pages/add_area.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:cultural_center/widgets/drawer.dart';
import 'package:cultural_center/modules/recommendation/models/area.dart';
import 'package:cultural_center/modules/things-to-do/model/province.dart';
import 'package:cultural_center/modules/recommendation/pages/area_detail.dart';

Future<List<Area>> fetchArea(int provinceID) async {
  var url = Uri.parse(
      'https://cultural-center.up.railway.app/recommendation/detail/$provinceID/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
    },
  );

  // decode response to json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // convert json to list of MyWatchlist
  List<Area> areaList = [];
  for (var item in data) {
    if (item != null) {
      areaList.add(Area.fromJson(item));
    }
  }

  return areaList;
}

class ProvinceDetail extends StatelessWidget {
  final Province province;
  final int provinceID;

  const ProvinceDetail({Key? key, required this.province, required this.provinceID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListTile addListTile(Area area) => ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
          title: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              area.title,
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AreaDetail(
                          area: area,
                        )));
          },
        );

    Card addCard(Area area) => Card(
          margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
          elevation: 7,
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.lightGreen,
            ),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Container(
            child: addListTile(area),
          ),
        );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Province Detail'),
      ),
      drawer: const MyDrawer(),
      body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    province.fields.title,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    // ignore: unnecessary_null_comparison
                    child: province.fields.image != null
                        ? Image.network(
                            province.fields.image,
                            width: 300,
                            height: 300,
                          )
                        : const Text('No image'),
                  ),
                ),
                const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      const TextSpan(
                          text: 'Header: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: '${province.fields.header}\n'),
                      const TextSpan(
                          text: 'Summary: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: '${province.fields.summary}\n'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            Expanded(
              child: FutureBuilder(
                  future: fetchArea(province.pk),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      if (!snapshot.hasData) {
                        return Column(
                          children: const [
                            Text(
                              "Recommendation is empty!",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 18, 226, 84),
                                  fontSize: 20),
                            ),
                            SizedBox(height: 8),
                          ],
                        );
                      } else {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (_, index) =>
                                addCard(snapshot.data![index]));
                      }
                    }
                  }),
            ),
          ])),

      // back button to previous page
      // persistentFooterButtons: [
      //   ElevatedButton(
      //     style: ElevatedButton.styleFrom(
      //       backgroundColor: Colors.lightGreen,
      //       minimumSize: const Size.fromHeight(40),
      //     ),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     child: const Text(
      //       'Back',
      //       style: TextStyle(fontSize: 12),
      //     ),
      //   ),
      // ],

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // route to add area page
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddAreaFormPage(
                        provinceId: province.pk,
                      )));
        },
        child: const Icon(Icons.add),
      ),
      persistentFooterButtons: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightGreen,
            minimumSize: const Size.fromHeight(40),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Back',
            style: TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}