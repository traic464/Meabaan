import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './priceCaculator.dart';
// สร้าง container ต้นแบบเอาไว้
class ProductBox extends StatelessWidget {
  String title; //ชื่อรายการ
  double price; //จำนวนเงิน
  double max_price; // ราคาสูงสุด
  double min_price; // ราคาต่ำสุด
  String unit; //หน่วย

  ProductBox(this.title, this.price, this.max_price, this.min_price, this.unit);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const PriceCaculator()),
            // );
          },
          child: Container(
            padding: const EdgeInsets.all(11.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.green,
                  width: 1,
                )),
            height: 135,
            //width: 400,
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                // Container(
                //   color: Colors.blue,
                //   child: Align(
                //     alignment: Alignment.centerLeft,
                //     child: Text(title),
                //   ),
                // ),
                // Column(
                //   children: [
                // Align(
                //   alignment: Alignment.topLeft,
                Container(
                    //color: Colors.red,
                    width: 200,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                                'ราคาสูงสุด:${NumberFormat("#,###.##").format(max_price)}',
                                style: TextStyle(fontSize: 13)),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                                'ราคาต่ำสุด:${NumberFormat("#,###.##").format(min_price)}',
                                style: TextStyle(fontSize: 13)),
                          )
                        ],
                      ),
                    )),
                Container(
                    //color: Colors.red,
                    width: 110,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                  '${NumberFormat("#,###.##").format(max_price)}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20))),
                          Align(
                              alignment: Alignment.topRight,
                              child: Text("หน่วย:" + unit,
                                  style: TextStyle(fontSize: 13)))
                        ],
                      ),
                    )),
                //  )
                //   ],
                // ),
                // Column(
                //   children: [
                //     Text(title,
                //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                //     Text('ราคาสูงสุด:${NumberFormat("#,###.##").format(max_price)}',
                //         style: TextStyle(fontSize: 13)),
                //     Text('ราคาต่ำสุด:${NumberFormat("#,###.##").format(min_price)}',
                //         style: TextStyle(fontSize: 13))
                //   ],
                // ),
//Expanded(
                //child:
                // Column(
                //   children: [
                //     Text('${NumberFormat("#,###.##").format(max_price)}',
                //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                //     Text("หน่วย:" + unit, style: TextStyle(fontSize: 13)),
                //   ],
                // )
                // )
              ],
            ),
          ),
        )
      ],
    );
  }
}

// class $ {}


// children: [
//           Text(
//             title,
//             style: const TextStyle(
//                 fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
//           ),
//           const Expanded(
//             child: Text(
//               // '${NumberFormat("#,###.##").format(amount)}'
//               "aa",
//               style: TextStyle(
//                   fontSize: 25,
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold),
//               textAlign: TextAlign.right,
//             ),
//           )
//         ]

//  return Container(
//       padding: const EdgeInsets.all(20.0),
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(
//             color: Colors.green,
//             width: 1,
//           )),
//       height: 106,
//       //width: 400,
//       child: Row(
//         // crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children:[
//           Column(
//             children: [
//               Text(title,
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
//              Text( 'ราคาสูงสุด:${NumberFormat("#,###.##").format(max_price)}', style: TextStyle(fontSize: 13)),
//              Text('ราคาต่ำสุด:${NumberFormat("#,###.##").format(min_price)}', style: TextStyle(fontSize: 13))
//             ],
//           ),
// //Expanded(
//           //child:
//           Column(
//             children: [
//               Text('${NumberFormat("#,###.##").format(max_price)}',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
//               Text("หน่วย:"+unit, style: TextStyle(fontSize: 13)),
//             ],
//           )
//           // )
//         ],
//       ),
//     );