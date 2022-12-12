import 'package:cultural_center/modules/things-to-do/page/addEvent.dart';
import 'package:flutter/material.dart';
import 'package:cultural_center/widgets/drawer.dart';
import 'package:cultural_center/modules/things-to-do/page/addFood.dart';
import 'package:cultural_center/modules/things-to-do/API/fetchEvent.dart';
import 'package:cultural_center/modules/things-to-do/API/fetchFood.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class DetailThingsPage extends StatefulWidget {
  final int provId;
  final String provName;

  const DetailThingsPage(
      {Key? key, required this.provId, required this.provName})
      : super(key: key);

  @override
  State<DetailThingsPage> createState() =>
      _DetailThingsPageState(provId, provName);
}

class _DetailThingsPageState extends State<DetailThingsPage>
    with SingleTickerProviderStateMixin {
  final int provId;
  final String provName;
  _DetailThingsPageState(this.provId, this.provName);

  // Animation controller
  late AnimationController _animationController;

  // This is used to animate the icon of the main FAB
  late Animation<double> _buttonAnimatedIcon;

  // This is used for the child FABs
  late Animation<double> _translateButton;

  // This variable determnies whether the child FABs are visible or not
  bool _isExpanded = false;

  @override
  initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600))
      ..addListener(() {
        setState(() {});
      });

    _buttonAnimatedIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _translateButton = Tween<double>(
      begin: 100,
      end: -20,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    super.initState();
  }

  // dispose the animation controller
  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // This function is used to expand/collapse the children floating buttons
  // It will be called when the primary FAB (with menu icon) is pressed
  _toggle() {
    if (_isExpanded) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }

    _isExpanded = !_isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Things to Do in $provName"),
      ),
      drawer: const MyDrawer(),
      body: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
              child: Column(
            children: [
              const SizedBox(height: 30),
              const Text("Food",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 10),
              FutureBuilder(
                  future: fetchFood(provId),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      if (!snapshot.hasData) {
                        return Column(
                          children: const [
                            Text(
                              "Tidak ada makanan :(",
                              style: TextStyle(
                                  color: Color(0xff59A5D8), fontSize: 20),
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
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15.0),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black, blurRadius: 2.0)
                                      ]),
                                  child: ListTile(
                                    leading: Image.network(
                                      "${snapshot.data![index].fields.image}",
                                      // width: 300,
                                      // height: 250,
                                      fit: BoxFit.cover,
                                    ),
                                    title:
                                        Text("${snapshot.data![index].fields.name}"),
                                    subtitle: Text(
                                      "${snapshot.data![index].fields.description}",
                                    ),
                                    // trailing: Icon(Icons.more_vert),
                                    isThreeLine: true,
                                  ),
                                ),
                              ));
                      }
                    }
                  }),
              const SizedBox(height: 30),
              const Text("Event",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 10),
              FutureBuilder(
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
                              style: TextStyle(
                                  color: Color(0xff59A5D8), fontSize: 20),
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
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15.0),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black, blurRadius: 2.0)
                                    ]),
                                child: ListTile(
                                  leading: Image.network(
                                    "${snapshot.data![index].fields.image}",
                                    // width: 300,
                                    // height: 250,
                                    fit: BoxFit.cover,
                                  ),
                                  title:
                                      Text("${snapshot.data![index].fields.name}"),
                                  subtitle: Text(
                                    "${snapshot.data![index].fields.description}",
                                  ),
                                  trailing: Text(
                                      "${snapshot.data![index].fields.date.toString().substring(0, 11)}"),
                                  isThreeLine: true,
                                ),
                              ),
                            ),
                        );
                      }
                    }
                  }),
              const SizedBox(height: 20),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 20),
                  minimumSize: const Size.fromHeight(5),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back'),
              ),
            ],
          ))),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Transform(
            transform: Matrix4.translationValues(
              0.0,
              _translateButton.value * 3,
              0.0,
            ),
            child: FloatingActionButton(
              heroTag: "btn1",
              backgroundColor: Colors.blue,
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
                                    child: Text('Mohon Login Terlebih Dahulu')),
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
                    : Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => AddFoodPage(
                                provId: provId, provName: provName)));
              },
              child: const Icon(
                Icons.food_bank,
              ),
            ),
          ),
          Transform(
            transform: Matrix4.translationValues(
              0,
              _translateButton.value * 2,
              0,
            ),
            child: FloatingActionButton(
              heroTag: "btn2",
              backgroundColor: Colors.yellow,
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
                                    child: Text('Mohon Login Terlebih Dahulu')),
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
                    : Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => AddEventPage(
                                provId: provId, provName: provName)));
              },
              child: const Icon(
                Icons.event,
              ),
            ),
          ),
          // This is the primary FAB
          FloatingActionButton(
            heroTag: "btn3",
            onPressed: _toggle,
            child: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _buttonAnimatedIcon,
            ),
          ),
        ],
      ),
    );
  }
}
