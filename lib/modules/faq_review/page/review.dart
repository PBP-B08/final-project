import 'package:flutter/material.dart';
import 'package:cultural_center/widgets/drawer.dart';
import 'package:cultural_center/modules/faq_review/data/fetchDataReview.dart';
import 'package:cultural_center/modules/faq_review/Widget/widgetReview.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

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

    Future<http.Response> deleteReview(int id) async {
      var url ='https://cultural-center.up.railway.app/faq-review/delete_flutter/$id/';
      final http.Response response = await http.delete(
        Uri.parse(url, 
        ),
      );
      return response;
    }

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
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0) 
                                        ),
                                        child: SizedBox(
                                          height: 180,
                                          child: Container(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      "${snapshot.data![index].fields.title}",
                                                      style: const TextStyle(
                                                      fontSize: 18.0,
                                                      fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    IconButton(
                                                      onPressed: () async {
                                                        await deleteReview(snapshot.data![index].pk);
                                                        // ignore: use_build_context_synchronously
                                                        Navigator.popAndPushNamed(context, "/review");
                                                      },
                                                      icon: const Icon(Icons.delete),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const Icon(Icons.supervised_user_circle_rounded),
                                                    Text(
                                                      "${snapshot.data![index].fields.username}",
                                                      ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const Icon(Icons.reviews_outlined),
                                                    Text(
                                                      "${snapshot.data![index].fields.review}",
                                                      ),
                                                  ],
                                                ),                                                                                                                                                
                                              ],
                                            ), 
                                            ),
                                        ),
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