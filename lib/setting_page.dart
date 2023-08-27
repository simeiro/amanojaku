import 'package:amanojaku/main.dart';
import 'package:flutter/material.dart';
import 'package:amanojaku/dark_gotcha_page.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  // @override
  // _DropdownButtonDemoState createState() => _DropdownButtonDemoState();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/map_page": (context) => const MyHomePage(title: "map",),
        "/dark_gotcha_page": (context) => const DarkGotchaPage(), // 通常ガチャのページ
        "/setting_page": (context) => const SettingPage(), // 設定のページ
      },
      title: 'Flutter Demo',
      home: _DropdownButtonDemo(),
    );
  }
}

class _DropdownButtonDemo extends StatefulWidget {
  const _DropdownButtonDemo({Key? key}) : super(key: key);

  @override
  _DropdownButtonDemoState createState() => _DropdownButtonDemoState();
}

class _DropdownButtonDemoState extends State<_DropdownButtonDemo> {
  final Map<String, List<String>> _dropDownMenu = {
    '20歳未満': [], //['Math', 'English', 'Japanese'],
    '20歳以上': [], //['Shoulder', 'Chest', 'Back'],
  };
  final Map<String, List<String>> _dropDownMenu2 = {
    '1000円': [], //['Math'],
    '3000円': ['Shoulder', 'Chest', 'Back'],
    '5000円': ['Flutter', 'Python', 'C#'],
    '8000円': ['Math'],
    '10000円': ['Math'],
    '15000円': ['Math'],
  };
  final Map<String, List<String>> _dropDownMenu3 = {
    '300m': ['Math', 'English', 'Japanese'],
    '500m': ['Shoulder', 'Chest', 'Back'],
    '1000m': ['Flutter', 'Python', 'C#'],
    '2000m': ['Math'],
    '3000m': ['Math'],
  };
  final Map<String, List<String>> _dropDownMenu4 = {
    'ON': ['Math', 'English', 'Japanese'],
    'OFF': ['Shoulder', 'Chest', 'Back'],
  };

  String? _selectedKey = '20歳未満';
  String? _selectedKey2 = '1000円';
  String? _selectedKey3 = '1000m';
  String? _selectedKey4 = 'ON';

  @override
  Widget build(BuildContext context) {
    Colors.white; // テーマ色
    final screenSize = MediaQuery.of(context).size; // 画面サイズを取得する
    return Scaffold(
      body: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // Container(
              // margin: const EdgeInsets.only(top: screenSize.height * 0.2)),
              Container(
                margin:
                    EdgeInsets.only(top: screenSize.height * 0.075 // 上の余白（10%）
                        ),
                width: screenSize.width * 0.6, // 60%
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 2),
                ),
                child: Column(// 年齢確認
                    children: <Widget>[
                  const Text(
                    '年齢',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  DropdownButton<String>(
                    // ドロップダウン
                    value: _selectedKey,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 30,
                    elevation: 16,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                    underline: Container(
                      height: 2,
                      color: Colors.black,
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedKey = newValue;
                      });
                    },
                    items: _dropDownMenu.keys
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ]),
              ),

              Container(
                // 予算確認
                margin:
                    EdgeInsets.only(top: screenSize.height * 0.075 // 上の余白（10%）
                        ),
                width: screenSize.width * 0.6, // 60%
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 2),
                ),
                child: Column(
                  // 年齢確認
                  children: <Widget>[
                    const Text(
                      '予算',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    DropdownButton<String>(
                      // ドロップダウン
                      value: _selectedKey2,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 30,
                      elevation: 16,
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                      underline: Container(
                        height: 2,
                        color: Colors.grey,
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedKey2 = newValue;
                        });
                      },
                      items: _dropDownMenu2.keys
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),

              Container(
                // 距離確認
                margin:
                    EdgeInsets.only(top: screenSize.height * 0.075 // 上の余白（10%）
                        ),
                width: screenSize.width * 0.6, // 60%
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 2),
                ),
                child: Column(// 年齢確認
                    children: <Widget>[
                  const Text(
                    '距離',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  DropdownButton<String>(
                    // ドロップダウン
                    value: _selectedKey3,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 30,
                    elevation: 16,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                    underline: Container(
                      height: 2,
                      color: Colors.black,
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedKey3 = newValue;
                      });
                    },
                    items: _dropDownMenu3.keys
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ]),
              ),

              Container(
                // 飲食のON/OFF
                margin:
                    EdgeInsets.only(top: screenSize.height * 0.075 // 上の余白（10%）
                        ),
                width: screenSize.width * 0.6, // 60%
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 2),
                ),
                child: Column(// 年齢確認
                    children: <Widget>[
                  const Text(
                    '飲食',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  DropdownButton<String>(
                    // ドロップダウン
                    value: _selectedKey4,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 30,
                    elevation: 16,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                    underline: Container(
                      height: 2,
                      color: Colors.black,
                    ),
                    onChanged: (newValue) {
                      setState(
                        () {
                          _selectedKey4 = newValue;
                        },
                      );
                    },
                    items: _dropDownMenu4.keys
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ]),
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
                  width: screenSize.height * 0.1,
                  height: screenSize.height * 0.1,
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
                  width: screenSize.height * 0.1,
                  height: screenSize.height * 0.1,
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
                  width: screenSize.height * 0.1,
                  height: screenSize.height * 0.1,
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
