import 'dart:convert';
import 'package:covid_app/models/country_model.dart';
import 'package:covid_app/screens/search_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pie_chart/pie_chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CountryModel overAllData;

  Future<CountryModel> getAll() async {
    Uri uri = Uri.parse("https://disease.sh/v3/covid-19/all");
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      var decodedBody = jsonDecode(response.body);
      overAllData = CountryModel.fromJson(decodedBody);
    }
    return overAllData;
  }

  @override
  void initState() {
    super.initState();
    var resGet = getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(133, 70, 69, 69),
      body: FutureBuilder(
        future: getAll(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PieChart(
                      dataMap: {
                        "Total": double.parse(snapshot.data!.cases!.toString()),
                        "Recovered":
                            double.parse(snapshot.data!.recovered!.toString()),
                        "Deaths":
                            double.parse(snapshot.data!.deaths!.toString()),
                      },
                      colorList: const [Colors.blue, Colors.green, Colors.red],
                      animationDuration: const Duration(milliseconds: 800),
                      chartRadius: 150,
                      initialAngleInDegree: 0,
                      chartType: ChartType.ring,
                      ringStrokeWidth: 25,
                      legendOptions: const LegendOptions(
                        showLegendsInRow: false,
                        legendPosition: LegendPosition.left,
                        legendShape: BoxShape.circle,
                        showLegends: true,
                        legendTextStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15),
                      ),
                      chartValuesOptions: const ChartValuesOptions(
                          showChartValues: true,
                          showChartValueBackground: true,
                          showChartValuesInPercentage: true,
                          showChartValuesOutside: false,
                          decimalPlaces: 2),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: 406,
                  width: MediaQuery.of(context).size.width / 1.05,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 75, 71, 71),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(children: [
                    Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: ListTile(
                        title: const Text(
                          "Total",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        trailing: Text("${overAllData.cases}",
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white)),
                      ),
                    ),
                    Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: ListTile(
                        title: const Text(
                          "Recovered",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        trailing: Text("${overAllData.recovered}",
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white)),
                      ),
                    ),
                    Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: ListTile(
                        title: const Text(
                          "Deaths",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        trailing: Text("${overAllData.deaths}",
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white)),
                      ),
                    ),
                    Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: ListTile(
                        title: const Text(
                          "Active",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        trailing: Text("${overAllData.active}",
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white)),
                      ),
                    ),
                    Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: ListTile(
                        title: const Text(
                          "Critical",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        trailing: Text("${overAllData.critical}",
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white)),
                      ),
                    ),
                    Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: ListTile(
                        title: const Text(
                          "Today Deaths",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        trailing: Text("${overAllData.todayDeaths}",
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white)),
                      ),
                    ),
                    Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: ListTile(
                        title: const Text(
                          "Today Recovered",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        trailing: Text("${overAllData.todayRecovered}",
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white)),
                      ),
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 35,
                ),
                TextButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return SearchScreen();
                          },
                        ),
                      );
                    },
                    child: Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: const Center(
                        child: Text(
                          "Track Countries",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ))
              ],
            );
          } else {
            return const SpinKitSpinningLines(
              color: Colors.blue,
            );
          }
        },
      ),
    );
  }
}
