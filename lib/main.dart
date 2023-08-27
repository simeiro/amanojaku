// import 'dart:ffi';
// import 'dart:ffi' as ffi;

import 'package:flutter/material.dart';
// import 'package:amanojaku/dark_gotcha_page.dart';
import 'package:amanojaku/decision_gotcha_page.dart';
import 'package:amanojaku/setting_page.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:io';
import 'package:csv/csv.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'map',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'map'),
      routes: {
        "/map_page": (context) => const MyHomePage(
              title: 'map',
            ),
        "/dark_gotcha_page": (context) => const DecisionGotchaPage(), // 通常ガチャのページ（変えてます）
        "/decision_gotcha_page": (context) => const DecisionGotchaPage(), // 闇鍋ガチャのページ
        "/setting_page": (context) => const SettingPage(), // 設定のページ
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void getFoodData() async {
    const key = "6e2aa9bdb920f66d"; //api
    const lat = "35.004928278716674"; //緯度
    const lng = "135.75843372522007"; //経度
    const range_val = "1"; // 1: 半径300m
    const count = "50"; // 50件

    var url = Uri.parse(
      "http://webservice.recruit.co.jp/hotpepper/gourmet/v1/"
      "?key=$key&lat=$lat&lng=$lng&range=$range_val&count=$count&format=json",
    );
    // print(url.toString()); // URLを表示
    var response = await http.get(url);
    final jsonData = json.decode(response.body);
    // print(jsonData);
    for (var data in jsonData["results"]["shop"]) {
      String ans = "";
      bool splitFlag = true;
      // print(data["name"] + " : " + data["budget"]["name"] + " , " + data["budget"]["average"]);
      for (var i = 0; i < data["budget"]["name"].length; i++) {
        if (int.tryParse(data["budget"]["name"][i]) != null) {
          ans += data["budget"]["name"][i];
          splitFlag = true;
        } else if (splitFlag) {
          ans += ",";
          splitFlag = false;
        }
      }
      for (var i = 0; i < data["budget"]["average"].length; i++) {
        if (int.tryParse(data["budget"]["average"][i]) != null) {
          // 数字であれば
          ans += data["budget"]["average"][i];
          splitFlag = true;
        } else if (splitFlag) {
          //,,,,,のように何回も,を文字列に追加しないためのflag
          if (data["budget"]["average"][i] != ",") {
            //文字がカンマでなければ
            ans += ",";
            splitFlag = false;
          }
        }
      }
      List<String> numbersList = ans.split(",");
      numbersList.removeLast();
      // print(numbersList);
      int sum = 0;
      for (var data in numbersList) {
        sum += int.tryParse(data)!;
      }
      // print(sum / numbersList.length);
      print((sum / numbersList.length).toString() +
          "円 : " +
          data["name"] +
          " : " +
          data["genre"]["name"]);
      // print(data["lat"].toString() + ", " + data["lng"].toString()); // 緯度と経度
      //
    }
  }

  void getTouristSpot() async {
    // String csv = await rootBundle.loadString('assets/kyoto-tourist-spot.csv');
    final input = File('assets/kyoto-tourist-spot.csv').openRead();
    final fields = await input
        .transform(utf8.decoder)
        .transform(const CsvToListConverter())
        .toList();

    for (final row in fields) {
      print(row);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      // body: GoogleMap(
      //   onMapCreated: _onMapCreated,
      //   initialCameraPosition: CameraPosition(
      //     target: _center,
      //     zoom: 11.0
      //   ),
      // ),
      // bottomNavigationBar: NavigationBar(
      //   indicatorColor: Colors.amber[800],
      //   destinations: const <Widget>[
      //     NavigationDestination(
      //       icon: Icon(Icons.business),
      //       label: 'Business',
      //     ),
      //     NavigationDestination(
      //       icon: Icon(Icons.business),
      //       label: 'Business',
      //     ),
      //     NavigationDestination(
      //       selectedIcon: Icon(Icons.school),
      //       icon: Icon(Icons.school_outlined),
      //       label: 'School',
      //     ),
      //   ],
      // ),

      bottomNavigationBar: Column(
        children: [
          SizedBox(
            height: size.height * 0.85,
              child: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(target: _center, zoom: 11.0),
          )),
          Expanded(
          child: Container(), // 空のコンテナでスペースを占有
        ),
          
          const Divider(
          // アイコンの区切り線
          color: Colors.black,
          thickness: 3,
          indent: 20,
          endIndent: 20,
        ),

          SizedBox(
            width: double.infinity,
            // padding: EdgeInsets.all(size.height * 0.01),
            // color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: size.height * 0.1,
                  height: size.height * 0.1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: AssetImage("images/map.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8.0),
                      onTap: () {
                        Navigator.of(context).pushNamed("/map_page");
                      },
                    ),
                  ),
                ),
                Container(
                  width: size.height * 0.1,
                  height: size.height * 0.1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: AssetImage("images/capsule.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8.0),
                      onTap: () {
                        Navigator.of(context).pushNamed("/dark_gotcha_page");
                      },
                    ),
                  ),
                ),
                Container(
                  width: size.height * 0.1,
                  height: size.height * 0.1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    
                    image: const DecorationImage(
                      image: AssetImage("images/bars.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8.0),
                      onTap: () {
                        // getTouristSpot();
                        Navigator.of(context).pushNamed("/setting_page");
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ), // This trailing com
    );
  }
}
