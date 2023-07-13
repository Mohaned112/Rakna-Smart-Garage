import 'package:cached_memory_image/cached_image_base64_manager.dart';
import 'package:cached_memory_image/cached_image_manager.dart';
import 'package:cached_memory_image/cached_memory_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:rakna/presentation/screens/slot_selection.dart';
import '../../core/utility/error_img.dart';
import '../../data/data_source/remote_data_source.dart';

class ParkingDetail extends StatefulWidget {
  const ParkingDetail({
    Key? key,
    required this.parkId,
    required this.parkName,
    required this.parkLocation,
    required this.parkPrice,
    required this.parkImage,
    required this.latitude,
    required this.longitude,
    required this.userName,
    required this.userPhoneNumber,
    required this.userId, required this.userEmail,
  }) : super(key: key);
  final String parkName;
  final String userEmail;
  final String parkLocation;
  final num parkPrice;
  final String parkImage;
  final int parkId;
  final double latitude;
  final double longitude;
  final String userName;
  final String userPhoneNumber;
  final int userId;

  @override
  State<ParkingDetail> createState() => _ParkingDetailState();
}

class _ParkingDetailState extends State<ParkingDetail>
    with TickerProviderStateMixin {
  final CachedImageManager _cachedImageManager =
      CachedImageBase64Manager.instance();

  late bool bookMark = true;

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);

    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.blue.shade200,
                    height: 300.h,
                    width: double.infinity,
                    child: CachedMemoryImage(
                      uniqueKey: 'app://imageHome/${widget.parkId}',
                      errorWidget: const Text('Error'),
                      base64: widget.parkImage == 'string'
                          ? errorImg
                          : widget.parkImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Text(
                          widget.parkName,
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.all(12.r),
                        child: Container(
                          width: 40.w,
                          height: 40.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.r),
                            color: Colors.transparent,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.bookmark_outlined,
                              color: Colors.transparent,
                              size: 28.r,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  // Row(
                  //   children: [
                  //     Padding(
                  //       padding: EdgeInsets.only(left: 8.w),
                  //       child: RatingBar.builder(
                  //         itemSize: 20.r,
                  //         initialRating: 3,
                  //         minRating: 1,
                  //         direction: Axis.horizontal,
                  //         allowHalfRating: true,
                  //         itemCount: 5,
                  //         itemPadding: EdgeInsets.symmetric(horizontal: 4),
                  //         itemBuilder: (context, _) => Icon(
                  //           Icons.star,
                  //           color: Colors.amber.shade500,
                  //         ),
                  //         onRatingUpdate: (rating) {
                  //           print(rating);
                  //         },
                  //       ),
                  //     ),
                  //     Text('(1,098)',
                  //         style: TextStyle(color: Colors.grey, fontSize: 11)),
                  //   ],
                  // ),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 15.w, top: 0.h, bottom: 7.h),
                      child: Row(
                        children: [
                          Text(
                            'Open ',
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.green),
                          ),
                          Text(
                            '- 24 hours',
                            style:
                                TextStyle(fontSize: 12.sp, color: Colors.grey),
                          ),
                        ],
                      )),
                  Container(
                    margin: EdgeInsets.fromLTRB(13.w, 19.w, 13.w, 0),
                    padding: EdgeInsets.all(5.w),
                    // height: 100.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xffEDECEA),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10.h, left: 20.w),
                            child: Text(
                              'Overview',
                              style: TextStyle(fontSize: 20.sp),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Center(
                                      child: Icon(
                                        Icons.location_on,
                                        size: 24,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  Text(
                                    'Cairo , Nasr City',
                                    style: TextStyle(fontSize: 15.sp),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.navigate_next,
                                color: Colors.grey.shade400,
                              )
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Icon(
                                      Icons.phone,
                                      size: 24,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  Text(
                                    'Phone : 01014588890',
                                    style: TextStyle(fontSize: 15.sp),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.navigate_next,
                                color: Colors.grey.shade400,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 23.h,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.07),
                        offset: Offset(0, -3),
                        blurRadius: 12)
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hour',
                        style: GoogleFonts.ptSans(
                            fontSize: 14, color: Colors.black),
                      ),
                      Text('${widget.parkPrice} E£',
                          style: GoogleFonts.ptSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black))
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () => MapsLauncher.launchCoordinates(
                            widget.latitude, widget.longitude),
                        child: Container(
                          width: 35.w,
                          height: 35.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.r),
                            color: CupertinoColors.activeGreen,
                          ),
                          child: Center(
                              child: Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 20.r,
                          )),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SlotSelection(
                                    parkId: widget.parkId,
                                    parkPrice: widget.parkPrice,
                                    parkName: widget.parkName,
                                    parkLocation: widget.parkLocation,
                                    latitude: widget.latitude,
                                    longitude: widget.longitude,
                                    userName: widget.userName,
                                    userPhoneNumber: widget.userPhoneNumber,
                                    userId: widget.userId, getParkingSlot:  ParkingRemoteDataSource().getParkingSlot1(widget.parkId), userEmail: widget.userEmail,),
                              ));
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: (BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                          )),
                          child: Text(
                            'Book Now',
                            style: GoogleFonts.ptSans(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
