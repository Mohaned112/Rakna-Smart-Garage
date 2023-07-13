// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:rakna/presentation/screens/parking_timer_paypal.dart';
//
// import '../components/LogButton_Widget.dart';
//
// class SummaryScreen extends StatefulWidget {
//   const SummaryScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SummaryScreen> createState() => _SummaryScreenState();
// }
//
// class _SummaryScreenState extends State<SummaryScreen> {
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
//               child: Row(
//                 children: [
//                   IconButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: Icon(
//                       Icons.arrow_back,
//                       size: 30,
//                     ),
//                   ),
//                   Text(
//                     'Review Summary',
//                     style: TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Hero(
//               tag: 'summary',
//               child: Container(
//                 height: 315,
//                 width:350,
//                 margin: EdgeInsets.only(
//                   bottom: 0,
//                   top: 0,
//                   left: 20,
//                   right: 20,
//                 ),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.only(
//                       left: 15, right: 15, top: 25, bottom: 20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text('Parking Area'),
//                             Text('Nasr City Parking'), //TODO connect Api
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text('Location'),
//                             Text('Nasr City, Fair Square'), //TODO connect Api
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text('Vehicle'),
//                             Text('Toyota Land Cru (Car plate)'),
//                             //TODO connect Api
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text('Parking Spot'),
//                             Text('1st Floor (A05)'), //TODO connect Api
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text('Date'),
//                             Text('1 / 1 / 2023'), //TODO connect Api
//                             // Text('${today.toString().split(' ')[0]}'),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text('Duration'),
//                             Text('1 hours'), //TODO connect Api
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text('Hours'),
//                             Text('12:00 PM - 13:00 PM'), //TODO connect Api
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(
//                 bottom: 0,
//                 top: 25,
//                 left: 20,
//                 right: 20,
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(
//                     left: 15, right: 15, top: 20, bottom: 0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text('Amount'),
//                           Text('E£10.00'), //TODO connect Api
//                         ],
//                       ),
//                     ),
//                     // Padding(
//                     //   padding: const EdgeInsets.all(8.0),
//                     //   child: Row(
//                     //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //     children: [
//                     //       Text('Location'),
//                     //       Text('Nasr City, Fair Square'), //TODO connect Api
//                     //     ],
//                     //   ),
//                     // ),
//                     Divider(thickness: 1.5),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text('Total'),
//                           Text('E£10.00'),
//                           //TODO connect Api
//                         ],
//                       ),
//                     ),
//
//                     SizedBox(height: height * .025),
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(
//                 bottom: 0,
//                 top: 25,
//                 left: 20,
//                 right: 20,
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(
//                     left: 15, right: 15, top: 25, bottom: 20),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Icon(
//                           Icons.payment_rounded,
//                           color: Colors.blue.shade900,
//                           size: 40,
//                         ),
//                         Text('**** **** **** **** 7890'),
//                         TextButton(
//                             onPressed: () {},
//                             child: Text(
//                               'Change',
//                               style: TextStyle(color: Colors.blue.shade800),
//                             ),
//                         ),
//                       ],
//                     ),
//
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 35),
//             Center(
//               child: LogButton(
//                 widget: Text('Extend Parking Time',style: TextStyle(color: Colors.white, fontSize: 16.sp)),
//                 backgroundColor: Color(0xff067fd0),
//                 textColor: Colors.white,
//                 onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => ParkingTimer()));
//                   ///TODO navigation
//                 },
//                 radius: 5,
//                 width: width * .82,
//                 height: 53,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
