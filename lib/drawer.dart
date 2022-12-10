import 'main.dart';
import 'modules/things-to-do/page/main_things.dart';
import 'modules/recommendation/recommendation.dart';
import 'package:flutter/material.dart';

class DrawerApp extends StatelessWidget {
  DrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Menambahkan clickable menu
          ListTile(
            title: const Text('Home'),
            onTap: () {
              // Route menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Cultural Center'))
              );
            },
          ),
          ListTile(
            title: const Text('Recommendation'),
            onTap: () {
              // Route menu ke halaman utama
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(builder: (context) => MyHomePage()),
              // );
            },
          ),
          ListTile(
            title: const Text('Things to Do'),
            onTap: () {
              // Route menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ThingsToDoPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
