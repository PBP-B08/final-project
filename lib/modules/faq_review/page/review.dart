import 'package:flutter/material.dart';
import 'package:cultural_center/modules/faq_review/drawer/myDrawer.dart';
import 'package:cultural_center/modules/faq_review/model/dataReview.dart';
import 'package:cultural_center/modules/faq_review/data/fetchDataReview.dart';
import 'package:cultural_center/modules/faq_review/Widget/widgetReview.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class MyReviewPage extends StatefulWidget {
    const MyReviewPage({Key? key}) : super(key: key);

    @override
    _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<MyReviewPage> {
    final _formKey = GlobalKey<FormState>();
    String _judul = "";
    String _review = "";
    DateTime? _dateTime;
    var c1 = const Color(0Xffa770ef);
    var c2 = const Color(0Xffd8b4fe);
    var c3 = const Color(0Xfffdb99b);
    @override
    Widget build(BuildContext context){
            return Scaffold(
            appBar: AppBar(
                title: const Text('Review'),
            ),
            drawer: const MyDrawer(),
            body: Container(
                decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [
                    c1,
                    c2,
                    c3,
                  ]
                )     
              ),
              child: Column(
              children: [
                const Text(
                  'Review from user',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  ),
                Expanded(
                  child: FutureBuilder(
                        future: fetchReview(),
                        builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.data == null) {
                            return const Center(child: CircularProgressIndicator());
                            } else {
                            if (!snapshot.hasData) {
                                return Column(
                                children: const [
                                    Text(
                                    "Tidak ada review :(",
                                    style: TextStyle(
                                        color: Color(0xff59A5D8),
                                        fontSize: 20),
                                    ),
                                    SizedBox(height: 8),
                                ],
                                );
                            } else {
                                return ListView.builder(
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (_, index)=> Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                                            fontWeight: FontWeight.bold,
                                            ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text("${snapshot.data![index].fields.review}"),
                                        ],
                                    ),
                                    )
                                );
                            }
                            }
                        }
                    ),
                  ),
                  const WidgetModalReview(), // Calling function
              ],
            )
          ) 
        );
    }
}