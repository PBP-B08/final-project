import 'package:cultural_center/modules/recommendation/pages/add_province.dart';
import 'package:flutter/material.dart';
import 'package:cultural_center/widgets/drawer.dart';
// import 'package:cultural_center/modules/recommendation/models/province.dart';
import 'package:cultural_center/modules/things-to-do/model/province.dart';
import 'package:cultural_center/modules/recommendation/utils/fetch_province.dart';
import 'package:cultural_center/modules/recommendation/pages/province_detail.dart';

class RecommendationPage extends StatefulWidget {
  const RecommendationPage({Key? key}) : super(key: key);

  @override
  State<RecommendationPage> createState() => _RecommendationPage();
}

class _RecommendationPage extends State<RecommendationPage> {
  @override
  Widget build(BuildContext context) {
    ListTile addListTile(Province province) => ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
          title: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              province.fields.title,
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProvinceDetail(
                          province: province,
                        )));
          },
        );

    Card addCard(Province province) => Card(
          margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
          elevation: 7,
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.lightGreen,
            ),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Container(
            child: addListTile(province),
          ),
        );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Culture Center'),
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
                future: fetchProvince(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (!snapshot.hasData) {
                      return Column(
                        children: const [
                          Text(
                            "Recommendation is empty!",
                            style: TextStyle(color: Color.fromARGB(255, 18, 226, 84), fontSize: 20),
                          ),
                          SizedBox(height: 8),
                        ],
                      );
                    } else {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) => addCard(snapshot.data![index]));
                    }
                  }
                }),
          ],
        ),
      ),
      // button add province
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const AddProvinceFormPage()));
        },
        backgroundColor: Colors.lightGreen,
        child: const Icon(Icons.add),
      ),
      
      
    );
  }
}