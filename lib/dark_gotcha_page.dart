import 'package:flutter/material.dart';

class DarkGotchaPage extends StatelessWidget {
  const DarkGotchaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("闇鍋ガチャ"),
      ),
      body: Column(
          children: [
            const Text('dark_gotchaの画面'),
            const Text('その１'),
            const Text('その２'),
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
        ),
    );
  }
}
