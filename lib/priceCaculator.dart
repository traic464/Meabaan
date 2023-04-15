import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';

class PriceCaculator extends StatefulWidget {
  const PriceCaculator({Key? key}) : super(key: key);

  @override
  State<PriceCaculator> createState() => _PriceCaculatorState();
}

class _PriceCaculatorState extends State<PriceCaculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("asset/image/bg_2.jpg"),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.green.withOpacity(0.2), BlendMode.darken),
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
              child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          // The text border
                          Text(
                            'คำนวนราคาสินค้า',
                            style: TextStyle(
                              fontSize: 25,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 4
                                ..color = Colors.white,
                            ),
                          ),
                          // The text inside
                          const Text(
                            'คำนวนราคาสินค้า',
                            style: TextStyle(
                              fontSize: 25,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 38, 136, 42),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.green,
                                width: 1,
                              )),
                          height: 500,
                          child: Column(
                            children: [
                              Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    color: Colors.green,
                                   // padding: EdgeInsets.all(10),
                                   // width: 220,
                                    child: const Align(
                                      alignment: Alignment.topLeft,
                                      child: Text("เนื้อสันนอก",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 23)),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.amber,
                                   // padding: EdgeInsets.all(10),
                                  //  width: 100,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: const [
                                        Align(
                                          //alignment: Alignment.topLeft,
                                          child: Text("2000",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17)),
                                        ),
                                        Align(
                                          // alignment: Alignment.topLeft,
                                          child: Text("กก/บาท",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17)),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 60,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: const [
                                      TextField(
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
                        ),
                         
                                    ],
                                  ),
                                  //Column()
                                ],
                              ),
                              // Row(
                              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Container(
                              //       color: Colors.amber,
                              //      // padding: EdgeInsets.all(10),
                              //      width: 190,
                              //       child: const TextField(
                              //         decoration: InputDecoration(
                              //             enabledBorder: OutlineInputBorder(
                              //                 borderSide: BorderSide(
                              //                     color: Colors.green),
                              //                 borderRadius: BorderRadius.all(
                              //                     Radius.circular(10))),
                              //             focusedBorder: OutlineInputBorder(
                              //                 borderSide: BorderSide(
                              //                     color: Colors.green),
                              //                 borderRadius: BorderRadius.all(
                              //                     Radius.circular(10))),
                              //             hintText: "100",
                              //             filled: true,
                              //             fillColor: Colors.white,
                              //             contentPadding: EdgeInsets.symmetric(
                              //                 vertical: 5, horizontal: 20)),
                              //       ),
                              //     ),
                              //     Container(
                              //        color: Colors.red,
                              //       width: 90,
                              //       child: const TextField(
                              //         decoration: InputDecoration(
                              //             enabledBorder: OutlineInputBorder(
                              //                 borderSide: BorderSide(
                              //                     color: Colors.green),
                              //                 borderRadius: BorderRadius.all(
                              //                     Radius.circular(10))),
                              //             focusedBorder: OutlineInputBorder(
                              //                 borderSide: BorderSide(
                              //                     color: Colors.green),
                              //                 borderRadius: BorderRadius.all(
                              //                     Radius.circular(10))),
                              //             hintText: "พริก คะน้า กระเพรา",
                              //             filled: true,
                              //             fillColor: Colors.white,
                              //             contentPadding: EdgeInsets.symmetric(
                              //                 vertical: 5, horizontal: 20)),
                              //       ),
                              //     )
                              //   ],
                              // ),
                              SizedBox(
                                height: 10,
                              ),
                              // Row(
                              //   children: [
                              //     Container(
                              //       padding: EdgeInsets.all(10),
                              //       width: 327,
                              //       child: Column(
                              //         crossAxisAlignment: CrossAxisAlignment.center,
                              //         mainAxisAlignment: MainAxisAlignment.center,
                              //         children: const [
                              //            TextField(
                              //         decoration: InputDecoration(
                              //             enabledBorder: OutlineInputBorder(
                              //                 borderSide: BorderSide(
                              //                     color: Colors.green),
                              //                 borderRadius: BorderRadius.all(
                              //                     Radius.circular(10))),
                              //             focusedBorder: OutlineInputBorder(
                              //                 borderSide: BorderSide(
                              //                     color: Colors.green),
                              //                 borderRadius: BorderRadius.all(
                              //                     Radius.circular(10))),
                              //             hintText: "100",
                              //             filled: true,
                              //             fillColor: Colors.white,
                              //             contentPadding: EdgeInsets.symmetric(
                              //                 vertical: 5, horizontal: 20)),
                              //       ),
                              //         ],
                              //       )
                              //     ),
                              //     // Container(
                              //     //   width: 100,
                              //     //   child: const TextField(
                              //     //     decoration: InputDecoration(
                              //     //         enabledBorder: OutlineInputBorder(
                              //     //             borderSide: BorderSide(
                              //     //                 color: Colors.green),
                              //     //             borderRadius: BorderRadius.all(
                              //     //                 Radius.circular(10))),
                              //     //         focusedBorder: OutlineInputBorder(
                              //     //             borderSide: BorderSide(
                              //     //                 color: Colors.green),
                              //     //             borderRadius: BorderRadius.all(
                              //     //                 Radius.circular(10))),
                              //     //         hintText: "พริก คะน้า กระเพรา",
                              //     //         filled: true,
                              //     //         fillColor: Colors.white,
                              //     //         contentPadding: EdgeInsets.symmetric(
                              //     //             vertical: 5, horizontal: 20)),
                              //     //   ),
                              //     // )
                              //   ],
                              // ),
                            ],
                          )),
                    ],
                  ))),
        ),
      ),
    );
  }
}
