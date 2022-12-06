// import 'package:counter_7/page/detail_page.dart';
// import 'package:flutter/material.dart';
// import 'package:counter_7/page/drawer.dart';
// import 'package:counter_7/fetchData.dart';

// class MyWatchListPage extends StatefulWidget {
//   const MyWatchListPage({Key? key}) : super(key: key);

//   @override
//   State<MyWatchListPage> createState() => _MyWatchListPageState();
// }

// class _MyWatchListPageState extends State<MyWatchListPage> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('My Watch List'),
//         ),
//         drawer: DrawerApp(),
//         body: FutureBuilder(
//             future: fetchWatchList(),
//             builder: (context, AsyncSnapshot snapshot) {
//               if (snapshot.data == null) {
//                 return const Center(child: CircularProgressIndicator());
//               } else {
//                 if (!snapshot.hasData) {
//                   return Column(
//                     children: const [
//                       Text(
//                         "Tidak ada watch list :(",
//                         style:
//                             TextStyle(color: Color(0xff59A5D8), fontSize: 20),
//                       ),
//                       SizedBox(height: 8),
//                     ],
//                   );
//                 } else {
//                   return ListView.builder(
//                       itemCount: snapshot.data!.length,
//                       itemBuilder: (_, index) => ListTile(
//                             title: InkWell(
//                               child: Container(
//                                 margin: const EdgeInsets.symmetric(
//                                     horizontal: 16, vertical: 12),
//                                 padding: const EdgeInsets.all(20.0),
//                                 decoration: (listStatus[index])
//                                     ? BoxDecoration(
//                                         border: Border.all(color: Colors.green),
//                                         color: Colors.white,
//                                         borderRadius:
//                                             BorderRadius.circular(5.0),
//                                         boxShadow: const [
//                                             BoxShadow(
//                                                 color: Colors.black,
//                                                 blurRadius: 2.0)
//                                           ])
//                                     : BoxDecoration(
//                                         border: Border.all(color: Colors.red),
//                                         color: Colors.white,
//                                         borderRadius:
//                                             BorderRadius.circular(5.0),
//                                         boxShadow: const [
//                                             BoxShadow(
//                                                 color: Colors.black,
//                                                 blurRadius: 2.0)
//                                           ]),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       "${snapshot.data![index].fields.title}",
//                                       style: const TextStyle(
//                                         fontSize: 18.0,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               onTap: () {
//                                 // Route menu ke halaman detail
//                                 showedWatchList = snapshot.data![index];
//                                 indexStatus = index;
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => const DetailPage()),
//                                 );
//                               },
//                             ),
//                             trailing: Checkbox(
//                               value: listStatus[index],
//                               onChanged: (bool? newWatched) => {
//                                 setState(() =>
//                                     listStatus[index] = !listStatus[index])
//                               },
//                             ),
//                           ));
//                 }
//               }
//             }));
//   }
// }
