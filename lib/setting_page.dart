// import 'package:amanojaku/main.dart';
import 'package:flutter/material.dart';
// import 'package:amanojaku/dark_gotcha_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:amanojaku/main.dart';

class SettingCondition {
  SettingCondition({
    this.isAdault = false,
    this.price = 1000,
    this.distance = 300,
    this.isFood = false,
    this.isYami = false,
  });
  final bool isAdault;
  final int price;
  final int distance;
  final bool isFood;
  late final bool isYami;
}

//年齢 20歳以上 1, 20歳未満 0
//値段 1000, 3000, 5000, 8000, 10000, 15000
//距離 1:300, 2:500, 3:1000, 4:2000, 5:3000
//飲食 ON 1, OFF 0
// final itemsProvider = StateProvider<List<int>>((ref) => [0, 1000, 3, 0]);
final settingConditionProvider = StateProvider<SettingCondition>((ref) => SettingCondition());

class SettingPage extends ConsumerWidget {
  //const SettingPage({super.key});

  // @override
  // _DropdownButtonDemoState createState() => _DropdownButtonDemoState();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: _DropdownButtonDemo(),
    );
  }
}

class _DropdownButtonDemo extends ConsumerStatefulWidget {
  const _DropdownButtonDemo({Key? key}) : super(key: key);

  @override
  _DropdownButtonDemoState createState() => _DropdownButtonDemoState();
}

class _DropdownButtonDemoState extends ConsumerState<_DropdownButtonDemo> {
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
    "15000円": ['Math'],
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

  

  int stringIntConvert(String? value) {
    
  // 数字以外の文字を除去して、数字の文字列を取得
  if (value != null){
      String numericString = value.replaceAll(RegExp(r'[^0-9]'), '');
      return int.parse(numericString);
    }else{
      return 0;
    }
  
  // 数字の文字列をintに変換して返す
  
}

  @override
  Widget build(BuildContext context) {
    var items = ref.watch(settingConditionProvider);
    var itemsNotifier = ref.watch(settingConditionProvider.notifier);
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
                    value: items.isAdault?'20歳以上':'20歳未満',
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 30,
                    elevation: 16,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                    underline: Container(
                      height: 2,
                      color: Colors.black,
                    ),
                    onChanged: (newValue) {
                      itemsNotifier.state = SettingCondition(
                        isAdault: newValue == '20歳以上',
                        price: items.price,
                        distance: items.distance,
                        isFood: items.isFood,
                        isYami: items.isYami,
                      );
                      print(items.isAdault);
                      
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
                      value: items.price.toString() + "円",
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 30,
                      elevation: 16,
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                      underline: Container(
                        height: 2,
                        color: Colors.grey,
                      ),
                      onChanged: (newValue) {
                        itemsNotifier.state = SettingCondition(
                        isAdault: items.isAdault,
                        price: stringIntConvert(newValue),
                        distance: items.distance,
                        isFood: items.isFood,
                        isYami: items.isYami,
                      );
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
                    value: items.distance.toString() + "m",
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 30,
                    elevation: 16,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                    underline: Container(
                      height: 2,
                      color: Colors.black,
                    ),
                    onChanged: (newValue) {
                        itemsNotifier.state = SettingCondition(
                        isAdault: items.isAdault,
                        price: items.price,
                        distance: stringIntConvert(newValue),
                        isFood: items.isFood,
                        isYami: items.isYami,
                      );
                      
                      
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
                    value: items.isFood ? 'ON' : 'OFF',
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 30,
                    elevation: 16,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                    underline: Container(
                      height: 2,
                      color: Colors.black,
                    ),
                    onChanged: (newValue) {
                      itemsNotifier.state = SettingCondition(
                        isAdault: items.isAdault,
                        price: items.price,
                        distance: items.distance,
                        isFood: newValue == 'ON',
                        isYami: items.isYami,
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
