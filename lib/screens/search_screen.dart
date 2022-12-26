import 'dart:convert';
import 'package:covid_app/models/data_model.dart';
import 'package:covid_app/screens/country_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:objectbox/objectbox.dart';
import 'package:shimmer/shimmer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<DataModel> dataList = [];
  Future<List<DataModel>> getData() async {
    Uri uri = Uri.parse("https://disease.sh/v3/covid-19/countries");
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      var decodedBody = jsonDecode(response.body);
      dataList = List<DataModel>.from(
          decodedBody.map((json) => DataModel.fromJson(json))).toList();
    }
    return dataList;
  }

  @override
  void initState() {
    super.initState();
    var resPost = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: searchController,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                hintStyle: TextStyle(color: Colors.white, fontSize: 20),
                hintText: "Search with country name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)))),
            onChanged: (searchText) {
              setState(() {});
            },
          ),
        ),
        Expanded(
          child: FutureBuilder(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Container(
                  child: ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: dataList.length,
                      itemBuilder: (BuildContext context, int index) {
                        String name = dataList[index].country.toString();
                        if (searchController.text.isEmpty) {
                          return ListTile(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return CountryScreen(
                                      data: dataList[index],
                                    );
                                  },
                                ),
                              );
                            },
                            leading: Image(
                              height: 50,
                              width: 50,
                              image: NetworkImage(
                                  dataList[index].countryInfo.flag!),
                              fit: BoxFit.cover,
                            ),
                            title: Text(
                              dataList[index].country,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                            subtitle: Text(
                              "${dataList[index].cases}",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          );
                        } else if (name
                            .toLowerCase()
                            .contains((searchController.text.toLowerCase()))) {
                          return ListTile(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return CountryScreen(
                                      data: dataList[index],
                                    );
                                  },
                                ),
                              );
                            },
                            leading: Image(
                              height: 50,
                              width: 50,
                              image: NetworkImage(
                                  dataList[index].countryInfo.flag!),
                              fit: BoxFit.cover,
                            ),
                            title: Text(
                              dataList[index].country,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                            subtitle: Text(
                              "${dataList[index].cases}",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      }),
                );
              } else {
                return ListView.builder(itemBuilder: (contaxt, index) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade700,
                    highlightColor: Colors.grey.shade100,
                    child: ListTile(
                      leading: Container(
                        height: 50,
                        width: 50,
                        color: Colors.white,
                      ),
                      title: Container(
                        height: 10,
                        width: 89,
                        color: Colors.white,
                      ),
                      subtitle: Container(
                        height: 10,
                        width: 89,
                        color: Colors.white,
                      ),
                    ),
                  );
                });
              }
            },
          ),
        ),
      ]),
    );
  }
}
