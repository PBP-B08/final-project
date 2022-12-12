import 'package:cultural_center/modules/things-to-do/page/addEvent.dart';
import 'package:flutter/material.dart';
import 'package:cultural_center/modules/things-to-do/API/fetchEvent.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class EventPage extends StatefulWidget {
  final int provId;
  final String provName;

  const EventPage(
      {Key? key, required this.provId, required this.provName})
      : super(key: key);

  @override
  State<EventPage> createState() =>
      _EventPageState(provId, provName);
}

class _EventPageState extends State<EventPage> {
  final int provId;
  final String provName;
  _EventPageState(this.provId, this.provName);

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text("$provName's Event"),
      ),
      body: Container(
          margin: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
          padding: const EdgeInsets.all(10.0),
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder(
                future: fetchEvent(provId),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (!snapshot.hasData) {
                      return Column(
                        children: const [
                          Text(
                            "Tidak ada event :(",
                            style:
                                TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                          ),
                          SizedBox(height: 10),
                        ],
                      );
                    } else {
                      return Container(
                            height: MediaQuery.of(context).size.height,
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (_, index) => Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 12),
                                          padding: const EdgeInsets.all(10.0),
                                          decoration: BoxDecoration(
                                              color:Colors.white,
                                              borderRadius: BorderRadius.circular(15.0),
                                              boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.black,
                                                  blurRadius: 2.0
                                              )
                                              ]
                                          ),
                                          child: ListTile(
                                                    leading: Image.network(
                                                      "${snapshot.data![index].fields.image}",
                                                      // width: 300,
                                                      // height: 250,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    title: Text("${snapshot.data![index].fields.name}"),
                                                    subtitle: Text(
                                                      "${snapshot.data![index].fields.description}",
                                                    ),
                                                    trailing: Text(
                                                      "${snapshot.data![index].fields.date.toString().substring(0, 10)}"
                                                    ),
                                                    isThreeLine: true,
                                                  ),
                                                ),
                                )
                      );
                    }
                  }
                }),
      ),
      floatingActionButton: FloatingActionButton(
              heroTag: null,
              onPressed: () async {
                  !request.loggedIn
                      ? ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Mohon login terlebih dahulu!'),
                          ),
                      ): Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => AddEventPage(
                                  provId: provId, provName: provName)));
                },
              tooltip: 'Add New Event',
              child: const Icon(Icons.add),
            ),
    );
  }
}
