// import 'package:counter_7/main.dart';
// import 'package:counter_7/page/tambah_budget.dart';
// import 'package:counter_7/page/data_budget.dart';
// import 'package:counter_7/page/mywatchlist.dart';
// import 'package:flutter/material.dart';

// class DrawerApp extends StatelessWidget {
//   DrawerApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Column(
//         children: [
//           // Menambahkan clickable menu
//           ListTile(
//             title: const Text('counter_7'),
//             onTap: () {
//               // Route menu ke halaman utama
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => MyHomePage()),
//               );
//             },
//           ),
//           ListTile(
//             title: const Text('Tambah Budget'),
//             onTap: () {
//               // Route menu ke halaman form
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => MyFormPage()),
//               );
//             },
//           ),
//           ListTile(
//             title: const Text('Data Budget'),
//             onTap: () {
//               // Route menu ke halaman utama
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => MyDataFormPage()),
//               );
//             },
//           ),
//           ListTile(
//             title: const Text('My Watch List'),
//             onTap: () {
//               // Route menu ke halaman utama
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => const MyWatchListPage()),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
