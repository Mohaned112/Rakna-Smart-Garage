// import 'package:flutter/material.dart';
//
// import '../components/LogButton_Widget.dart';
// import '../components/slot-place.dart';
//
// class SlotSelection extends StatefulWidget {
//   const SlotSelection({Key? key}) : super(key: key);
//
//   @override
//   State<SlotSelection> createState() => _SlotSelectionState();
// }
//
// class _SlotSelectionState extends State<SlotSelection> {
//   // 0xff07193e
//   int length = 8;
//   bool click = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xff07193e).withOpacity(.92),
//       appBar: AppBar(
//         shadowColor: Colors.transparent,
//         backgroundColor: Color(0xff4169E1).withOpacity(.20),
//         leading: Icon(Icons.arrow_back_ios_new_rounded),
//         title: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 77),
//             child: Text('Select Parking Slot')),
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: List.generate(
//                     5,
//                         (index) => Padding(
//                       padding:
//                       const EdgeInsets.only(left: 2, right: 2, bottom: 5),
//                       child: Row(
//                         children: [
//                           Container(
//                             width: 90,
//                             height: 37,
//                             decoration: BoxDecoration(
//                                 color: Colors.transparent,
//                                 border: Border.all(
//                                   color:
//                                   Colors.orange.shade600.withOpacity(.21),
//                                 ),
//                                 borderRadius: BorderRadius.circular(10)),
//                             child: Center(
//                               child: Text(
//                                 'Section A',
//                                 style: TextStyle(
//                                     color: Colors.orange.withOpacity(.77)),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 5,
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             // Stack(
//             //   children: [
//             //     Container(
//             //       height: 60,
//             //       width: 240,
//             //       decoration: BoxDecoration(color:  Color(0xff1f2248),
//             //       borderRadius: BorderRadius.circular(6)),
//             //     ),
//             //     Positioned(
//             //       bottom: 7,
//             //       left: 7,
//             //       child: Container(
//             //           height: 45,
//             //           width: 225,
//             //           decoration: BoxDecoration(
//             //               color: Colors.blue.shade900,
//             //               borderRadius: BorderRadius.circular(5)),
//             //           child: const Center(
//             //               child: Text(
//             //                 'Cars',
//             //                 style: TextStyle(
//             //                     color: Colors.white,
//             //                     fontWeight: FontWeight.w500,
//             //                     fontSize: 20),
//             //               ))),
//             //     ),
//             //
//             //   ],
//             // ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 0, right: 5),
//                   child: Container(
//                     height: 20,
//                     width: 20,
//                     decoration: BoxDecoration(
//                         color: Color(0xff1f2248),
//                         border: Border.all(color: Colors.blue.shade800),
//                         borderRadius: BorderRadius.circular(2)),
//                   ),
//                 ),
//                 Text(
//                   'Available',
//                   style: TextStyle(color: Colors.white.withOpacity(.86)),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 50, right: 5),
//                   child: Container(
//                     height: 20,
//                     width: 20,
//                     decoration: BoxDecoration(
//                         color: Colors.yellow.shade800,
//                         borderRadius: BorderRadius.circular(2)),
//                   ),
//                 ),
//                 Text('Selected', style: TextStyle(color: Colors.white)),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 50, right: 5),
//                   child: Container(
//                     height: 20,
//                     width: 20,
//                     decoration: BoxDecoration(
//                         color: Color(0xff1f2248),
//                         borderRadius: BorderRadius.circular(2)),
//                   ),
//                 ),
//                 Text('Booked', style: TextStyle(color: Colors.white))
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: SizedBox(
//                 height: 520,
//                 child: ListView(
//                   physics: length > 8
//                       ? AlwaysScrollableScrollPhysics()
//                       : NeverScrollableScrollPhysics(),
//                   scrollDirection: Axis.vertical,
//                   shrinkWrap: false,
//                   children: [
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               SizedBox(
//                                   height: 20,
//                                   width: 100,
//                                   child: Divider(
//                                     color: Colors.grey.shade400,
//                                     thickness: .2,
//                                     endIndent: 10,
//                                     indent: 10,
//                                   )),
//                               Text(
//                                 'Entry',
//                                 style: TextStyle(
//                                     color: Colors.grey.shade600,
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                               SizedBox(
//                                   height: 20,
//                                   width: 190,
//                                   child: Divider(
//                                     color: Colors.grey.shade400,
//                                     thickness: .2,
//                                     endIndent: 10,
//                                     indent: 10,
//                                   )),
//                               Text(
//                                 'Entry',
//                                 style: TextStyle(
//                                     color: Colors.grey.shade600,
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                               SizedBox(
//                                   height: 20,
//                                   width: 100,
//                                   child: Divider(
//                                     color: Colors.grey.shade400,
//                                     thickness: .2,
//                                     endIndent: 10,
//                                     indent: 10,
//                                   )),
//                             ],
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 5),
//                             child: Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(right: 207),
//                                   child: Text(
//                                     'C1',
//                                     style: TextStyle(
//                                         color: Colors.orange.withOpacity(.77),
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ),
//                                 Text(
//                                   'C2',
//                                   style: TextStyle(
//                                       color: Colors.orange.withOpacity(.77),
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Column(
//                             children: List.generate(
//                               length,
//                                   (index) => Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   SlotPlace(
//                                     name1: 'C1-00$index',
//                                     textName: '⏐',
//                                     name2: 'C1-0${index + 5}',
//                                     color: click == true
//                                         ? Colors.orange
//                                         : Color(0xff1f2248),
//                                   ),
//                                   SlotPlace(
//                                     name1: 'C2-00$index',
//                                     textName: '⏐',
//                                     name2: 'C2-0${index + 5}',
//                                     color: click == true
//                                         ? Colors.orange
//                                         : Color(0xff1f2248),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               Padding(
//                                 padding:
//                                 const EdgeInsets.only(top: 11, left: 35),
//                                 child: Text('Exit',
//                                     style: TextStyle(
//                                       color: Colors.grey.shade600,
//                                     )),
//                               ),
//                               Padding(
//                                   padding: const EdgeInsets.only(right: 170),
//                                   child: Text(
//                                     '→',
//                                     style: TextStyle(
//                                       fontSize: 32,
//                                       color: Colors.grey.shade600,
//                                     ),
//                                   )),
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 11),
//                                 child: Text('Exit',
//                                     style: TextStyle(
//                                       color: Colors.grey.shade600,
//                                     )),
//                               ),
//                               Text(
//                                 '→',
//                                 style: TextStyle(
//                                   fontSize: 32,
//                                   color: Colors.grey.shade600,
//                                 ),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding:
//               const EdgeInsets.only(bottom: 10, left: 5, right: 5, top: 0),
//               child: Column(
//                 children: [
//                   LogButton(
//                     text: 'Book',
//                     backgroundColor: Color(0xff4b78ff).withOpacity(.87),
//                     textColor: Colors.white,
//                     onPressed: () {},
//                     radius: 5,
//                     width: 355,
//                     high: 53,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
