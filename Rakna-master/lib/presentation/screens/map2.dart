// import 'dart:async';
// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart' as loc;
// import 'package:location/location.dart';
// import 'package:rakna/main.dart';
// import 'package:rakna/presentation/components/LogButton_Widget.dart';
// import 'package:rakna/presentation/screens/home_screen.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// import '../components/custom_text_form.dart';
//
// class TestScreenForMap extends StatefulWidget {
//   const TestScreenForMap({Key? key}) : super(key: key);
//
//   @override
//   State<TestScreenForMap> createState() => _TestScreenForMapState();
// }
//
// class _TestScreenForMapState extends State<TestScreenForMap> {
//   TextEditingController latController = TextEditingController();
//   TextEditingController lngController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Row(
//             //todo EXP CVV TextFormField
//             children: [
//               Expanded(
//                 child: CustomTextField(
//                   controller: latController,
//                   hintText: 'Lat',
//                   leftPadding: 13.w,
//                   rightPadding: 5,
//                   bottomPadding: 16.h,
//                   topPadding: 16.h,
//                 ),
//               ),
//               Expanded(
//                 child: CustomTextField(
//                   controller: lngController,
//                   hintText: 'Lng',
//                   leftPadding: 5.w,
//                   rightPadding: 13.w,
//                   bottomPadding: 16.h,
//                   topPadding: 16.h,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 200.h,
//           ),
//           LogButton(borderColor: Colors.transparent,
//               widget: Text('Next',style: TextStyle(color: Colors.white, fontSize: 16.sp)),
//               backgroundColor: Colors.blue,
//               textColor: Colors.white,
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => NavigationScreen(
//                         lat: double.parse(latController.text),
//                         lng: double.parse(lngController.text),
//                       ),
//                     ));
//               },
//               radius: 20,
//               width: 100,
//               height: 50)
//         ],
//       ),
//     );
//   }
// }
//
// class NavigationScreen extends StatefulWidget {
//   const NavigationScreen({Key? key, required this.lat, required this.lng})
//       : super(key: key);
//   final double lat;
//   final double lng;
//
//   @override
//   State<NavigationScreen> createState() => _NavigationScreenState();
// }
//
// class _NavigationScreenState extends State<NavigationScreen> {
//   final Completer<GoogleMapController?> _controller = Completer();
//   Map<PolylineId, Polyline> polyline = {};
//   PolylinePoints polylinePoints = PolylinePoints();
//   Location location = Location();
//   Marker? sourcePosition, destinationPosition;
//   loc.LocationData? _currentPosition;
//   LatLng curLocation = LatLng(23.0525, 72.5667);
//   StreamSubscription<loc.LocationData>? locationSubscription;
//
//   @override
//   void initState() {
//     super.initState();
//     getNavigation();
//     addMarker();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: sourcePosition == null
//             ? Center(
//                 child: CircularProgressIndicator(),
//               )
//             : Stack(
//                 children: [
//                   GoogleMap(
//                     zoomControlsEnabled: false,
//                     polylines: Set<Polyline>.of(polyline.values),
//                     initialCameraPosition: CameraPosition(
//                       target: curLocation,
//                       zoom: 16,
//                     ),
//                     markers: {sourcePosition!, destinationPosition!},
//                     onTap: (latLng) {
//                       print(latLng);
//                     },
//                     onMapCreated: (GoogleMapController controller) {
//                       _controller.complete(controller);
//                     },
//                   ),
//                   Positioned(
//                     top: 30,
//                     left: 15,
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.pushAndRemoveUntil(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => HomeScreen(),
//                             ),
//                             (route) => false);
//                       },
//                       child: Icon(Icons.arrow_back),
//                     ),
//                   ),
//                   Positioned(
//                       bottom: 10,
//                       right: 10,
//                       child: Container(
//                         width: 50,
//                         height: 50,
//                         decoration: BoxDecoration(
//                             shape: BoxShape.circle, color: Colors.blue),
//                         child: Center(
//                           child: IconButton(
//                               onPressed: () async {
//                                 await launchUrl(Uri.parse(
//                                     'google.navigation:q=${widget.lat}, ${widget.lng}AIzaSyBTrkeNvJHgQ7ylzeC-dqIvmolxvsiSv1A'));
//                               },
//                               icon: Icon(
//                                 Icons.navigate_next_outlined,
//                                 color: Colors.white,
//                               )
//
//                               ///todo up arrow
//                               ),
//                         ),
//                       )),
//                 ],
//               ));
//   }
//
//   getNavigation() async {
//     bool _serviceEnabled;
//     PermissionStatus _permissionGranded;
//     final GoogleMapController? controller = await _controller.future;
//     location.changeSettings(accuracy: loc.LocationAccuracy.high);
//     _serviceEnabled = await location.serviceEnabled();
//
//     if (!_serviceEnabled) {
//       _serviceEnabled = await location.requestService();
//       if (!_serviceEnabled) {
//         return;
//       }
//     }
//
//     _permissionGranded = await location.hasPermission();
//     if (_permissionGranded == PermissionStatus.denied) {
//       _permissionGranded = await location.requestPermission();
//       if (_permissionGranded != PermissionStatus.granted) {
//         return;
//       }
//     }
//
//     if (_permissionGranded == loc.PermissionStatus.granted) {
//       _currentPosition = await location.getLocation();
//       curLocation =
//           LatLng(_currentPosition!.latitude!, _currentPosition!.longitude!);
//       locationSubscription =
//           location.onLocationChanged.listen((LocationData currentLocation) {
//         controller?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
//           target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
//           zoom: 16,
//         )));
//         if (mounted) {
//           controller
//               ?.showMarkerInfoWindow(MarkerId(sourcePosition!.markerId.value));
//           setState(() {});
//           curLocation =
//               LatLng(currentLocation.latitude!, currentLocation.longitude!);
//           sourcePosition = Marker(
//             markerId: MarkerId(currentLocation.toString()),
//             icon:
//                 BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
//             position:
//                 LatLng(currentLocation.latitude!, currentLocation.longitude!),
//             infoWindow: InfoWindow(
//                 title: double.parse((getDistance(LatLng(widget.lat, widget.lng))
//                         .toStringAsFixed(2)))
//                     .toString()),
//             onTap: () {
//               print('marker tapped');
//             },
//           );
//         }
//       });
//       getDirections(LatLng(widget.lat, widget.lng));
//     }
//   }
//
//   getDirections(LatLng dst) async {
//     List<LatLng> polylineCoordinates = [];
//     List<dynamic> points = [];
//     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//       'AIzaSyBTrkeNvJHgQ7ylzeC-dqIvmolxvsiSv1A',
//       PointLatLng(curLocation.latitude, curLocation.longitude),
//       PointLatLng(curLocation.latitude, curLocation.longitude),
//       travelMode: TravelMode.driving,
//     );
//     if (result.points.isNotEmpty) {
//       result.points.forEach((PointLatLng point) {
//         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//         points.add({'lat': point.latitude, 'lng': point.longitude});
//       });
//     } else {
//       print(result.errorMessage);
//     }
//     addPolyLine(polylineCoordinates);
//   }
//
//   addPolyLine(List<LatLng> polylineCoordinates) {
//     PolylineId id = PolylineId('poly');
//     Polyline polyline = Polyline(
//       polylineId: id,
//       color: Colors.red,
//       points: polylineCoordinates,
//       width: 3,
//     );
//   }
//
//   double calculateDistance(lat1, lon1, lat2, lon2) {
//     var p = 0.017453292519943295;
//     var c = cos;
//     var a = 0.5 -
//         c((lat2 - lat1) * p) / 2 +
//         c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
//     return 12742 * asin(sqrt(a));
//   }
//
//   double getDistance(LatLng disposition) {
//     return calculateDistance(curLocation.latitude, curLocation.longitude,
//         disposition.latitude, disposition.longitude);
//   }
//
//   addMarker() {
//     setState(() {
//       sourcePosition = Marker(
//         markerId: MarkerId('source'),
//         position: curLocation,
//         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
//       );
//       destinationPosition = Marker(
//         markerId: MarkerId('destination'),
//         position: LatLng(widget.lat, widget.lng),
//         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
//       );
//     });
//   }
// }
