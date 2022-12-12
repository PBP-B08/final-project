import 'dart:convert';
// import 'package:cultural_center/modules/recommendation/pages/recommendation.dart';
import 'package:cultural_center/modules/recommendation/pages/recommendation.dart';
import 'package:cultural_center/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class AddAreaFormPage extends StatefulWidget {
  final int provinceId;
  const AddAreaFormPage({super.key, required this.provinceId});

  @override
  State<AddAreaFormPage> createState() => _AddAreaFormPage(provinceId);
}

class _AddAreaFormPage extends State<AddAreaFormPage> {
  final _formKey = GlobalKey<FormState>();

  final int provinceId;
  final titleController = TextEditingController();
  final summaryController = TextEditingController();
  final descriptionController = TextEditingController();
  final imageController = TextEditingController();

  String title = "";
  String summary = "";
  String description = "";
  String image = "";

  _AddAreaFormPage(this.provinceId);

  // function for clearing the text fields
  void clearText() {
    titleController.clear();
    summaryController.clear();
    descriptionController.clear();
    imageController.clear();
  }

  // Clean up the controller when the widget is disposed.
  @override
  void dispose() {
    titleController.dispose();
    summaryController.dispose();
    descriptionController.dispose();
    imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Area'),
        ),
        drawer: const MyDrawer(),
        body: Form(
            key: _formKey,
            child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Add Area", style: TextStyle(fontSize: 30)),
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
                            hintText: "summary",
                            labelText: "summary",
                            icon:
                                Icon(Icons.summarize, color: Colors.lightGreen),
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
                            hintText: "description",
                            labelText: "description",
                            icon: Icon(Icons.description,
                                color: Colors.lightGreen),
                          ),
                          controller: descriptionController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter description';
                            }
                            return null;
                          }),
                      TextFormField(
                          decoration: const InputDecoration(
                            hintText: "image",
                            labelText: "image",
                            icon: Icon(Icons.image, color: Colors.lightGreen),
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
                                summaryController.text != "" &&
                                descriptionController.text != "" &&
                                imageController.text != "") {
                              await request
                                  .post(
                                      'https://cultural-center.up.railway.app/recommendation/detail/$provinceId/addArea/',
                                      jsonDecode(jsonEncode({
                                        "title": titleController.text,
                                        "summary": summaryController.text,
                                        "description":
                                            descriptionController.text,
                                        "image": imageController.text,
                                      })))
                                  .then((value) => {
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
                                                          'Area added successfully')),
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
                                      });
                            }
                          }),
                      // button to back to recommendation page
                      ElevatedButton(
                        onPressed: () {
                          // back to recommendation page
                          Navigator.of(context).pop();
                        },
                        child: const Text('Kembali'),
                      ),
                    ]))));
  }
}
