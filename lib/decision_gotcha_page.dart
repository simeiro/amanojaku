import 'package:amanojaku/dark_gotcha_page.dart';
import 'package:amanojaku/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DecisionGotchaPage extends ConsumerStatefulWidget {
  const DecisionGotchaPage({super.key}); // 闇鍋ガチャ
  
  @override
  _DecisionGotchaPage createState() => _DecisionGotchaPage();
}


class _DecisionGotchaPage extends ConsumerState<DecisionGotchaPage>{

  @override
  Widget build(BuildContext context) {
    var itemsNotifier = ref.watch(settingConditionProvider.notifier);
    var items = ref.watch(settingConditionProvider);
    final sizes = MediaQuery.of(context).size; // 画面サイズを取得する
    return MaterialApp(
      // routes: {
      //   "/dark_gotcha_page": (context) => const DarkGotchaPage(), // 闇鍋ガチャのページ
      // },
      home: Scaffold(
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
                            backgroundColor: const Color(0xFFE8E8E8),
                            side: const BorderSide(
                              // 外枠線
                              color: Colors.black, // テキストカラー：black
                              width: 3, //太さ
                            ),
                          ),
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
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed("/dark_gotcha_page");
                          },
                        ),
                      ),
                      Container(
                        // ボタン：闇鍋ガチャ
                        padding: EdgeInsets.only(top: sizes.height * 0.075),
                        height: sizes.height * 0.175,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF640A9B),
                              side: const BorderSide(
                                color: Colors.black,
                                width: 3,
                              )),
                          child: Text(
                            '闇鍋ガチャ',
                            style: GoogleFonts.zenMaruGothic(
                                textStyle:
                                    Theme.of(context).textTheme.headlineMedium,
                                color: Colors.white,
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
                    Container(
                      // 闇鍋ガチャ本体
                      margin: EdgeInsets.only(
                          top: sizes.height * 0.025,
                          bottom: sizes.height * 0.02),
                      width: double.infinity,
                      height: sizes.height * 0.65,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Image.asset(
                          'images/yaminabe.png',
                        ),
                      ),
                    ),
                    GestureDetector(
                      // button
                      onTap: () {
                        itemsNotifier.state = SettingCondition(
                        isAdault: items.isAdault,
                        price: items.price,
                        distance: items.distance,
                        isFood: items.isFood,
                        isYami: true,
                      );
                        // ガチャが回せる
                        Navigator.of(context).pushNamed("/result_page");
                      },
                      child: Container(
                          margin: EdgeInsets.only(
                              top: sizes.height * 0.025,
                              bottom: sizes.height * 0.02),
                          width: double.infinity,
                          height: sizes.height * 0.65,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Image.asset(
                              'images/button2.png',
                            ),
                          )),
                    )
                  ],
                ),
              ],
            ),
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
              // マップのアイコン
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: sizes.height * 0.1,
                    height: sizes.height * 0.1,
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
                    width: sizes.height * 0.1,
                    height: sizes.height * 0.1,
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
                    width: sizes.height * 0.1,
                    height: sizes.height * 0.1,
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
      ),
    );
  }
}
