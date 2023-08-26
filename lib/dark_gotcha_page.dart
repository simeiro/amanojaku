import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DarkGotchaPage extends StatelessWidget {
  const DarkGotchaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size; // 画面サイズを取得する
    return Scaffold(
        body: Column(
      // 縦に並べる
      children: [
        Column(
          // 縦に並べる
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
                // 横に並べる
                mainAxisAlignment: MainAxisAlignment.center, // 中央に揃える
                children: [
                  Container(
                    // ボタン：通常ガチャ
                    padding: EdgeInsets.only(
                        top: sizes.height * 0.075, // 縦要素を7.5%分空ける
                        right: sizes.width * 0.1 // 横要素を10%分空ける
                        ),
                    height: sizes.height * 0.175, // 縦の大きさを全体の17.5%にする
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF9320C),
                          side: const BorderSide(
                            // 外枠線
                            color: Colors.black, // テキストカラー：black
                            width: 3, //太さ
                          )),
                      child: Text(
                        //テキスト：ハンドルをタップ
                        '通常ガチャ',
                        style: GoogleFonts.zenMaruGothic(
                            // フォント
                            textStyle:
                                Theme.of(context).textTheme.headlineMedium,
                            color: Colors.black, // テキストカラー：black
                            fontSize: 18 // フォントサイズ：18
                            ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    // ボタン：闇鍋ガチャ
                    padding: EdgeInsets.only(top: sizes.height * 0.075),
                    height: sizes.height * 0.175,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE8E8E8),
                          side: const BorderSide(
                            color: Colors.black,
                            width: 3,
                          )),
                      child: Text(
                        '闇鍋ガチャ',
                        style: GoogleFonts.zenMaruGothic(
                            textStyle:
                                Theme.of(context).textTheme.headlineMedium,
                            color: Colors.black,
                            fontSize: 18),
                      ),
                      onPressed: () {
                        // 闇鍋ガチャの画面に遷移する
                      },
                    ),
                  )
                ]),

            Stack(
              children: <Widget>[
                Container(// 通常ガチャ本体
                  padding: EdgeInsets.only(
                      top: sizes.height * 0.015,
                      bottom: sizes.height * 0.02),
                  width: sizes.width * 0.75,
                  child: Image.asset(
                    'images/normal_gacha.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: sizes.height * 0.41,
                    left: sizes.width * 0.26
                  ),
                child: Image.asset(
                  'images/button.png',
                ),
                )
              ],
            ),

            // Text(
            //   // テキスト
            //   'ハンドルをタップ！', // テキスト「ハンドルをタップ!」
            //   style: GoogleFonts.zenMaruGothic(
            //       // テキストの色
            //       textStyle: Theme.of(context).textTheme.headlineMedium,
            //       color: Colors.black, // テキストの色（白）
            //       fontSize: 36 // フォントサイズ：16
            //       ),
            // ),
          ],
        ),
        // Expanded(
        //   child: Container(), // 空のコンテナでスペースを占有
        // ),

        const Divider(
          // アイコンの区切り線
          color: Colors.black,
          thickness: 3,
          indent: 20,
          endIndent: 20,
        ),

        SizedBox(
          // マップのアイコン
          width: double.infinity,
          // padding: EdgeInsets.all(size.height * 0.01),
          // color: Colors.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: sizes.width * 0.15,
                height: sizes.width * 0.15,
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
                // ガチャのアイコン
                width: sizes.width * 0.15,
                height: sizes.width * 0.15,
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
                // 設定画面のアイコン
                width: sizes.width * 0.15,
                height: sizes.width * 0.15,
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
    ));
  }
}