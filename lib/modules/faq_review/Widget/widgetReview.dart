import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart'; 

class WidgetModalReview extends StatefulWidget {
    const WidgetModalReview({Key? key}) : super(key: key);

    @override
    _WidgetModalReviewState createState() => _WidgetModalReviewState();
}

class _WidgetModalReviewState extends State<WidgetModalReview>{
  final _formKey = GlobalKey<FormState>();
  String _judul = "";
  String _review = "";
  // DateTime? _dateTime;
  var c1 = const Color(0Xffa770ef);
  var c2 = const Color(0Xffd8b4fe);
  var c3 = const Color(0Xfffdb99b);

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    // ignore: no_leading_underscores_for_local_identifiers
    var _username = request.jsonData['username'];
    return Center(
      child: Container(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: ElevatedButton(
          child: const Text("Add Review"),
          onPressed: () async{
            !request.loggedIn
            ? showDialog(
              context: context, 
              builder: (context) {
                return Dialog(
                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10),
                  ),
                  elevation: 15,
                  child: ListView(
                    padding:
                        const EdgeInsets.only(
                            top: 20,
                            bottom: 20),
                    shrinkWrap: true,
                    children: <Widget>[
                      const Center(
                          child: Text(
                              'Please Login!')),
                      const SizedBox(
                          height: 20),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(
                              context);
                        },
                        child: const Text(
                            'Kembali'),
                      ),
                    ],
                  ),
                );
              },
            )
            : showModalBottomSheet(
              context: context, 
              builder: (BuildContext context) {
                return SizedBox(
                  height: 400,
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
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
                        padding: const EdgeInsets.all(80),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Judul",
                                  labelText: "Judul",
                                  icon: const Icon(Icons.title),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0)
                                  ),
                                ),
                                onChanged: (String? value) {
                                  setState(() {
                                    _judul = value!;
                                  });
                                },
                                onSaved: (String? value) {
                                  setState(() {
                                    _judul = value!;
                                  });
                                },
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Judul tidak boleh kosong';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Review",
                                  labelText: "Review",
                                  icon: const Icon(Icons.reviews),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0)
                                  ),
                                ),
                                onChanged: (String? value) {
                                  setState(() {
                                    _review = value!;
                                  });
                                },
                                onSaved: (String? value) {
                                  setState(() {
                                    _review = value!;
                                  });
                                },
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Review tidak boleh kosong';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: ElevatedButton(
                                child: const Text('Submit'),
                               onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    await request.post(
                                        "https://cultural-center.up.railway.app/faq-review/add/",
                                        {
                                          "username": _username,
                                          "title": _judul,
                                          "review": _review,
                                        }).then(
                                        (value) => {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return Dialog(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(10),
                                                    ),
                                                    elevation: 15,
                                                    child: ListView(
                                                      padding:
                                                          const EdgeInsets.only(top: 20, bottom: 20),
                                                      shrinkWrap: true,
                                                      children: <Widget>[
                                                        const Center(
                                                            child: Text('Data sudah berhasil dibuat')),
                                                        const SizedBox(
                                                            height: 20),
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.popAndPushNamed(context, "/review");
                                                          },
                                                          child: const Text('Kembali'),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              )
                                            },
                                        onError: (error) => {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return Dialog(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(10),
                                                    ),
                                                    elevation: 15,
                                                    child: ListView(
                                                      padding:
                                                          const EdgeInsets.only(top: 20, bottom: 20),
                                                      shrinkWrap: true,
                                                      children: <Widget>[
                                                        const Center(
                                                            child: Text('Data Gagal dibuat')),
                                                        const SizedBox(
                                                            height: 20),
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                          },
                                                          child: const Text('Kembali'),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              )
                                            });
                                    }
                                },
                              )
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: ElevatedButton(
                                child: const Text('Close'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        )
                      ),
                    )
                  ),
                );
              }
            );
          }
        )
      )
    );
  }
}