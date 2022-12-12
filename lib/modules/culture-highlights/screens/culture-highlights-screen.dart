import 'package:cultural_center/modules/things-to-do/API/fetchProvince.dart';
import 'package:cultural_center/widgets/drawer.dart';
import 'package:flutter/material.dart';

class CultureHighlightsScreen extends StatefulWidget {
  const CultureHighlightsScreen({Key? key}) : super(key: key);

  @override
  State<CultureHighlightsScreen> createState() => _CultureHighlightsScreenState();
}

class _CultureHighlightsScreenState extends State<CultureHighlightsScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Culture Highlights'),
        ),
        drawer: const MyDrawer(),
        body: FutureBuilder(
            future: fetchProvince(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada provinsi :(",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => InkWell(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: const [
                              BoxShadow(color: Colors.black, blurRadius: 2.0)
                            ]),
                        child: ListTile(
                          title: Text("${snapshot.data![index].fields.title}", style: TextStyle(fontSize: 24), textAlign: TextAlign.center),
                          subtitle: Text(
                            "${snapshot.data![index].fields.header}", style: TextStyle(fontSize: 18), textAlign: TextAlign.center,
                          ),
                          isThreeLine: true,
                        ),
                      ),
                      onTap: () {
                        if (index == 0) {
                          showDialog(
                            context: context, 
                            builder: ((BuildContext context) {
                              return AlertDialog(
                                scrollable: true,
                                title: Text("${snapshot.data![0].fields.title}", textAlign: TextAlign.center),
                                content: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Form(
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          height: 200,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            image: DecorationImage(
                                              image: AssetImage("assets/images/1st.png"),
                                              alignment: Alignment.topCenter,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Text('Budaya Jawa mengutamakan keseimbangan, keselarasan dan keserasian dalam kehidupan sehari-hari. Budaya Jawa menjunjung tinggi kesopanan dan kesederhanaan.'),
                                      ],
                                    ),
                                  ),
                                ),
                                );
                            }
                          )
                        );
                        }
                        if (index == 1) {
                          showDialog(
                            context: context, 
                            builder: ((BuildContext context) {
                              return AlertDialog(
                                scrollable: true,
                                title: Text("${snapshot.data![1].fields.title}", textAlign: TextAlign.center),
                                content: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Form(
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          height: 200,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            image: DecorationImage(
                                              image: AssetImage("assets/images/2nd.png"),
                                              alignment: Alignment.topCenter,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Text('Kebudayaan Bali terkenal akan seni tari, seni pertujukan, dan seni ukir. Miguel Covarrubias mengamati bahwa setiap orang Bali layak disebut sebagai seniman, sebab ada berbagai aktivitas seni yang dapat mereka lakukan—terlepas dari kesibukannya.'),
                                      ],
                                    ),
                                  ),
                                ),
                                );
                            }
                          )
                        );
                        }
                        if (index == 2) {
                          showDialog(
                            context: context, 
                            builder: ((BuildContext context) {
                              return AlertDialog(
                                scrollable: true,
                                title: Text("${snapshot.data![2].fields.title}", textAlign: TextAlign.center),
                                content: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Form(
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          height: 200,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            image: DecorationImage(
                                              image: AssetImage("assets/images/3rd.png"),
                                              alignment: Alignment.topCenter,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Text('Kebudayaan yang memiliki nilai-nilai sosial keseharian, dan juga nilai-nilai religius yang sakral yang menjamin keselamatan abadi, kedamaian, dan kebahagiaan hidup bersama sebagai orang bersaudara.'),
                                      ],
                                    ),
                                  ),
                                ),
                                );
                            }
                          )
                        );
                        }
                        if (index == 3) {
                          showDialog(
                            context: context, 
                            builder: ((BuildContext context) {
                              return AlertDialog(
                                scrollable: true,
                                title: Text("${snapshot.data![3].fields.title}", textAlign: TextAlign.center),
                                content: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Form(
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          height: 200,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            image: DecorationImage(
                                              image: AssetImage("assets/images/4th.png"),
                                              alignment: Alignment.topCenter,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Text('Pada dasarnya budaya Kalimantan terbagi menjadi budaya pedalaman dan budaya pesisir. Atraksi kedua budaya ini setiap tahun ditampilkan dalam Festival Borneo yang ikuti oleh keempat provinsi di Kalimantan diadakan bergiliran masing-masing provinsi.'),
                                      ],
                                    ),
                                  ),
                                ),
                                );
                            }
                          )
                        );
                        }
                      },
                    ),
                  );
                }
              }
            }));
  }
}