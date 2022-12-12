import 'package:flutter/material.dart';
import 'package:cultural_center/widgets/drawer.dart';
import 'package:cultural_center/modules/recommendation/models/area.dart';

class AreaDetail extends StatelessWidget {
  final Area area;

  const AreaDetail({Key? key, required this.area}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Province Detail'),
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      area.title,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      // ignore: unnecessary_null_comparison
                      child: area.image != null
                          ? Image.network(
                              area.image,
                              width: 300,
                              height: 300,
                            )
                          : const Text('No image'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        const TextSpan(
                            text: 'Summary: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: '${area.summary}\n'),
                        const TextSpan(
                            text: 'Description: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: '${area.description}\n'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ])),
      ),

      // back button to previous page
      persistentFooterButtons: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightGreen,
            minimumSize: const Size.fromHeight(40),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Back',
            style: TextStyle(fontSize: 12),
          ),
        ),
      ],
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.pop(context);
      //   },
      //   child: const Icon(Icons.arrow_back),
      // ),
    );
  }
}
