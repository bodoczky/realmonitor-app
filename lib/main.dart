import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ingatlan_figyelo_teszt/models/filter/filter_model.dart';
import 'package:ingatlan_figyelo_teszt/models/filter/locations/filter_locations_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String url =
      "https://jsonplaceholder.typicode.com/posts"; //"https://app.fakejson.com/q/";

  late FilterModel _filterModel;
  late List<FilterLocationsModel> _filterLocationsList;

  void postData() async {
    try {
      Map<String, String> headers = {
        HttpHeaders.contentTypeHeader: "application/json"
      };

      final Response response = await post(Uri.parse(url),
          headers: headers, body: jsonEncode(_filterModel.toJson()));

      print(response.body);
    } catch (error) {
      print("---\nERROR: \n$error \n---");
    }
  }

  @override
  void initState() {
    _filterLocationsList = [
      FilterLocationsModel(
          accessTokens: ["v1-NGjMb89DhXVjdFH2qe2Y9s9nivaCNaDNCDmkvsdRho"],
          adminLevels: {"6": "Nógrád megye", "8": "Zabar"},
          nameSpace: "hu",
          ids: ["ChIJG2dAGsJwQEcRAHgeDCnEAAQ"]),
      FilterLocationsModel(
          accessTokens: ["v1-lv3CMtHjZyVTRCqNyCEmHsakmSAMa0bpsxi3Wr1QjqE"],
          adminLevels: {"6": "Veszprém", "8": "Csesznek"},
          nameSpace: "hu",
          ids: ["ChIJTZZvGMgqakcRQGAeDCnEAAQ"]),
    ];
    _filterModel = FilterModel(
        isNotificationEnabled: true,
        privateAdvertisersOnly: false,
        filterOutSuspiciousItems: true,
        onlyPolisWithPictures: true,
        nameSpace: "hu",
        locations: _filterLocationsList,
        name: "Sus",
        assignmentType: "FOR_SALE",
        estateTypes: ["HOUSE"],
        createTime: 1658740743732,
        usesUmbrella: true,
        id: null,
        minPrice: 69000000,
        maxPrice: 420000000,
        minFloorArea: 80,
        maxFloorArea: null,
        minUnitPrice: null,
        maxUnitPrice: null);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: postData,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
