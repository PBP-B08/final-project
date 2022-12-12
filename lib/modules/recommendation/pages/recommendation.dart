import 'package:cultural_center/modules/recommendation/pages/add_province.dart';
import 'package:flutter/material.dart';
import 'package:cultural_center/widgets/drawer.dart';
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
          title: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.recommend),
                  title: Text(province.fields.title),
                  subtitle: Text(
                    province.fields.header,
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    province.fields.summary,
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      // textColor: const Color(0xFF6200EE),
                      onPressed: () {
                        // Perform some action
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProvinceDetail(
                                    province: province,
                                    provinceID: province.pk,
                                  )));
                      },
                      child: const Text('Details'),
                    ),
                    // TextButton(
                    //   // textColor: const Color(0xFF6200EE),
                    //   onPressed: () {
                    //     // Perform some action
                    //   },
                    //   child: const Text('ACTION 2'),
                    // ),
                  ],
                ),
                Image.network(province.fields.image)
                // Image.asset('assets/card-sample-image.jpg'),
                // Image.asset('assets/card-sample-image-2.jpg'),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 12.0),
          //   child: Column(
          //     children: [
          //       ListTile(
          //         leading: const Icon(Icons.icecream),
          //         title: Text(province.fields.header),
          //         // image: Image.network(province.fields.image),
          //         subtitle: Text(province.fields.summary),
          //         trailing: Icon(Icons.food_bank),
          //       ),
          //     ],
          //   )
          // ),
          // onTap: () {
          //   Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => ProvinceDetail(
          //                 province: province,
          //                 provinceID: province.pk,
          //               )));
          // },
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
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
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
          ),
        ],
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