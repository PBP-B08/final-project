import 'detail.dart';
import 'package:flutter/material.dart';

class ThingsToDoPage extends StatefulWidget {
  const ThingsToDoPage({Key? key}) : super(key: key);

  @override
  State<ThingsToDoPage> createState() => _ThingsToDoPageState();
}

class _ThingsToDoPageState extends State<ThingsToDoPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Things to Do'),
        ),
        // drawer: DrawerApp(),
        body: FutureBuilder(
            // future: fetchWatchList(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada provinsi :(",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => InkWell(
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                padding: const EdgeInsets.all(20.0),
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
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${snapshot.data![index].fields.title}",
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                // Route menu ke halaman detail
                                // showedWatchList = snapshot.data![index];
                                // indexStatus = index;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const DetailPage()),
                                );
                              },
                            ),
                      );
                }
              }
            }));
  }
}
