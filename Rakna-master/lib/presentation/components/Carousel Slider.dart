// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
//
//
//
// class SliderImage extends StatelessWidget {
//    SliderImage({Key? key,required this.images}) : super(key: key);
//    List<String> images ;
//
//   @override
//   Widget build(BuildContext context) {
//     final List<Widget> imageSliders = images
//         .map((item) => Container(
//       margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 20),
//       child: ClipRRect(
//           borderRadius: const BorderRadius.all(Radius.circular(12)),
//           child: Stack(
//             children: <Widget>[
//               Image.asset(item, fit: BoxFit.cover, width: 1000.0),
//               Positioned(
//                 bottom: 0.0,
//                 left: 0.0,
//                 right: 0.0,
//                 child: Container(
//                   decoration: const BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [
//                         Color.fromARGB(200, 0, 0, 0),
//                         Color.fromARGB(0, 0, 0, 0)
//                       ],
//                       begin: Alignment.bottomCenter,
//                       end: Alignment.topCenter,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           )),
//     ))
//         .toList();
//     return CarouselSlider(
//       options: CarouselOptions(
//         autoPlay: true,
//         aspectRatio: 1.8,
//         viewportFraction: 0.9,
//         enlargeCenterPage: true,
//         enlargeStrategy: CenterPageEnlargeStrategy.height,
//       ),
//       items: imageSliders,
//     );
//   }
// }
