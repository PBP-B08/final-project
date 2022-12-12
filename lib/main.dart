import 'package:cultural_center/widgets/drawer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart'; 
import 'package:flutter/material.dart';
import 'package:cultural_center/authentication/login.dart';
import 'package:cultural_center/modules/faq_review/page/review.dart';
import 'authentication/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      builder: (context, child) => MaterialApp(
        title: 'Flutter App',
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
        ),
        home: const MyHomePage(title: 'Cultural Center'),
        routes: {
          "/login": (BuildContext context) => const LoginPage(),
          "/register": (BuildContext context) => const RegisterPage(),
          "/review": (BuildContext context) => const MyReviewPage(), 
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // add padding to the text
            Image.asset('assets/main-img.png',
                width: 300,
                height: 400),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Begin Your Journey in Indonesia',
              ),
            ),
            // button to redirect to login page
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/login");
              },
              child: const Text('Login'),
            ),
            // button to redirect to register page
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/register");
              },
              child: const Text('Register'),
            ),
            const SizedBox(height: 30),
            const Text(
                "Icon image: flaticon.com",
                style: TextStyle(color: Colors.grey,
                fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
