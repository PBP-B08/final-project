import 'dart:html';

import 'package:flutter/material.dart';
import '../../../drawer.dart';
import '../API/fetchEvent.dart';
import '../API/fetchFood.dart';

class DetailThingsPage extends StatefulWidget {
  final int provId;
  final String provName;

  const DetailThingsPage({Key? key, required this.provId, required this.provName}) : super(key: key);

  @override
  State<DetailThingsPage> createState() => _DetailThingsPageState(provId, provName);
}

class _DetailThingsPageState extends State<DetailThingsPage> {
  // String getStatus(bool isWatched) {
  //   if (isWatched) {
  //     return "Watched";
  //   } else {
  //     return "Unwatched";
  //   }
  // }
  final int provId;
  final String provName;
  _DetailThingsPageState(this.provId, this.provName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Things to Do in $provName"),
      ),
      drawer: DrawerApp(),
      body: SingleChildScrollView(child:
      Column(children: [
        const SizedBox(height: 30),
        const Text("Food",
          style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                )),
        const SizedBox(height: 10),
        FutureBuilder(
            future: fetchFood(provId),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada makanan :(",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 10),
                    ],
                  );
                } else {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    color:Colors.white,
                                    borderRadius: BorderRadius.circular(15.0),
                                    boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 2.0
                                    )
                                    ]
                                ),
                                child: ListTile(
                                          // leading: FlutterLogo(size: 72.0),
                                          title: Text("${snapshot.data![index].fields.name}"),
                                          subtitle: Text(
                                            "${snapshot.data![index].fields.description}",
                                          ),
                                          // trailing: Icon(Icons.more_vert),
                                          isThreeLine: true,
                                        ),
                                      ),
                      );
                }
              }
            }),
            const SizedBox(height: 30),
            const Text("Event",
              style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    )),
            const SizedBox(height: 10),
            FutureBuilder(
                future: fetchEvent(provId),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (!snapshot.hasData) {
                      return Column(
                        children: const [
                          Text(
                            "Tidak ada event :(",
                            style:
                                TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                          ),
                          SizedBox(height: 10),
                        ],
                      );
                    } else {
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) => Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                        color:Colors.white,
                                        borderRadius: BorderRadius.circular(15.0),
                                        boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black,
                                            blurRadius: 2.0
                                        )
                                        ]
                                    ),
                                    child: ListTile(
                                              // leading: FlutterLogo(size: 72.0),
                                              title: Text("${snapshot.data![index].fields.name}"),
                                              subtitle: Text(
                                                "${snapshot.data![index].fields.description}",
                                              ),
                                              trailing: Text("${snapshot.data![index].fields.date.toString().substring(0, 11)}"),
                                              isThreeLine: true,
                                            ),
                                          ),
                          );
                    }
                  }
                }),
                const SizedBox(height: 20),
                TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(16.0),
                      textStyle: const TextStyle(fontSize: 20),
                      minimumSize: const Size.fromHeight(5),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Back'),
                  ),   
          ],
        )
      ),
    );
  }
}
