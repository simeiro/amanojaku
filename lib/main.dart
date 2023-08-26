import 'package:flutter/material.dart';
import 'package:amanojaku/dark_gotcha_page.dart';
import 'package:amanojaku/decision_gotcha_page.dart';
import 'package:amanojaku/setting_page.dart';

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
        "/map_page": (context) => const MyHomePage(title: 'map',),
        "/dark_gotcha_page": (context) => const DarkGotchaPage(),
        "/decision_gotcha_page": (context) => const DecisionGotchaPage(),
        "/setting_page": (context) => const SettingPage(),
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

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Column(
          children: [
            //const Text('マップの画面'),
            Column( // 縦
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row( // 横
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.125, right: size.width * 0.1),
                  child: ElevatedButton( // 「通常ガチャ」ボタン
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD90909),
                    ),
                    child: const Text(
                      '通常ガチャ',
                      style: TextStyle(
                      color: Colors.white, // テキストの色を白に設定
                      ),
                    ),

                    onPressed: (){
                    // ここにボタンを押した時に呼ばれるコードを書く
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.125),
                  child: ElevatedButton( // 「闇鍋ガチャ」ボタン
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFCECECE),
                    ),
                    child: const Text(
                      '闇鍋ガチャ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      ),
                    onPressed: (){
                    // ここにボタンを押した時に呼ばれるコードを書く
                    },
                  ),
                )
              ]
            ),
            Padding(
                  padding: EdgeInsets.only(top: size.height * 0.485), // 余白
                  child: SizedBox( // ボタンのサイズ変更
                  width: 150,
                  height: 80,
                  child: ElevatedButton( // 「通常ガチャ」ボタン
                    style: ElevatedButton.styleFrom( // 色をつける
                      backgroundColor: const Color(0xFFD90909),
                    ),
                    child: const Text( // テキスト
                      'ガチャる',
                      style: TextStyle(
                      color: Colors.white,
                      fontSize: 25 // テキストの色を白に設定
                      ),
                    ),

                    onPressed: (){
                    // ここにボタンを押した時に呼ばれるコードを書く
                    },
                  ),
                )
              ),

            
            // Padding(
            //   padding: EdgeInsets.only(top: screenSize.height * 0.125),
            //   child: ElevatedButton(
            //     child: const Text('次へ'),
            //     onPressed: (){
            //     // ここにボタンを押した時に呼ばれるコードを書く
            //     },
            //   ),
            // )
            
          ],
        ),
            Expanded(
              child: Container(), // 空のコンテナでスペースを占有
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(size.height * 0.01),
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: size.width * 0.15,
                    height: size.width * 0.15,
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
                    width: size.width * 0.15,
                    height: size.width * 0.15,
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
                    width: size.width * 0.15,
                    height: size.width * 0.15,
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
