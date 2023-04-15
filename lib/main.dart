import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import './productBox.dart';
import 'package:dio/dio.dart';
import './productById.dart';
import 'package:http/http.dart' as http;
import 'package:app_test_3/productById.dart';
import 'package:app_test_3/productAll.dart';
import 'package:date_format/date_format.dart';
import 'package:bordered_text/bordered_text.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Asset Price'),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('asset/image/image_bg.jpeg'),
//               fit: BoxFit.cover,
//                colorFilter: ColorFilter.mode(Colors.white.withOpacity(1.0), BlendMode.darken)
//             )
//           ),

//         ),
//       ),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // late Future<productById> futureAlbum;
  late ProductById _dataFromApi;
  late List<ProductAll> _dataAllFromApi;
  var ListCode = <void>[];
  var ListProduct = [];
  var ListBadCode = [
    "P11007",
    "P11008",
    "P11034",
    "P11035",
    "P11036",
    "P11039",
    "P11040",
    "P11041",
    "P12006",
    "P12007",
    "P12020",
    "P12021",
    "P12022",
    "P13033",
    "P13034",
    "P13035",
    "P13036",
    "P13037",
    "P13038",
    "P13039",
    "P13040",
    "P13042",
    "P13047",
    "P13048",
    "P13049",
    "P13050",
    "P13051",
    "P13052",
    "P13053",
    "P13054",
    "P13055",
    "P13056",
    "P13057",
    "P13058",
    "P13060",
    "P13061",
    "P13062",
    "P13063",
    "P13064",
    "P13065",
    "P13066",
    "P13067",
    "P13068",
    "P13069",
    "P13070",
    "P13071",
    "P13072",
    "P13073",
    "P13074",
    "P13075",
    "P13076",
    "P13077",
    "P13078",
    "P13079",
    "P13080",
    "P13081",
    "P14006",
    "P14018",
    "P14022",
    "P14024",
    "P14025",
    "P14029",
    "P14030",
    "P14031",
    "P14032",
    "P14037",
    "P14038",
    "P14039",
    "P14040",
    "P14041",
    "P14042",
    "P14043",
    "P14044",
    "P14045",
    "P14046",
    "P15004",
    "P15005",
    "P15006",
    "P15016",
    "P15024",
    "P15025",
    "P15028",
    "P15029",
    "P16003",
    "P16004",
    "P16014",
    "P16015",
    "P16016",
    "P16017",
    "P16019",
    "P16023",
    "R11054",
    "R11056",
    "R13002",
    "W11001",
    "W11013",
    "W11014",
    "W11034",
    "W11035",
    "W11036",
    "W11037",
    "W11038",
    "W11039",
    "W11040",
    "W11041",
    "W12001",
    "W12002",
    "W12006",
    "W12007",
    "W14004",
    "W14005",
    "W14008",
    "W14017",
    "W14018",
    "W14023",
    "W14028",
    "W14031",
    "W14032",
    "W15004",
    "W15005",
    "W15006",
    "W15022",
    "W15023",
    "W15026",
    "W15027",
    "W15036",
    "W15040",
    "W16008",
    "W16009",
    "W16010",
    "W16011",
    "W16012",
    "W16013",
    "W16016",
    "W16018",
    "W16019",
    "W16027",
    "W16032",
    "W17008",
    "W17009",
    "W17010",
    "W17011",
    "W18001",
    "W18002",
    "W18003",
    "W18004",
    "W18005",
    "W18006",
    "W18007",
    "W18008",
    "W18009",
    "W18010",
    "W18011",
    "W18012",
    "W18013",
    "W18014",
    "W18015",
    "W18016",
    "W18017",
    "W18018",
    "W18023",
    "W18048",
    "W18049",
    "W18050",
    "W18051",
    "W18052",
    "W18053",
    "W18054",
    "W18055",
    "W18056",
    "W18057",
    "W18058",
    "W18059",
    "W18060",
    "W18061",
    "W18062",
    "W18063",
    "W18064",
    "W18067",
    "W18068",
    "W18070",
    "W18072",
    "W18073",
    "W18074",
    "W18076",
    "W18077",
    "W18081",
    "W18082",
    "W18083",
    "W18085"
  ];

  @override
  void initState() {
    super.initState();
    getAllDataFromApi();
  }

  Future<List<ProductAll>> getAllDataFromApi() async {
    var getAllUrl =
        "https://dataapi.moc.go.th/gis-products?keyword=&sell_type=Retail";
    var responseGetAll = await http.get(Uri.parse(getAllUrl));
    _dataAllFromApi = productAllFromJson(responseGetAll.body);
    print("getAll");

    return _dataAllFromApi;
  }

  Future<ProductById> getDataFromApi() async {
    await Future.delayed(Duration(milliseconds: 20000));
    var dateTime = DateTime.now();
    var date = dateTime.day - 1;
    var month = dateTime.month;
    var year = dateTime.year;

    for (var i = 0; i < ListBadCode.length; i++) {
      _dataAllFromApi.removeWhere((code) => code.productId == ListBadCode[i]);
    }

     //for (var i = 1; i < _dataAllFromApi.length; i++) {
     for (var i = 1; i < 10; i++) {
      var product_code = _dataAllFromApi[i].productId;
      print(product_code);
      var url =
          'https://dataapi.moc.go.th/gis-product-prices?product_id=$product_code&from_date=$year-$month-$date&to_date=$year-$month-$date';
      print(url);

      var response = await http.get(Uri.parse(url));
      print(response);

      _dataFromApi =
          await productByIdFromJson(response.body); //json => dart object
      print(_dataFromApi);
      ListProduct.add(_dataFromApi);
    }
    print(ListProduct);
    print("getId");

    return _dataFromApi;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('asset/image/bg_2.jpg'),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.green.withOpacity(0.2), BlendMode.darken),
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: FutureBuilder(
            future: getDataFromApi(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Padding(
                    padding: const EdgeInsets.only(
                        top: 40, left: 20, right: 20, bottom: 5),
                    child: Container(
                        child: ListView(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                  //color: Colors.red,
                                  width: 250,
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      children: [
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Stack(
                                              children: [
                                                // The text border
                                                Text(
                                                  'Meabaan',
                                                  style: TextStyle(
                                                    fontSize: 32,
                                                    letterSpacing: 0.5,
                                                    fontWeight: FontWeight.bold,
                                                    foreground: Paint()
                                                      ..style =
                                                          PaintingStyle.stroke
                                                      ..strokeWidth = 4
                                                      ..color = Colors.white,
                                                  ),
                                                ),
                                                // The text inside
                                                const Text(
                                                  'Meabaan',
                                                  style: TextStyle(
                                                    fontSize: 32,
                                                    letterSpacing: 0.5,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 38, 136, 42),
                                                  ),
                                                ),
                                              ],
                                            )),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Stack(
                                            children: [
                                              // The text border
                                              Text(
                                                'แอพพลิเคชันที่จะช่วยให้คุณแม่บ้านจ่ายตลาดสะดวกมากยิ่งขึ้น',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  letterSpacing: 0.5,
                                                  fontWeight: FontWeight.bold,
                                                  foreground: Paint()
                                                    ..style =
                                                        PaintingStyle.stroke
                                                    ..strokeWidth = 4
                                                    ..color = Colors.white,
                                                ),
                                              ),
                                              // The text inside
                                              const Text(
                                                'แอพพลิเคชันที่จะช่วยให้คุณแม่บ้านจ่ายตลาดสะดวกมากยิ่งขึ้น',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  letterSpacing: 0.5,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 38, 136, 42),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const TextField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              hintText: "พริก คะน้า กระเพรา",
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: Align(
                                widthFactor: 1.0,
                                heightFactor: 1.0,
                                child: Icon(
                                  Icons.search,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20)),
                                  keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: 14,),
                        Container(
                          padding: EdgeInsets.only(left: 2),
                          child: Row(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Stack(
                                  children: [
                                    // The text border
                                    Text(
                                      'ราคาสินค้าทางการเกษตร',
                                      style: TextStyle(
                                        fontSize: 20,
                                        letterSpacing: 0.5,
                                        fontWeight: FontWeight.bold,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 4
                                          ..color = const Color.fromARGB(
                                              255, 38, 136, 42),
                                      ),
                                    ),
                                    // The text inside
                                    const Text(
                                      'ราคาสินค้าทางการเกษตร',
                                      style: TextStyle(
                                        fontSize: 20,
                                        letterSpacing: 0.5,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        for (var i = 0; i < ListProduct.length; i++)
                          ProductBox(
                              ListProduct[i].productName,
                              ListProduct[i].priceMaxAvg,
                              ListProduct[i].priceMaxAvg,
                              ListProduct[i].priceMinAvg,
                              ListProduct[i].unit),
                      ],
                    )));
              }
              return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(
                        color: Colors.white,
                        backgroundColor: Colors.green,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "กรุณารอสักครู่",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                      )
                    ]),
              );
            },
          )),
    );
  }
}
// return
// Padding(
//               padding: const EdgeInsets.all(25.0),
//               child: Container(
//                   child: ListView(
//                 children: [
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text("Meabaan", textAlign: TextAlign.left),
//                       Text(
//                           "แอพพลิเคชันที่จะช่วยให้คุณแม่บ้านจ่ายตลาดสะดวกมากยิ่งขึ้น"),
//                       SizedBox(
//                         height: 15.0,
//                       ),
//                       for (var i = 0; i < ListProduct.length; i++)
//                         (MoneyBox(
//                             ListProduct[i].productName,
//                             ListProduct[i].priceMaxAvg,
//                             ListProduct[i].priceMaxAvg,
//                             ListProduct[i].priceMinAvg,
//                             ListProduct[i].unit)),
//                       SizedBox(
//                         height: 15.0,
//                       ),
//                     ],
//                   )
//                 ],
//               )));

// return Scaffold(
//         // appBar: AppBar(
//         //   title: Text("App Test",
//         //       style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
//         // ),
//         body: FutureBuilder(
//       future: getDataFromApi(),
//       builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           return Padding(
//               padding: const EdgeInsets.all(25.0),
//               child: Container(
//                   child: ListView(
//                 children: [
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text("Meabaan", textAlign: TextAlign.left),
//                       Text(
//                           "แอพพลิเคชันที่จะช่วยให้คุณแม่บ้านจ่ายตลาดสะดวกมากยิ่งขึ้น"),
//                       SizedBox(
//                         height: 15.0,
//                       ),
//                       for (var i = 0; i < ListProduct.length; i++)
//                         MoneyBox(
//                             ListProduct[i].productName,
//                             ListProduct[i].priceMaxAvg,
//                             ListProduct[i].priceMaxAvg,
//                             ListProduct[i].priceMinAvg,
//                             ListProduct[i].unit),
//                       SizedBox(
//                         height: 15.0,
//                       ),
//                     ],
//                   )
//                 ],
//               )));
//         }
//         return Center(
//           child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//             CircularProgressIndicator(),
//             SizedBox(
//               height: 10,
//             ),
//             Text(
//               "กรุณารอสักครู่",
//               style: TextStyle(color: Colors.green),
//             )
//           ]),
//         );
//       },
//     ));
