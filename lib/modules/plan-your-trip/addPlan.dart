import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:cultural_center/modules/plan-your-trip/plan.dart';
import 'package:cultural_center/modules/plan-your-trip/models/planFields.dart';

class AddPlanPage extends StatefulWidget {
  const AddPlanPage({Key? key}) : super(key: key);

  @override
  State<AddPlanPage> createState() => _AddPlanPageState();
}

class _AddPlanPageState extends State<AddPlanPage> {
  final _formKey = GlobalKey<FormState>();
  String _judul = "";
  String _destinasi = "";
  String _aktivitas = "";
  int _hari = 0;
  int _orang = 0;
  String _deskripsi = "";
  var c1 = Color.fromARGB(255, 112, 169, 239);

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Center(
        child: Container(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: ElevatedButton(
                child: const Text("Start here!"),
                onPressed: () async {
                  !request.loggedIn
                      ? showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 15,
                        child: ListView(
                          padding:
                          const EdgeInsets.only(top: 20, bottom: 20),
                          shrinkWrap: true,
                          children: <Widget>[
                            const Center(
                                child: Text('You are not logged in!')
                            ),
                            const SizedBox(height: 20),
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
                                            colors: [c1])),
                                    padding: const EdgeInsets.all(80),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              hintText: "Judul",
                                              labelText: "Judul",
                                              icon: const Icon(Icons.title),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      5.0)),
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
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Judul tidak boleh kosong';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              hintText: "Destinasi",
                                              labelText: "Destinasi",
                                              icon:
                                              const Icon(Icons.map),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      5.0)),
                                            ),
                                            onChanged: (String? value) {
                                              setState(() {
                                                _destinasi = value!;
                                              });
                                            },
                                            onSaved: (String? value) {
                                              setState(() {
                                                _destinasi = value!;
                                              });
                                            },
                                            validator: (String? value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Destinasi tidak boleh kosong';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              hintText: "Aktivitas",
                                              labelText: "Bermain di Dufan dan makan takoyaki",
                                              icon:
                                              const Icon(Icons.local_activity_outlined),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      5.0)),
                                            ),
                                            onChanged: (String? value) {
                                              setState(() {
                                                _aktivitas = value!;
                                              });
                                            },
                                            onSaved: (String? value) {
                                              setState(() {
                                                _aktivitas = value!;
                                              });
                                            },
                                            validator: (String? value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Aktivitas tidak boleh kosong';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              hintText: "Hari",
                                              labelText: "2",
                                              icon:
                                              const Icon(Icons.calendar_month),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      5.0)),
                                            ),
                                            onChanged: (String? value) {
                                              setState(() {
                                                _hari = value! as int;
                                              });
                                            },
                                            onSaved: (String? value) {
                                              setState(() {
                                                _hari = value! as int;
                                              });
                                            },
                                            validator: (String? value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Hari tidak boleh kosong';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),

                                        Padding(
                                          padding:
                                          const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              hintText: "Jumlah orang",
                                              labelText: "4",
                                              icon:
                                              const Icon(Icons.people),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      5.0)),
                                            ),
                                            onChanged: (String? value) {
                                              setState(() {
                                                _orang = value! as int;
                                              });
                                            },
                                            onSaved: (String? value) {
                                              setState(() {
                                                _orang = value! as int;
                                              });
                                            },
                                            validator: (String? value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Jumlah orang tidak boleh kosong';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),

                                        Padding(
                                          padding:
                                          const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              hintText: "Deskripsi",
                                              labelText: "Me time sepuasnya!",
                                              icon:
                                              const Icon(Icons.description),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      5.0)),
                                            ),
                                            onChanged: (String? value) {
                                              setState(() {
                                                _deskripsi = value!;
                                              });
                                            },
                                            onSaved: (String? value) {
                                              setState(() {
                                                _deskripsi = value!;
                                              });
                                            },
                                            validator: (String? value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Deskripsi orang tidak boleh kosong';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),

                                        Align(
                                            alignment:
                                            Alignment.bottomCenter,
                                            child: ElevatedButton(
                                              child: const Text('Submit'),
                                              onPressed: () async {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  await request.post(
                                                      "https://cultural-center.up.railway.app/plan/helo/",
                                                      {
                                                        "judul":
                                                        _judul,
                                                        "destinasi":
                                                        _destinasi,
                                                        "aktivitas":
                                                        _aktivitas,
                                                        "hari":
                                                        _hari,
                                                        "orang":
                                                        _orang,
                                                      }).then(
                                                          (value) => {
                                                        showDialog(
                                                          context:
                                                          context,
                                                          builder:
                                                              (context) {
                                                            return Dialog(
                                                              shape:
                                                              RoundedRectangleBorder(
                                                                borderRadius:
                                                                BorderRadius.circular(10),
                                                              ),
                                                              elevation:
                                                              15,
                                                              child:
                                                              ListView(
                                                                padding: const EdgeInsets.only(
                                                                    top:
                                                                    20,
                                                                    bottom:
                                                                    20),
                                                                shrinkWrap:
                                                                true,
                                                                children: <
                                                                    Widget>[
                                                                  const Center(
                                                                      child: Text('Data sudah berhasil dibuat')),
                                                                  const SizedBox(
                                                                      height: 20),
                                                                  TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.popAndPushNamed(context, "/plan");
                                                                    },
                                                                    child:
                                                                    const Text('Kembali'),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        )
                                                      },
                                                      onError: (error) => {
                                                        showDialog(
                                                          context:
                                                          context,
                                                          builder:
                                                              (context) {
                                                            return Dialog(
                                                              shape:
                                                              RoundedRectangleBorder(
                                                                borderRadius:
                                                                BorderRadius.circular(10),
                                                              ),
                                                              elevation:
                                                              15,
                                                              child:
                                                              ListView(
                                                                padding: const EdgeInsets.only(
                                                                    top:
                                                                    20,
                                                                    bottom:
                                                                    20),
                                                                shrinkWrap:
                                                                true,
                                                                children: <
                                                                    Widget>[
                                                                  const Center(
                                                                      child: Text('Data belum berhasil dibuat')),
                                                                  const SizedBox(
                                                                      height: 20),
                                                                  TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.pop(context);
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
                                              },
                                            )),
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
                                    )),
                              )),
                        );
                      });
                })));
  }
}