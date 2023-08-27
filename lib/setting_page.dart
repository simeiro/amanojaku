import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("設定"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: size.height * 0.74),
            // child: Container(), // 空のコンテナでスペースを占有
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
            width: double.infinity,
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
      ),
    );
  }
}
// }
// import 'package:flutter/material.dart';
// // import 'package:flutter/src/material/colors.dart';

// class SettingPage extends StatelessWidget {
//   // This widget is the root of your application.

//   const SettingPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Flutter Demo',
//       home: _DropdownButtonDemo(),
//     );
//   }
// }

// class _DropdownButtonDemo extends StatefulWidget {
//   const _DropdownButtonDemo({Key? key}) : super(key: key);

//   @override
//   _DropdownButtonDemoState createState() => _DropdownButtonDemoState();
// }

// // 18歳以上かどうかを尋ねる
// class _DropdownButtonDemoState extends State<_DropdownButtonDemo> {
//   final Map<String, List<String>> _dropDownMenu = {
//     '学生': ['Math', 'English', 'Japanese'],
//     '大人': ['Shoulder', 'Chest', 'Back'],

//   };
//   final Map<String, List<String>> _dropDownMenu2 = {
//     '￥1000': ['Math'],
//     '￥2500': ['Shoulder', 'Chest', 'Back'],
//     '￥5000': ['Flutter', 'Python', 'C#'],
//     '￥8000': ['Math'],
//     '￥10000': ['Math'],
//     '￥12500': ['Math'],
//   };
//   final Map<String, List<String>> _dropDownMenu3 = {
//     '300m': ['Math', 'English', 'Japanese'],
//     '500m': ['Shoulder', 'Chest', 'Back'],
//     '1000m': ['Flutter', 'Python', 'C#'],
//     '2000m': ['Math'],
//     '3000m': ['Math'],
//   };
//   final Map<String, List<String>> _dropDownMenu4 = {
//     'ON': ['Math', 'English', 'Japanese'],
//     'OFF': ['Shoulder', 'Chest', 'Back'],

//   };
// String? _selectedKey='学生';
//   String? _selectedKey2='￥1000';
//   String? _selectedKey3='300m';
//   String? _selectedKey4='OFF';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Colors.yellow[100],
//       // appBar: AppBar(
//       //   title: Text('設定'),
//       //   // backgroundColor:Colors.blue
//       // ),
//       body: Column(
//         children: <Widget>[
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Container(
//                   margin: EdgeInsets.all(20)),
//               const Text(
//                 '18歳以上',
//                 style: TextStyle(fontSize: 24,backgroundColor: Colors.pink),
//               ),
//               DropdownButton<String>(
//                 value: _selectedKey,
//                 icon: const Icon(Icons.arrow_drop_down),
//                 iconSize: 30,
//                 elevation: 16,
//                 style: const TextStyle(fontSize: 20, color: Colors.black),
//                 underline: Container(
//                   height: 2,
//                   color: Colors.grey,
//                 ),
//                 onChanged: (newValue) {
//                   setState(() {
//                     _selectedKey = newValue;
//                   });
//                 },
//                 items: _dropDownMenu.keys
//                     .map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//               ),
// Container(
//                   margin: EdgeInsets.all(20)),
//               const Text(
//                 '予算',
//                 style: TextStyle(fontSize: 24,backgroundColor: Colors.orange),
//               ),
//               DropdownButton<String>(
//                 value: _selectedKey2,
//                 icon: const Icon(Icons.arrow_drop_down),
//                 iconSize: 30,
//                 elevation: 16,
//                 style: const TextStyle(fontSize: 20, color: Colors.black),
//                 underline: Container(
//                   height: 2,
//                   color: Colors.grey,
//                 ),
//                 onChanged: (newValue) {
//                   setState(() {
//                     _selectedKey2 = newValue;
//                   });
//                 },
//                 items: _dropDownMenu2.keys
//                     .map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 40)),
//               const Text(
//                 '距離',
//                 style: TextStyle(fontSize: 24,backgroundColor: Colors.pink),
//               ),
//               DropdownButton<String>(
//                 value: _selectedKey3,
//                 icon: const Icon(Icons.arrow_drop_down),
//                 iconSize: 30,
//                 elevation: 16,
//                 style: const TextStyle(fontSize: 20, color: Colors.black),
//                 underline: Container(
//                   height: 2,
//                   color: Colors.grey,
//                 ),
//                 onChanged: (newValue) {
//                   setState(() {
//                     _selectedKey3 = newValue;
//                   });
//                 },
// items: _dropDownMenu3.keys
//                     .map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//               ),
//               Container(
//                 margin: EdgeInsets.all(20),

//               ),
//               const Text(
//                 '飲食',
//                 style: TextStyle(fontSize: 24,backgroundColor: Colors.pink),
//               ),
//               DropdownButton<String>(
//                 value: _selectedKey4,
//                 icon: const Icon(Icons.arrow_drop_down),
//                 iconSize: 30,
//                 elevation: 16,
//                 style: const TextStyle(fontSize: 20, color: Colors.black),
//                 underline: Container(
//                   height: 2,
//                   color: Colors.grey,
//                 ),
//                 onChanged: (newValue) {
//                   setState(() {
//                     _selectedKey4 = newValue;
//                   });
//                 },
//                 items: _dropDownMenu4.keys
//                     .map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//               ),

//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   padding: EdgeInsets.all(40),
//                 ),
//                 onPressed: () {},
//                 child: Text(
//                   "1.Normal Button",
//                 ),
//               ),

//             ],
//           )
//         ],
        
//       ),
//     );
//   }
// }