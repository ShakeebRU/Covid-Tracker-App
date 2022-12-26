import 'package:flutter/material.dart';
import '../models/data_model.dart';

class CountryScreen extends StatefulWidget {
  DataModel data;
  CountryScreen({super.key, required this.data});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.05,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade700,
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(children: [
                          Container(
                            height: 70,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: ListTile(
                              title: const Text(
                                "Total",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              trailing: Text("${widget.data.cases}",
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: ListTile(
                              title: const Text(
                                "Recovered",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              trailing: Text("${widget.data.recovered}",
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: ListTile(
                              title: const Text(
                                "Deaths",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              trailing: Text("${widget.data.deaths}",
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: ListTile(
                              title: const Text(
                                "Active",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              trailing: Text("${widget.data.active}",
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: ListTile(
                              title: const Text(
                                "Critical",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              trailing: Text("${widget.data.critical}",
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: ListTile(
                              title: const Text(
                                "Today Deaths",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              trailing: Text("${widget.data.todayDeaths}",
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: ListTile(
                              title: const Text(
                                "Today Recovered",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              trailing: Text("${widget.data.todayRecovered}",
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.data.countryInfo.flag!),
                  radius: 50,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
