import 'package:cultural_center/modules/plan-your-trip/addPlan.dart';
import 'package:cultural_center/modules/plan-your-trip/data/fetchPlan.dart';
import 'package:flutter/material.dart';
import 'package:cultural_center/widgets/drawer.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class PlanYourTrip extends StatefulWidget {
  const PlanYourTrip({Key? key}) : super(key: key);

  @override
  _PlanYourTripState createState() => _PlanYourTripState();
}

/*
        "user": user,
        "judul": judul,
        "destinasi": destinasi,
        "aktivitas": aktivitas,
        "hari": hari,
        "orang": orang,
        "deskripsi": deskripsi,
*/

class _PlanYourTripState extends State<PlanYourTrip> {
  final _formKey = GlobalKey<FormState>();
  String _judul = "";
  // String _review = "";
  String _destinasi = "";
  String _aktivitas = "";
  int _hari = 0;
  int _orang = 0;
  String _deskripsi = "";

  var c1 = Color.fromARGB(255, 77, 235, 135);
  var c2 = Color.fromARGB(255, 135, 243, 184);
  var c3 = Color.fromARGB(255, 182, 255, 222);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Plan Your Trip'),
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
                    ])),
            child: Column(
              children: [
                const Text(
                  'List of your planned trips',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Expanded(
                  child: FutureBuilder(
                      future: fetchTrip(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.data == null) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          if (!snapshot.hasData) {
                            return Column(
                              children: const [
                                Text(
                                  "Belum ada perjalanan...",
                                  style: TextStyle(
                                      color: Color(0xff59A5D8), fontSize: 20),
                                ),
                                SizedBox(height: 8),
                              ],
                            );
                          } else {
                            return ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (_, index) => Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  padding: const EdgeInsets.all(20.0),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(15.0)),
                                    child: SizedBox(
                                      height: 180,
                                      child: Container(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(
                                                  "${snapshot.data![index].fields.judul}",
                                                  style: const TextStyle(
                                                    fontSize: 18.0,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Icon(Icons
                                                    .supervised_user_circle_rounded),
                                                Text(
                                                  "${snapshot.data![index].fields.destinasi}",
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                    Icons.reviews_outlined),
                                                Text(
                                                  "${snapshot.data![index].fields.aktivitas}",
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                    Icons.reviews_outlined),
                                                Text(
                                                  "${snapshot.data![index].fields.deskripsi}",
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ));
                          }
                        }
                      }),
                ),
                const AddPlanPage(),
              ],
            )));
  }
}