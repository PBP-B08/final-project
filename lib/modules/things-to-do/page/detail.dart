import 'package:flutter/material.dart';
import '../../../drawer.dart';
import '../API/fetchEvent.dart';
import '../API/fetchFood.dart';

class DetailThingsPage extends StatefulWidget {
  const DetailThingsPage({Key? key}) : super(key: key);

  @override
  State<DetailThingsPage> createState() => _DetailThingsPageState();
}

class _DetailThingsPageState extends State<DetailThingsPage> {
  String getStatus(bool isWatched) {
    if (isWatched) {
      return "Watched";
    } else {
      return "Unwatched";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      drawer: DrawerApp(),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Text(showedWatchList.fields.title,
                style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                )),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          style: const TextStyle(fontSize: 16.0),
                          children: [
                        const TextSpan(
                            text: "Release Date: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        TextSpan(
                            text: showedWatchList.fields.releaseDate
                                .toString()
                                .substring(0, 10))
                      ])),
                  const SizedBox(height: 10),
                  RichText(
                      text: TextSpan(
                          style: const TextStyle(fontSize: 16.0),
                          children: [
                        const TextSpan(
                            text: "Rating: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        TextSpan(text: "${showedWatchList.fields.rating}/5")
                      ])),
                  const SizedBox(height: 10),
                  RichText(
                      text: TextSpan(
                          style: const TextStyle(fontSize: 16.0),
                          children: [
                        const TextSpan(
                            text: "Status: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        TextSpan(text: getStatus(listStatus[indexStatus]))
                      ])),
                  const SizedBox(height: 10),
                  const Text("Review:",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(showedWatchList.fields.review,
                      style: const TextStyle(
                        fontSize: 16.0,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(left: 30),
        child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
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
      ),
    );
  }
}
