import 'dart:convert';
import 'dart:math';

import 'package:cached_memory_image/cached_memory_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:rakna/core/utility/size.dart';
import 'package:rakna/presentation/screens/parking_detail.dart';
import '../../core/services/location_sevices.dart';
import '../../core/services/services_locator.dart';
import '../../core/utility/category.dart';
import '../../core/utility/color.dart';
import '../../core/utility/enums.dart';
import '../../core/utility/error_img.dart';
import '../../domain/entities/parking.dart';
import '../components/appbar.dart';
import '../components/circle_button.dart';
import '../components/category_card.dart';
import '../controller/get_parking_data_bloc/get_parking_data_bloc.dart';
import '../controller/get_parking_data_bloc/get_parking_data_state.dart';

class ParkingSelection extends StatefulWidget {
  ParkingSelection({Key? key, required this.userId, required this.userName, required this.userPhoneNumber, required this.userEmail}) : super(key: key);
  bool bookmark = true;
  final int userId;
  final String userName;
  final String  userPhoneNumber;
  final String  userEmail;
  @override
  State<ParkingSelection> createState() => _ParkingSelectionState();
}

class _ParkingSelectionState extends State<ParkingSelection> {
  double calculateDistance(
      {required lat1, required lon1, required lat2, required lon2}) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
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
    return BlocProvider(
      create: (context) => sl<ParkingBloc>()..add(GetParkingDataEvent()),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          backgroundColor: Colors.blue,
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 112.w, right: 112.w, top: 15.w),
                  child: Row(
                    children: [
                      Text(
                        'Nearby Parking',
                        style: TextStyle(color: Colors.white, fontSize: 18.sp),
                      ),
                      SizedBox(
                        height: 60.h,
                      )
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 800,
                  decoration: const BoxDecoration(
                    color: Color(0xffF5F5F5),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: BlocBuilder<ParkingBloc, ParkingState>(
                    builder: (context, state) {
                      switch (state.requestState) {
                        case RequestState.loading:
                          {
                            return Column(
                              children: [
                                SizedBox(height: 280.h),
                                const CircularProgressIndicator(),
                              ],
                            );
                          }
                        case RequestState.loaded:
                          {
                            _getMyLocation();
                            final parkingList = state.parking;
                            final nearestDistanceList =
                                List<Parking>.from(parkingList);
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
                            List park = state.parking;
                            return Column(
                              children: [
// CustomPaint(
//   painter: MyPainter(),
//   child: Container(height: 0),
// ),
                                SizedBox(height: 30.h),

                                Column(
                                    children:
                                        List.generate(nearestDistanceList.length, (index) {
                                  return InkWell(
                                    enableFeedback: true,
                                    onTap: () {
                                      print(park);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ParkingDetail(
                                                  parkId:
                                                      nearestDistanceList[index]
                                                          .parkId,
                                                  parkName:
                                                      nearestDistanceList[index]
                                                          .parkName,
                                                  parkLocation:
                                                      nearestDistanceList[index]
                                                          .parkLocation,
                                                  parkPrice:
                                                      nearestDistanceList[index]
                                                          .parkPrice,
                                                  parkImage:
                                                      nearestDistanceList[index]
                                                          .parkImage,
                                                  latitude:
                                                      nearestDistanceList[index]
                                                          .latitude,
                                                  longitude:
                                                      nearestDistanceList[index]
                                                          .longitude, userName: widget.userName, userPhoneNumber: widget.userPhoneNumber, userId: widget.userId, userEmail: widget.userEmail,
                                                )),
                                      );
                                    },
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(
                                          19.w, 19.w, 19.w, 0),
                                      padding: EdgeInsets.all(18.w),
// height: 100.h,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Color(0xffEDECEA),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor:
                                                Colors.blue.withOpacity(.1),
                                            radius: 30.r,
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                child: CachedMemoryImage(
                                                  uniqueKey: 'app://imageSelection/$index',
                                                  errorWidget:
                                                      const Text('Error'),
                                                  base64:
                                                      nearestDistanceList[index]
                                                                  .parkImage ==
                                                              'string'
                                                          ? errorImg
                                                          : nearestDistanceList[
                                                                  index]
                                                              .parkImage,
                                                  height: 200,
                                                  width: 200,
                                                  fit: BoxFit.cover,
                                                  placeholder: Container(
                                                    color: Colors.transparent,
                                                  ),
                                                )),
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            width: 150.w,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 160.w,
                                                  child: Text(
                                                    nearestDistanceList[index]
                                                        .parkName,
                                                    textScaleFactor: 1.45,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black
                                                          .withOpacity(.7),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 180,
                                                  child: Text(
                                                    nearestDistanceList[index]
                                                        .parkLocation,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black
                                                          .withOpacity(.8),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.centerRight,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                    height: 30,
                                                    width: 30,
                                                    child: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          widget.bookmark =
                                                              !widget.bookmark;
                                                        });
                                                      },
                                                      icon: Icon(
                                                        widget.bookmark == true
                                                            ? Icons
                                                                .bookmark_border
                                                            : Icons
                                                                .bookmark_added,
                                                        color: kPrimaryColor,
                                                      ),
                                                    )),
                                                SizedBox(height: 20.h),
                                                Text(
                                                  '${nearestDistanceList[index].parkPrice.toString().replaceAll('.0', '')}/Hr',
                                                  style: TextStyle(
                                                      fontSize: 14.sp),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                })),

                                SizedBox(
                                  height: 10.h,
                                ),
                                SizedBox(height: 30.h),
                              ],
                            );
                          }
                        case RequestState.error:
                          {
                            return Center(child: CircularProgressIndicator());
                          }
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MiniAppBarCustom extends StatelessWidget {
  const MiniAppBarCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 18.h, left: 18.h, right: 18.h),
      height: 60.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.7],
          colors: [
            kPrimaryLight,
            kPrimaryColor,
            // Colors.blue.shade500,
            // Colors.blue.shade900,
            // Color(0xff886ff2),
            // Color(0xff144272)
          ],
        ),
      ),
      child: Center(
        child: Text("Nearby Parking",
            style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w600)),
      ),
    );
  }
}
