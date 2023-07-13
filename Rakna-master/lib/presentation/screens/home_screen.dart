import 'dart:convert';
import 'dart:math';

import 'package:cached_memory_image/cached_image_base64_manager.dart';
import 'package:cached_memory_image/cached_image_manager.dart';
import 'package:cached_memory_image/cached_memory_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

// import 'package:geolocator/geolocator.dart';
import 'package:rakna/core/utility/enums.dart';
import 'package:rakna/domain/entities/parking.dart';
import 'package:rakna/domain/usecase/get_parking_usecase.dart';
import 'package:rakna/presentation/screens/parking_detail.dart';
import 'package:rakna/presentation/screens/parking_selection.dart';

import '../../core/services/location_sevices.dart';
import '../../core/services/services_locator.dart';
import '../../core/utility/category.dart';
import '../../core/utility/color.dart';
import '../../core/utility/error_img.dart';
import '../../data/data_source/remote_data_source.dart';
import '../../data/model/bookmark_model.dart';
import '../../data/model/parking_model.dart';
import '../components/appbar.dart';
import '../components/category_card.dart';
import '../controller/get_parking_data_bloc/get_parking_data_bloc.dart';
import '../controller/get_parking_data_bloc/get_parking_data_state.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({Key? key, required this.userId, required this.userName, required this.userPhoneNumber, required this.getParking, required this.userEmail}) : super(key: key);
  final int userId;
  final String userName;
  final String  userPhoneNumber;
  final String  userEmail;




  final Future<List<ParkingModel>>  getParking ;





  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late bool bookmark = true;



  final CachedImageManager cachedImageManager = CachedImageBase64Manager.instance();


  @override
  void dispose() {

    super.dispose();
    _getMyLocation();
  }

  Future refresh() async {
    setState(() {
      print('x');
    });
  }

  double calculateDistance(
      {required lat1, required lon1, required lat2, required lon2}) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p) / 2 + c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  late LatLng myLocations = LatLng(30.085942552537484, 31.287274807691574);

  Future<void> _getMyLocation() async {
    LocationData myLocation = await LocationServices().getLocation();
    myLocations = LatLng(myLocation.latitude!, myLocation.longitude!);
  }

  @override
  void initState() {
    super.initState();
    _getMyLocation();
  }



  @override
  Widget build(BuildContext context) {
    // late double height = MediaQuery.of(context).size.height;
    // late double width = MediaQuery.of(context).size.width;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: BlocProvider(
        create: (context) => sl<ParkingBloc>()..add(GetParkingDataEvent()),
        child: Scaffold(
          body: Column(
            children: [
              AppBarCustom(
                image: 'assets/images/garage.png', userId: widget.userId, userName:widget.userName, userPhoneNumber: widget.userPhoneNumber, userEmail: widget.userEmail,
              ),
              Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Explore nearby parking",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            TextButton(
                              onPressed: () {
                                ///todo fix this screen
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ParkingSelection(userId: widget.userId, userName: widget.userName, userPhoneNumber: widget.userPhoneNumber, userEmail:widget.userEmail,),
                                    ));
                              },
                              child: Text(
                                "See All",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: kPrimaryColor),
                              ),
                            )
                          ],
                        ),
                      ),
        StreamBuilder<List<Parking>>(
          stream: Stream.periodic(Duration(seconds: 4))
              .asyncMap((_) => widget.getParking),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: InkWell(
                  enableFeedback: true,
                  onTap: () {},
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(19.w, 5.w, 19.w, 0),
                    padding: EdgeInsets.all(20.w),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xffEDECEA),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 9.h),
                          child: CircleAvatar(
                            backgroundColor: Colors.blue.withOpacity(.1),
                            radius: 30.r,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Container(
                                  color: Colors.transparent,
                                )),
                          ),
                        ),
                        SizedBox(height: 0.w),
                        Container(
                          margin: EdgeInsets.fromLTRB(0.w, 10.w, 0.w, 0),
                          alignment: Alignment.centerLeft,
                          width: 200.w,
                          child: Column(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 160.w,
                                child: Text(
                                  'Tap to Refresh',
                                  textScaleFactor: 1.45,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black.withOpacity(.7),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  '',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withOpacity(.8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //   alignment: Alignment.centerRight,
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       // SizedBox(
                        //       //     height: 30,
                        //       //     width: 30,
                        //       //     child: IconButton(
                        //       //         onPressed: () {},
                        //       //         icon: Icon(Icons.bookmark))),
                        //       SizedBox(height: 20.h),
                        //       Text(
                        //         '0/Hr',
                        //         style: TextStyle(fontSize: 14.sp),
                        //       )
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              );
            }

            if (!snapshot.hasData) {
              return Column(
                children: [
                  SizedBox(height: 40.h),
                  const CircularProgressIndicator(color: Colors.blue),
                ],
              );
            }
            _getMyLocation();
            final parkingList = snapshot.data!;
            final nearestDistanceList = List<Parking>.from(parkingList);
            nearestDistanceList.sort(
                  (a, b) => calculateDistance(
                lat1: myLocations.latitude,
                lon1: myLocations.longitude,
                lat2: a.latitude,
                lon2: a.longitude,
              ).compareTo(
                calculateDistance(
                  lat1: myLocations.latitude,
                  lon1: myLocations.longitude,
                  lat2: b.latitude,
                  lon2: b.longitude,
                ),
              ),
            );

            return SizedBox(
              height: 130,
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
                  scrollDirection: Axis.horizontal,
                  itemCount: nearestDistanceList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      enableFeedback: true,
                      onTap: () {
                        if(widget.userId != 0){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ParkingDetail(
                                  parkId: nearestDistanceList[index].parkId,
                                  parkName: nearestDistanceList[index].parkName,
                                  parkLocation:
                                  nearestDistanceList[index].parkLocation,
                                  parkPrice: nearestDistanceList[index].parkPrice,
                                  parkImage: nearestDistanceList[index].parkImage, latitude: nearestDistanceList[index].latitude, longitude: nearestDistanceList[index].longitude, userName: widget.userName, userPhoneNumber: widget.userPhoneNumber, userId: widget.userId, userEmail: widget.userEmail,)),
                          );
                        }

                      },
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(19.w, 5.w, 19.w, 0),
                        padding: EdgeInsets.all(20.w),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xffEDECEA),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 9.h),
                              child: CircleAvatar(
                                backgroundColor: Colors.blue.withOpacity(.1),
                                radius: 30.r,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: CachedMemoryImage(
                                    uniqueKey: 'app://imageHome/${nearestDistanceList[index].parkId
                                    }',
                                    errorWidget: const Text('Error'),
                                    base64:  nearestDistanceList[index]
                                        .parkImage == 'string' ? errorImg : nearestDistanceList[index].parkImage, height: 200,
                                    width: 200,
                                    fit: BoxFit.cover,
                                    placeholder: Container(color: Colors.transparent,),
                                  ),


                                ),
                              ),
                            ),
                            SizedBox(width: 15.w),
                            Container(
                              alignment: Alignment.centerLeft,
                              width: 150.w,
                              child: Column(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 160.w,
                                    child: Text(
                                      nearestDistanceList[index].parkName,
                                      textScaleFactor: 1.45,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black.withOpacity(.7),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 180,
                                    child: Text(
                                      nearestDistanceList[index].parkLocation,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black.withOpacity(.8),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    child:IconButton(
                                      onPressed: () {
                                        setState(() {
                                          ParkingRemoteDataSource().putBookMarks(isFavorite: true, userId: widget.userId, parkId: snapshot.data![index].parkId);

                                        });
                                      },
                                      icon: Icon(
                                        bookmark == true
                                            ? Icons.bookmark
                                            : Icons.bookmark_added,
                                        color: kPrimaryColor,
                                      ),
                                    ),

                                  ),
                                  SizedBox(height: 20.h),
                                  Text(
                                    '${nearestDistanceList[index].parkPrice.toString().replaceAll('.0', '')}/Hr',
                                    style: TextStyle(fontSize: 14.sp),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            );
          },
        ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

