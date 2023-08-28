// import 'dart:ffi';
// import 'dart:ffi' as ffi;

import 'package:flutter/material.dart';
import 'package:amanojaku/dark_gotcha_page.dart';
import 'package:amanojaku/decision_gotcha_page.dart';
import 'package:amanojaku/setting_page.dart';
import 'package:amanojaku/result_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:csv/csv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    // プロバイダをウィジェットで利用するには、アプリ全体を
    // `ProviderScope` ウィジェットで囲む必要があります。
    // ここに各プロバイダのステート（状態）・値が格納されていきます。
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final items = ref.read(itemsProvider);
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
        "/dark_gotcha_page": (context) => DarkGotchaPage(), // 通常ガチャのページ
        "/decision_gotcha_page": (context) =>DecisionGotchaPage(), // 闇鍋ガチャのページ
        "/result_page": (context) => const ResultPage(), // 排出結果
        "/setting_page": (context) => SettingPage(), // 設定のページ
      },
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
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
                initialCameraPosition:
                    CameraPosition(target: _center, zoom: 11.0),
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
