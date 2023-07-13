import 'package:cached_memory_image/cached_memory_image.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/data/data_source/remote_data_source.dart';

import '../core/utility/color.dart';
import '../core/utility/error_img.dart';
import '../data/model/bookmark_model.dart';
import '../presentation/screens/parking_detail.dart';

class BookMark extends StatefulWidget {
  const BookMark({super.key, required this.userId, required this.userName, required this.userPhoneNumber, required this.getBookMark, required this.userEmail});
  final int userId;
  final String userEmail;
  final String userName;
  final String  userPhoneNumber;
  final Future<List<BookMarkModel>> getBookMark;
  @override
  _BookMarkState createState() => _BookMarkState();
}

class _BookMarkState extends State<BookMark>
     {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 110.w, right: 110.w, top: 15.w),
              child: Row(
                children: [
                  const Text(
                    'Your BookMark',
                    style: TextStyle(color: Colors.white, fontSize: 20),
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
              decoration: BoxDecoration(
                color: const Color(0xffF5F5F5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  // CustomPaint(
                  //   painter: MyPainter(),
                  //   child: Container(height: 0),
                  // ),
                  SizedBox(height: 30.h),
                  FutureBuilder<List<BookMarkModel>>(
                    future: widget.getBookMark,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 225.h),
                            const CircularProgressIndicator(),
                          ],
                        );
                      } else if (snapshot.hasData) {


                        return SizedBox(
                          height: 1000,
                          child: ListView.builder(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3.w, vertical: 3.h),
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  enableFeedback: true,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ParkingDetail(
                                                parkId: snapshot.data![index]
                                                    .park['parkId'],
                                                parkName: snapshot.data![index]
                                                    .park['parkName'],
                                                parkLocation: snapshot
                                                    .data![index]
                                                    .park['parkLocation'],
                                                parkPrice: snapshot.data![index]
                                                    .park['parkPrice'],
                                                parkImage: snapshot.data![index]
                                                    .park['parkImage'],
                                                latitude: snapshot.data![index]
                                                    .park['latitude'],
                                                longitude: snapshot.data![index]
                                                    .park['longitude'], userName: widget.userName, userPhoneNumber: widget.userPhoneNumber, userId:widget.userId, userEmail: widget.userEmail,
                                              )),
                                    );
                                  },
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  child: Container(
                                    margin:
                                        EdgeInsets.fromLTRB(19.w, 5.w, 19.w, 0),
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
                                            backgroundColor:
                                                Colors.blue.withOpacity(.1),
                                            radius: 30.r,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: CachedMemoryImage(
                                                uniqueKey: 'app://imageBookMark/${snapshot.data![index].bookMarkId
                                                }',
                                                errorWidget:
                                                    const Text('Error'),
                                                base64:
                                                    snapshot.data![index].park[
                                                                'parkImage'] ==
                                                            'string'
                                                        ? errorImg
                                                        : snapshot.data![index]
                                                            .park['parkImage'],
                                                height: 200,
                                                width: 200,
                                                fit: BoxFit.cover,
                                                placeholder: Container(
                                                  color: Colors.transparent,
                                                ),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 160.w,
                                                child: Text(
                                                  snapshot.data![index]
                                                      .park['parkName'],
                                                  textScaleFactor: 1.45,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black
                                                        .withOpacity(.7),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 180,
                                                child: Text(
                                                  snapshot.data![index]
                                                      .park['parkLocation'],
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                height: 30,
                                                width: 30,
                                                child: IconButton(
                                                  onPressed: () {
                                                    setState(() {

                                                      ParkingRemoteDataSource().deleteBookMark(bookMarkId: snapshot.data![index].bookMarkId);
                                                    });
                                                  },
                                                  icon: Icon(
                                                    Icons.bookmark_added,
                                                    color: kPrimaryColor,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 20.h),
                                              Text(
                                                '${snapshot.data![index].park['parkPrice'].toString().replaceAll('.0', '')}/Hr',
                                                style:
                                                    TextStyle(fontSize: 14.sp),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        );
                      } else {
                        return Center(child: Text(''));
                      }
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(height: 1000.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
