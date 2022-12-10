import 'package:flutter/material.dart';
import 'package:cultural_center/modules/faq_review/drawer/myDrawer.dart';
import 'package:cultural_center/modules/faq_review/model/modelFaq.dart';
import 'package:cultural_center/modules/faq_review/data/fetchDataFaq.dart';
import 'package:cultural_center/modules/faq_review/page/review.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class MyFaqPage extends StatefulWidget {
    const MyFaqPage({Key? key}) : super(key: key);

    @override
    _FaqState createState() => _FaqState();
}

class _FaqState extends State<MyFaqPage> {
    var c1 = const Color(0Xffa770ef);
    var c2 = const Color(0Xffd8b4fe);
    var c3 = const Color(0Xfffdb99b);
    @override
    Widget build(BuildContext context){
            return Scaffold(
            appBar: AppBar(
                title: const Text('Faq'),
            ),
            drawer: const MyDrawer(),
            body: Center(
              child: Container(
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
                    Expanded(
                      child: FutureBuilder(
                            future: fetchFaq(),
                            builder: (context, AsyncSnapshot snapshot) {
                                if (snapshot.data == null) {
                                return const Center(child: CircularProgressIndicator());
                                } else {
                                if (!snapshot.hasData) {
                                    return Column(
                                    children: const [
                                        Text(
                                        "Tidak ada faq :(",
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
                                                color: Colors.white,
                                                shape: BoxShape.rectangle,
                                                borderRadius: BorderRadius.circular(15.0),
                                                boxShadow: const [
                                                BoxShadow(
                                                    color: Color(0Xfffdb99b),
                                                    blurRadius: 2.0
                                                )
                                                ]
                                            ),
                                            child: ExpansionTile(
                                                title: Text("${snapshot.data![index].fields.question}"),
                                                children: [
                                                    Padding(
                                                        padding: const EdgeInsets.all(20.0),
                                                        child: Text(
                                                          "${snapshot.data![index].fields.answer}"
                                                      )
                                                  )
                                              ],
                                              onExpansionChanged: (isOpen) {
                                                if (isOpen) {
                                                  setState(() {
                                                  });
                                                }
                                              }
                                          ),
                                        ),
                                      );
                                }
                                }
                            }
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: const Text(
                              "Wanna share your experience with other? Share with us!",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            )
                        ),
                      ElevatedButton(
                        child: const Text("Share Your Story!"),
                        onPressed: () {
                          Navigator.of(context).push<void>(_createRoute());
                        },
                        )
                  ],
                ),
              ),
            ) 
        );
    }
}

Route _createRoute() {
  return PageRouteBuilder<SlideTransition>(
    pageBuilder: (context, animation, secondaryAnimation) => const MyReviewPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var tween = Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero);
      var curveTween = CurveTween(curve: Curves.ease);

      return SlideTransition(
        position: animation.drive(curveTween).drive(tween),
        child: child,
      );
    },
  );
}
