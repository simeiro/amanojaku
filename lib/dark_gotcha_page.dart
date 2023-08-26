import 'package:flutter/material.dart';

class DarkGotchaPage extends StatelessWidget {
  const DarkGotchaPage({super.key});

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
              padding: EdgeInsets.only(top: size.height * 0.125), // 余白
              child: Image.asset('images/normal_gacha.png'),
            ),

            Padding( // 「ガチャる」ボタン
                  padding: EdgeInsets.only(top: size.height * 0.01), // 余白
                  child: SizedBox( // 「ガチャる」ボタンのサイズ
                  width: 150, // 横幅
                  height: 80, // 縦幅
                  child: ElevatedButton( // 「通常ガチャ」ボタン
                    style: ElevatedButton.styleFrom( // 色をつける
                      backgroundColor: const Color(0xFFD90909),
                    ),
                    child: const Text( // テキスト
                      'ガチャる', // テキスト「ガチャる」
                      style: TextStyle( // テキストの色
                      color: Colors.white, // テキストの色（白）
                      fontSize: 25 // フォントサイズ：25
                      ),
                    ),

                    onPressed: (){
                    // ここにボタンを押した時に呼ばれるコードを書く
                    },
                  ),
                )
              ),
            
          ],
        ),
            Expanded(
              child: Container(), // 空のコンテナでスペースを占有
            ),
            Container( // マップのアイコン
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

                  Container( // ガチャのアイコン
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

                  Container(// 設定画面のアイコン
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
        ),
    );
  }
}
