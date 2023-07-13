// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:rakna/presentation/screens/sign_in_screen.dart';
//
// import '../core/utility/color.dart';
// import '../presentation/components/LogButton_Widget.dart';
// import '../presentation/screens/navigation_bar.dart';
//
//
// class Parkdetails extends StatefulWidget {
//   const Parkdetails({Key? key}) : super(key: key);
//
//   @override
//   State<Parkdetails> createState() => _ParkdetailsState();
// }
//
// class _ParkdetailsState extends State<Parkdetails> {
//   @override
//   Widget build(BuildContext context) {
//     double height, width;
//     height = MediaQuery.of(context).size.height;
//     width = MediaQuery.of(context).size.width;
//     Color color =  Colors.blue.shade800;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Stack(
//           children: [
//             Column(
//               children: [
//                 Container(
//                   height: 105.h,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: color,
//                     borderRadius: const BorderRadius.only(
//                       bottomRight: Radius.circular(50),
//                     ),
//                   ),
//                   child: Padding(
//                     padding:  EdgeInsets.only(top: 35.h, left: 12.w),
//                     child: Row(
//                       children: [
//                         Padding(
//                           padding:  EdgeInsets.only(top: 1.h,right: 5.w),
//                           child: InkWell(
//                             onTap: () {},
//                             child: InkWell(
//                               onTap: () {
//                                 Navigator.pop(context);
//                               },
//                               child:  Icon(
//                                 CupertinoIcons.arrow_left_circle_fill,
//                                 color: Colors.white,
//                                 size: 40.r,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Text(
//                           'Add New Park',
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 18.sp,
//                               fontWeight: FontWeight.w500),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: color,
//                   ),
//                   child: Container(
//                     height: height * .9,
//                     decoration:  BoxDecoration(
//                         color: Colors.white,
//                         borderRadius:
//                         BorderRadius.only(topLeft: Radius.circular(50.r))),
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding:  EdgeInsets.only(
//                             right: 22.w, left: 22.w, top: 30.h,
//                           ),
//                           child: TextFormField(
//                             decoration:  InputDecoration(
//                               labelText: 'Park Location',
//                               labelStyle: TextStyle(
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.black54,
//                                 fontSize: 13.sp,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding:  EdgeInsets.only(
//                             right: 22.w, left: 22.w, top: 30.h,
//                           ),
//                           child: TextFormField(
//                             decoration:  InputDecoration(
//                               // labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,),
//                                 labelText: 'Price',
//                                 labelStyle: TextStyle(
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.black54,
//                                   fontSize: 13.sp,
//                                 ),
//                                 border: UnderlineInputBorder()),
//                           ),
//                         ),
//                         Padding(
//                           padding:  EdgeInsets.only(
//                             right: 22.w, left: 22.w, top: 30.h,
//                           ),
//                           child: TextFormField(
//                             decoration:  InputDecoration(
//                               // labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,),
//                                 labelText: 'Capacity',
//                                 labelStyle: TextStyle(
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.black54,
//                                   fontSize: 13.sp,
//                                 ),
//                                 border: UnderlineInputBorder()),
//                           ),
//                         ),
//
//
//                         Padding(
//                           padding:  EdgeInsets.only(bottom: 8.h, top: 50.h),
//                           child: LogButton(borderColor: Colors.transparent,
//                             widget: Text('Add Park',style: TextStyle(color: Colors.white, fontSize: 16.sp)),
//                             backgroundColor: kPrimaryColor,
//                             textColor: Colors.white,
//                             radius: 15.r,
//                             width: 305.w,
//                             height: 50.h,
//                             onPressed: () {
//                               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavigationBarScreen(userName: 'parking detail',),));
//                             },
//                           ),
//                         ),
//
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
