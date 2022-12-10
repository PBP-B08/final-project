
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
  DateTime? _dateTime;
  var c1 = const Color(0Xffa770ef);
  var c2 = const Color(0Xffd8b4fe);
  var c3 = const Color(0Xfffdb99b);

  @override
  Widget build(BuildContext context) {
    // final request = context.watch<CookieRequest>();

    return Center(
      child: Container(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: ElevatedButton(
          child: const Text("Add Review"),
          onPressed: () {
            showModalBottomSheet(
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
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: ListTile(
                            //     leading: const Icon(Icons.calendar_today),
                            //     title: Text(_dateTime == null
                            //     ? 'Nothing has been picked yet'
                            //     : _dateTime.toString()
                            //     ),
                            //   trailing: ElevatedButton(
                            //     // ignore: sort_child_properties_last
                            //     child: const Text(
                            //       "Pilih Tanggal",
                            //       style: TextStyle(color: Colors.white),
                            //       ),
                            //       onPressed: (() {
                            //         showDatePicker(
                            //           context: context, 
                            //           initialDate: DateTime.now(), 
                            //           firstDate: DateTime(2000), 
                            //           lastDate: DateTime(2100),
                            //         ).then((date) {
                            //           setState(() {
                            //             _dateTime = date;
                            //           });
                            //         });
                            //       }) 
                            //     ),
                            //   )
                            // ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: ElevatedButton(
                                child: const Text('Submit'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: ElevatedButton(
                                child: const Text('Close'),
                                onPressed: () {
                                  Navigator.pop(context);
                                }
                                  // if (_formKey.currentState!.validate()) {
                                  //   await request.post(
                                  //     "http://127.0.0.1:8000/faq-review/review/", 
                                  //     {
                                  //       "title": _judul,
                                  //       "review": _review,
                                  //     }).then((value) => null);
                              )
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