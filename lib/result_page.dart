import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  _ResultPage createState() => _ResultPage();
}

class _ResultPage extends State<ResultPage> {
  late GoogleMapController? _mapController;
  final LatLng _targetLocation = LatLng(35.6895, 139.6917); // 東京の緯度経度

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white, // テーマ色
        body: Column(
          children: <Widget>[

            Container(
              padding: EdgeInsets.all(32),
              height: 400,
              width: 400,
              child: SizedBox(
                // width: size.width * 0.5,
                height: size.height * 0.5,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: _targetLocation,
                    zoom: 12.0,
                  ),
                  onMapCreated: _onMapCreated,
                  markers: Set<Marker>.from([
                    Marker(
                      markerId: MarkerId('target_marker'),
                      position: _targetLocation,
                      infoWindow: InfoWindow(
                        title: 'Target Location',
                      ),
                    ),
                  ]),
                ),
              ),
            ),

            Text(
              '場所',
              style: TextStyle(
                fontSize: 45,
              ),
            ),

            Container(
                margin: EdgeInsets.only(
                top: size.height * 0.05, bottom: size.height * 0.02),
                height: size.height * 0.075,
                // 縦の大きさを全体の17.5%にする
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF9649),
                    side: const BorderSide(
                      // 外枠線
                      color: Colors.black, // テキストカラー：black
                      width: 2, //太さ
                    ),
                  ),
                  child: Text(
                    //テキスト：ハンドルをタップ
                    '戻る',
                    style: GoogleFonts.zenMaruGothic(
                        // フォント
                        textStyle: Theme.of(context).textTheme.headlineMedium,
                        color: Colors.black, // テキストカラー：black
                        fontSize: 18 // フォントサイズ：18
                        ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed("/dark_gotcha_page");
                  },
                ),
              ),
            // Container(
            //   padding: EdgeInsets.only(top: size.height * 0.74),
            //   // child: Container(), // 空のコンテナでスペースを占有
            // ),
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
      ),
    );
  }
}
