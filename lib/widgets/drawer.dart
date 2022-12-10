import 'package:cultural_center/main.dart';
import 'package:cultural_center/modules/faq_review/page/faq.dart';
import 'package:cultural_center/modules/faq_review/page/review.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget{
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Menambahkan clickable menu
          ListTile(
            title: const Text('Homepage'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Cultural Center')),
              );
            },
          ),
          ListTile(
            title: const Text('Faq'),
            onTap: () {
              // Route menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyFaqPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Review'),
            onTap: () {
              // Route menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyReviewPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}