import 'dart:ffi';

import 'package:amanojaku/setting_page.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amanojaku/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;

  List<String> resultData = ['待機中...','0.0','0.0'];



class ResultPage extends ConsumerStatefulWidget {
  const ResultPage({super.key});

  @override
  _ResultPage createState() => _ResultPage();
}

class _ResultPage extends ConsumerState<ResultPage> {
  
  
  late GoogleMapController? _mapController;
  // Double latitude = double.parse(foodData[1]);
  // Double longitude = double.parse(foodData[2]);
  // List<double> doubleList = resultData.map((str) => double.parse(str)).toList();

  final LatLng _targetLocation = LatLng(35.0, 135.0); // 東京の緯度経度

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }
  // Future<void> initLocation() async {
  //   LocationPermission permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       return Future.error('Location permissions are denied');
  //     }
  //   }
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   final latitude = position.latitude;
  //   final longitude = position.longitude;
  //   print(latitude);
  //   print(longitude);
  //   setState(() {});
  // }

    Future<List<String>> getFoodData(items) async {
    const key = "6e2aa9bdb920f66d"; //apiキー
    const lat = "35.004928278716674"; //緯度
    const lng = "135.75843372522007"; //経度
    String range_val = "1"; // 1: 半径300m
    const count = "100"; // 100件
    int money = items.price;
    bool isStudent = items.isAdault;
    //Future<List<String>>
    switch(items.distance){
      case 300:
        range_val = "1";
        break;
      case 500:
        range_val = "2";
        break;
      case 1000:
        range_val = "3";
        break;
      case 2000:
        range_val = "4";
        break;
      case 3000:
        range_val = "5";
        break;
      default:
        break;
    }

    if(items.isYami){
      range_val = "5";
      money = 100000;
      isStudent = true;
    }

    var url = Uri.parse(
      "http://webservice.recruit.co.jp/hotpepper/gourmet/v1/"
      "?key=$key&lat=$lat&lng=$lng&range=$range_val&count=$count&format=json",
    );
    // print(url.toString()); // URLを表示
    var response = await http.get(url);
    final jsonData = json.decode(response.body);
    // print(jsonData);
    List<List<String>> shopList = [];
    // int data_count = 0;
    for (var data in jsonData["results"]["shop"]) {
      String ans = "";
      bool splitFlag = true;
      for (var i = 0; i < data["budget"]["name"].length; i++) {//金額の平均を求めるfor
        if (int.tryParse(data["budget"]["name"][i]) != null) {
          ans += data["budget"]["name"][i];
          splitFlag = true;
        } else if (splitFlag) {
          ans += ",";
          splitFlag = false;
        }
      }
      for (var i = 0; i < data["budget"]["average"].length; i++) {//金額の平均を求めるfor
        if (int.tryParse(data["budget"]["average"][i]) != null) {
          // 数字であれば
          ans += data["budget"]["average"][i];
          splitFlag = true;
        } else if (splitFlag) {
          //,,,,,のように何回も,を文字列に追加しないためのflag
          if (data["budget"]["average"][i] != ",") {
            //文字がカンマでなければ
            ans += ",";
            splitFlag = false;
          }
        }
      }
      List<String> numbersList = ans.split(",");
      numbersList.removeLast(); //最後の点はなくす
      // print(numbersList);
      int sum = 0;
      for (var data in numbersList) {
        sum += int.tryParse(data)!;
      }
      if ((sum / numbersList.length).isNaN){//aveを取得できないときの処理
        continue;
      }
      
      int average = (sum / numbersList.length).toInt();
      //ここから条件指定
      if (money < average){
        continue;
      }
      if (isStudent) {
        if(data["genre"]["name"] == "居酒屋" ||
            data["genre"]["name"] == "ダイニングバー・バル" ||
            data["genre"]["name"] == "バー・カクテル"){
              continue;
            }
      }
      //もしこれらの条件を満たしたら
      shopList.add([data["name"], data["lat"].toString(), data["lng"].toString()]);
      print(average);

      // print((average).toString() +
      //     "円 : " +
      //     data["name"] +
      //     " : " +
      //     data["genre"]["name"]);
      // print(data["lat"].toString() + ", " + data["lng"].toString()); // 緯度と経度
      
    }
    Random random = Random();
    int randomNumber = random.nextInt(shopList.length);
    print(shopList[randomNumber]);
    // await Future.delayed(Duration(seconds: 2));
    return shopList[randomNumber];
  }

  Future<List<String>> getTouristSpot(items) async {
    //現在地仮
    double nowLat = 35.00303373744829;
    double nowLon = 135.75844445405633;
    int range = items.distance; //距離(m)
    if(items.isYami){
      range = 3000;
    }
    final input = await rootBundle.loadString('assets/kyoto-tourist-spot.csv');
    final fields = CsvToListConverter().convert(input)
        .toList();
    List<List<String>> spotList = [];
    for (final row in fields) {
      if (row[3].contains('京都市') && 
        row[10].runtimeType == double && 
        row[11].runtimeType == double &&
        getDistance(nowLat, nowLon, row[10], row[11]) < range) {
          spotList.add([row[4], row[10].toString(), row[11].toString()]);
          // print((getDistance(nowLat, nowLon, row[10], row[11])).toString() + "m, " +row[4]);
        // print("場所 : " + row[4] + ", 距離 : " + (getDistance(nowLat, nowLon, row[10], row[11])).toString());
        // print(row[10].runtimeType);
        // if (row[10].runtimeType == String){
        //   print(row[10]);
        // }
        // ここに条件が成立したときの処理を書く
      }
      
    }
    Random random = Random();
    int randomNumber = random.nextInt(spotList.length);
    print(spotList[randomNumber]);
    return spotList[randomNumber];

  }
  double getDistance(double lat1, double lon1, double lat2, double lon2){
    double poleRadius = 6356752.314245;
    double equatorRadius = 6378137.0;

    lat1 = lat1 * (math.pi / 180);
    lon1 = lon1 * (math.pi / 180);
    lat2 = lat2 * (math.pi / 180);
    lon2 = lon2 * (math.pi / 180);
    double latDifference = lat1 - lat2;
    double lonDifference = lon1 - lon2;
    double latAverage = (lat1 + lat2) / 2.0;
    double e2 = (math.pow(equatorRadius, 2) - math.pow(poleRadius, 2)) / math.pow(equatorRadius, 2);
    double w = math.sqrt(1- e2 * math.pow(math.sin(latAverage), 2));
    double m = equatorRadius * (1 - e2) / math.pow(w, 3);
    double n = equatorRadius / w;
    double distance = math.sqrt(math.pow(m * latDifference, 2) + math.pow(n * lonDifference * math.cos(latAverage), 2));
    // print(distance);
    return distance.truncateToDouble();
  }
  Future<List<String>> getData(items) async{
    
    Random random = Random();
    int randomNumber = random.nextInt(2);
    List<String> data;
    if (randomNumber == 0 ||  items.isFood){
      data = await getFoodData(items);
    }else{
      data = await getTouristSpot(items);
    }
    print(randomNumber);
    return data;
  }
  //List<String> resultData = ['待機中...','0.0','0.0'];


  
  @override
  void initState() {
    Future(()async {
      final items = ref.watch(settingConditionProvider);
      resultData = await getData(items);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final  size = MediaQuery.of(context).size;
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
              resultData[0].toString(),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final urlString = 'https://www.google.com/maps/search/?api=1&query=${resultData[1]},${resultData[2]}';
                final Uri url = Uri.parse(urlString.trimLeft());
              
                if (await canLaunchUrl(url)) {
                  launch(urlString, forceSafariVC: false);
                }

              }, child: const Text("GoogleMapへ")),

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
                    // getTouristSpot();
                    // getData();
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
