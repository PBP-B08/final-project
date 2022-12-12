import 'dart:convert';

import 'package:cultural_center/modules/recommendation/pages/recommendation.dart';
import 'package:cultural_center/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class AddProvinceFormPage extends StatefulWidget {
  const AddProvinceFormPage({Key? key}) : super(key: key);

  @override
  State<AddProvinceFormPage> createState() => _AddProvinceFormPage();
}

class _AddProvinceFormPage extends State<AddProvinceFormPage> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final headerController = TextEditingController();
  final summaryController = TextEditingController();
  final imageController = TextEditingController();

  String title = "";
  String header = "";
  String summary = "";
  String image = "";
  // String _errorMessage = "";

  // function for clearing the text fields
  void clearText() {
    titleController.clear();
    headerController.clear();
    summaryController.clear();
    imageController.clear();
  }

  // Clean up the controller when the widget is disposed.
  @override
  void dispose() {
    titleController.dispose();
    headerController.dispose();
    summaryController.dispose();
    imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Province'),
        ),
        drawer: const MyDrawer(),
        body: Form(
            key: _formKey,
            child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Add Province",
                          style: TextStyle(fontSize: 30)),
                      TextFormField(
                          decoration: const InputDecoration(
                            hintText: "title",
                            labelText: "title",
                            icon: Icon(Icons.title, color: Colors.lightGreen),
                          ),
                          controller: titleController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter title';
                            }
                            return null;
                          }),
                      TextFormField(
                          decoration: const InputDecoration(
                            hintText: "header",
                            labelText: "header",
                            icon: Icon(Icons.title, color: Colors.lightGreen),
                          ),
                          controller: headerController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter header';
                            }
                            return null;
                          }),
                      TextFormField(
                          decoration: const InputDecoration(
                            hintText: "summary",
                            labelText: "summary",
                            icon: Icon(Icons.title, color: Colors.lightGreen),
                          ),
                          controller: summaryController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter summary';
                            }
                            return null;
                          }),
                      TextFormField(
                          decoration: const InputDecoration(
                            hintText: "image",
                            labelText: "image",
                            icon: Icon(Icons.title, color: Colors.lightGreen),
                          ),
                          controller: imageController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter image';
                            }
                            return null;
                          }),
                      const SizedBox(height: 20),
                      ElevatedButton(
                          child: const Text('Submit'),
                          onPressed: () async {
                            if (_formKey.currentState!.validate() &&
                                titleController.text != "" &&
                                headerController.text != "" &&
                                summaryController.text != "" &&
                                imageController.text != "") {
                              await request
                                  .post(
                                      'https://cultural-center.up.railway.app/recommendation/addProvince/',
                                      jsonDecode(jsonEncode({
                                        "title": titleController.text,
                                        "header": headerController.text,
                                        "summary": summaryController.text,
                                        "image": imageController.text,
                                      })))
                                  .then((value) => {
                                        // showDialog(
                                        //     context: context,
                                        //     builder: (context) {
                                        //       return AlertDialog(
                                        //         title: const Text('Alert'),
                                        //         content: Text(value.body),
                                        //         actions: <Widget>[
                                        //           TextButton(
                                        //             child: const Text('OK'),
                                        //             onPressed: () {
                                        //               Navigator.of(context)
                                        //                   .pop();
                                        //             },
                                        //           ),
                                        //         ],
                                        //       );
                                        //     }
                                        // )
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Dialog(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              elevation: 15,
                                              child: ListView(
                                                padding: const EdgeInsets.only(
                                                    top: 20, bottom: 20),
                                                shrinkWrap: true,
                                                children: <Widget>[
                                                  const Center(
                                                      child: Text(
                                                          'Province added successfully')),
                                                  const SizedBox(height: 20),
                                                  TextButton(
                                                    onPressed: () {
                                                      // back to recommendation page
                                                      Navigator.pop(context);
                                                      Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) => const RecommendationPage()),
                                                      );
                                                    },
                                                    child:
                                                        const Text('Kembali'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        )
                                        // if (value.statusCode == 200)
                                        //   {
                                        //     clearText(),
                                        //     ScaffoldMessenger.of(context)
                                        //         .showSnackBar(const SnackBar(
                                        //             content: Text(
                                        //                 'Province added successfully'))),
                                        //   }
                                        // else
                                        //   {
                                        //     ScaffoldMessenger.of(context)
                                        //         .showSnackBar(const SnackBar(
                                        //             content: Text(
                                        //                 'Error adding province'))),
                                        //   }
                                      });
                            }
                          }),
                      // button to back to recommendation page
                      ElevatedButton(
                        onPressed: () {
                          // back to recommendation page
                          Navigator.of(context).pop();
                        },
                        child: const Text('Ramanti ngising'),
                      ),
                    ]))));
  }
}
