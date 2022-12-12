import 'package:flutter/material.dart';
import 'package:cultural_center/widgets/drawer.dart';
 import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'detail.dart';

class AddFoodPage extends StatefulWidget {
  final int provId;
  final String provName;
  const AddFoodPage({super.key, required this.provId, required this.provName});

  @override
  State<AddFoodPage> createState() => _AddFoodPageState(provId, provName);
}

class _AddFoodPageState extends State<AddFoodPage> {
  final _formKey = GlobalKey<FormState>();
  final int provId;
  final String provName;
  String _name = "";
  String _description = "";
  String _image = "";

  _AddFoodPageState(this.provId, this.provName);

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
          title: Text("Add $provName's Food"),
        ),
        // Menambahkan drawer menu
        drawer: const MyDrawer(),
        body: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: Sate Padang",
                      labelText: "Nama Makanan",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _name = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _name = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama makanan tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText:
                          "Contoh: Sate Padang berbahan dasar daging ayam",
                      labelText: "Deskripsi",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _description = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _description = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Deskripsi tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      // hintText: "Contoh: Sate Padang",
                      labelText: "Image URL",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _image = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _image = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Image URL tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  // send data to server
                  final response = await request.post(
                    "https://cultural-center.up.railway.app/things-to-do/add/food",
                    {
                      'prov_id': provId.toString(),
                      'name': _name,
                      'description': _description,
                      'image': _image,
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
                                        Navigator.pushReplacement(context, 
                                        MaterialPageRoute(
                                            builder: (context) => DetailThingsPage(
                                            provId: provId,
                                            provName: provName)),
                                        );
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
                        },
                  );
                }
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 16, bottom: 16),
                child: Text(
                  "Tambah",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        );
  }
}