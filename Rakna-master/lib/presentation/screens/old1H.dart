// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:rakna/presentation/screens/parking_detail.dart';
// import 'package:rakna/presentation/screens/parking_selection.dart';
//
// import '../components/Carousel Slider.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: SafeArea(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(
//                     top: 10, left: 20, right: 20, bottom: 20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Icon(
//                           CupertinoIcons.location_solid,
//                           size: 35,
//                         ),
//                         SizedBox(width: 5),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text('Location',
//                                 style: TextStyle(color: Colors.grey)),
//                             Text('Nasr City, Cairo, Egypt',
//                                 style: TextStyle(color: Colors.black))
//                           ],
//                         ),
//                       ],
//                     ),
//                     Icon(
//                       CupertinoIcons.bell,
//                       size: 30,
//                     )
//                   ],
//                 ),
//               ),
//               SliderImage(
//                 images: [
//                   'assets/images/garage.png',
//                   'assets/images/park1.jpg',
//                   'assets/images/rakna_logo.jpg'
//                 ],
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: width * .035),
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 90,
//                       height: 40,
//                       decoration: BoxDecoration(
//                           color: Colors.blue,
//                           borderRadius: BorderRadius.circular(7),
//                           boxShadow: [
//                             BoxShadow(
//                                 color: Colors.grey,
//                                 blurRadius: 2,
//                                 spreadRadius: .5,
//                                 blurStyle: BlurStyle.normal)
//                           ]),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.only(left: width * .019),
//                             child: Icon(
//                               CupertinoIcons.car_detailed,
//                               color: Colors.white,
//                             ),
//                           ),
//                           SizedBox(
//                             width: width * .015,
//                           ),
//                           Text(
//                             'Cars',
//                             style: TextStyle(color: Colors.white, fontSize: 20),
//                           )
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       width: width * .035,
//                     ),
//                     Container(
//                       width: 90,
//                       height: 40,
//                       decoration: BoxDecoration(
//                           color: Colors.blue.shade300,
//                           borderRadius: BorderRadius.circular(7),
//                           boxShadow: [
//                             BoxShadow(
//                                 color: Colors.grey.shade300,
//                                 blurRadius: 2,
//                                 spreadRadius: .5,
//                                 blurStyle: BlurStyle.normal)
//                           ]),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.only(left: width * .010),
//                             child: Icon(
//                               Icons.fire_truck,
//                               color: Colors.white,
//                             ),
//                           ),
//                           SizedBox(
//                             width: width * .015,
//                           ),
//                           Text(
//                             'Truck',
//                             style: TextStyle(color: Colors.white, fontSize: 20),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.only(left: 16,right: 16,top: 30,bottom: 15),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Recent Place',
//                       style: TextStyle(fontSize: 22),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         //TODO navigation
//                         // Navigator.push(context, MaterialPageRoute(builder: (context) => ,));
//                       },
//                       child: Row(
//                         children: [
//                           Text('See more',
//                               style:
//                                   TextStyle(fontSize: 17, color: Colors.grey)),
//                           Icon(
//                             Icons.arrow_forward_rounded,
//                             size: 25,
//                             color: Colors.grey,
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               SingleChildScrollView(
//                 physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.normal),
//                 scrollDirection: Axis.horizontal,
//                 padding: const EdgeInsets.symmetric(vertical: 3),
//                 child: Row( //todo horizontal list of parking
//                   children: [
//                     for(int i =0;i<3;i++)
//                     Padding(
//                       padding: const EdgeInsets.only(left: 19,right: 10),
//                       child: Container(
//                         height: 185,
//                         width: 195,
//                         decoration: BoxDecoration(
//                           color: Colors.blueGrey.shade50,
//                           borderRadius: BorderRadius.circular(15),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.shade400,
//                               blurRadius: 2,
//                               spreadRadius: .9,
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(
//                               height: 95,
//                               width: 240,
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(15),
//                                 child: Image.network(
//                                   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx6c0iMvY2O7OxusYIpEhdSGO2RCrLqtksaA&usqp=CAU',
//                                   width: double.infinity,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 8,right: 8,top: 8,bottom: 0),
//                               child: Row(
//                                 //todo title row has park name and small menu icon
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     'Nasr city garage',
//                                     style: TextStyle(
//                                         fontSize: 17.5,
//                                         color: Colors.blueGrey.shade800),
//                                   ),
//                                   InkWell(
//                                     onTap: () {
//                                       //TODO small menu bar on click
//                                     },
//                                     child: Icon(Icons.more_horiz),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 8),
//                               child: Text(
//                                 'Cairo, Nasr City',
//                                 style: TextStyle(
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding:  EdgeInsets.only(left: 10,right: 10,top: height *.024,bottom:height *.001 ),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text('2.5 KM',style: TextStyle(color: Colors.grey.shade600),),
//                                   Text('10.00/Hours',style: TextStyle(color: Colors.green,fontWeight: FontWeight.w600,fontSize: 15))
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding:
//                 const EdgeInsets.only(left: 16,right: 16,top: 30,bottom: 15),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Parking Space',
//                       style: TextStyle(fontSize: 22),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         //TODO navigation
//                         // Navigator.push(context, MaterialPageRoute(builder: (context) => ,));
//                       },
//                       child: Row(
//                         children: [
//                           Text('See more',
//                               style:
//                               TextStyle(fontSize: 17, color: Colors.grey)),
//                           Icon(
//                             Icons.arrow_forward_rounded,
//                             size: 25,
//                             color: Colors.grey,
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//
//             ],
//           ),
//         ));
//   }
// }
