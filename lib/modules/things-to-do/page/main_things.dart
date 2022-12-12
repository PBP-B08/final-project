import 'package:cultural_center/modules/things-to-do/API/fetchProvince.dart';
import 'package:cultural_center/widgets/drawer.dart';
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
        drawer: const MyDrawer(),
        body: SingleChildScrollView(
          child:FutureBuilder(
            future: fetchProvince(),
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
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => InkWell(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: const [
                              BoxShadow(color: Colors.black, blurRadius: 2.0)
                            ]),
                        child: Card(
                            clipBehavior: Clip.antiAlias,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.place),
                                  title: Text("${snapshot.data![index].fields.title}"),
                                  subtitle: Text(
                                    "${snapshot.data![index].fields.header}",
                                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    "${snapshot.data![index].fields.summary}",
                                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                                  ),
                                ),
                                // ButtonBar(
                                //   alignment: MainAxisAlignment.start,
                                //   children: [
                                //     TextButton(
                                //       // color: const Color(0xFF6200EE),
                                //       // style: flatButtonS,
                                //       onPressed: () {
                                //         // Perform some action
                                //       },
                                //       child: const Text('FOOD'),
                                //     ),
                                //     TextButton(
                                //       // textColor: const Color(0xFF6200EE),
                                //       onPressed: () {
                                //         // Perform some action
                                //       },
                                //       child: const Text('EVENT'),
                                //     ),
                                //   ],
                                // ),
                                 Image.network(
                                  "${snapshot.data![index].fields.image}",
                                  // width: 300,
                                  // height: 250,
                                  fit: BoxFit.cover,
                                ),
                                // Image.network("${snapshot.data![index].fields.image}"),
                              ],
                            ),
                          ),
                        
                        
                        // ListTile(
                        //   // leading: FlutterLogo(size: 72.0),
                        //   title: Text("${snapshot.data![index].fields.title}"),
                        //   subtitle: Text(
                        //     "${snapshot.data![index].fields.header}",
                        //   ),
                        //   // trailing: Icon(Icons.more_vert),
                        //   isThreeLine: true,
                        // ),
                        
                      ),
                      onTap: () {
                        // Route menu ke halaman detail
                        // showedWatchList = snapshot.data![index];
                        // indexStatus = index;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailThingsPage(
                                  provId: snapshot.data![index].pk,
                                  provName:
                                      snapshot.data![index].fields.title)),
                        );
                      },
                    ),
                  );
                }
              }
            })
        )
    );
  }
}
