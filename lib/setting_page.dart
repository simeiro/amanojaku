import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("設定"),
      ),
      body: Container(
        // mapアイコン
        margin: const EdgeInsets.only(top: 630),
        padding: const EdgeInsets.only(top: 0, right: 0, bottom: 0, left: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 画像を均等に配置
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: AssetImage(
                    "images/map.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(8.0),
                  onTap: () {
                    // 押下時の処理を記述
                    Navigator.of(context).pushNamed("/map_page");
                  },
                ),
              ),
            ),

            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: AssetImage(
                    "images/capsule.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(8.0),
                  onTap: () {
                    // 押下時の処理を記述
                    Navigator.of(context).pushNamed("/dark_gotcha_page");
                  },
                ),
              ),
            ),

            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: AssetImage(
                    "images/bars.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(8.0),
                  onTap: () {
                    // 押下時の処理を記述
                    Navigator.of(context).pushNamed("/setting_page");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}