import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rakna/data/data_source/remote_data_source.dart';
import 'package:rakna/presentation/components/LogButton_Widget.dart';
import 'package:rakna/presentation/screens/parking_timer.dart';
import 'package:rakna/presentation/screens/parking_timerState.dart';
import 'package:rakna/presentation/screens/reservation_ticket_screen.dart';

import '../../data/model/park_state_model.dart';

class TicketState extends StatefulWidget {
  const TicketState({Key? key, required this.userId}) : super(key: key);
  final int userId;

  @override
  State<TicketState> createState() => _TicketStateState();
}

class _TicketStateState extends State<TicketState>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30.h),
          TabBar(
              unselectedLabelColor: Colors.black,
              controller: tabController,
              isScrollable: true,
              labelPadding: EdgeInsets.symmetric(horizontal: 23.w),
              tabs: [
                SizedBox(
                    height: 50.h,
                    child: Center(
                        child: Text(
                      'Ongoing',
                      style: TextStyle(fontSize: 16.sp, color: Colors.black),
                    ))),
                SizedBox(
                    height: 50.h,
                    child: Center(
                        child: Text('Completed',
                            style: TextStyle(
                                fontSize: 16.sp, color: Colors.black)))),
                SizedBox(
                    height: 50.h,
                    child: Center(
                        child: Text('Canceled',
                            style: TextStyle(
                                fontSize: 16.sp, color: Colors.black)))),
              ]),
          Expanded(
              child: TabBarView(controller: tabController, children: [
            Ongoing(
                userId: widget.userId,
                parkSateApisOnGoing: ParkingRemoteDataSource()
                    .parkSateApis(state: 'ongoing', userId: widget.userId)),
            Completed(
              userId: widget.userId,
              parkSateApisCompleted: ParkingRemoteDataSource()
                  .parkSateApis(state: 'completed', userId: widget.userId),
            ),
            Canceled(
              userId: widget.userId,
              parkSateApisCanceled: ParkingRemoteDataSource()
                  .parkSateApis(state: 'canceled', userId: widget.userId),
            ),
          ])),
        ],
      ),
    );
  }
}

class Ongoing extends StatefulWidget {
  const Ongoing(
      {Key? key, required this.userId, required this.parkSateApisOnGoing})
      : super(key: key);
  final int userId;
  final Future<List<ParkStateModel>> parkSateApisOnGoing;

  @override
  State<Ongoing> createState() => _OngoingState();
}

class _OngoingState extends State<Ongoing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<List<ParkStateModel>>(
              future: widget.parkSateApisOnGoing,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Column(
                    children: [
                      SizedBox(height: 270.h),
                      Center(child: CircularProgressIndicator()),
                    ],
                  );
                } else if (snapshot.hasData) {
                  return Column(
                      children: List.generate(
                    snapshot.data!.length,
                    (index) => Container(
                        margin: EdgeInsets.fromLTRB(19.w, 10.w, 19.w, 15.h),
                        padding: EdgeInsets.all(18.w),
                        // height: 100.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xffEDECEA),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 70.w,
                                  height: 60.h,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(19.r),
                                    child: Image.asset(
                                        'assets/images/garage.png',
                                        height: 200.h,
                                        width: 200.w,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  width: 165.w,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 2.5.h),
                                        width: 160.w,
                                        child: Text(
                                          snapshot.data![index].parkName,
                                          textScaleFactor: 1.45,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black.withOpacity(.7),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 2.5.h),
                                        width: 180,
                                        child: Text(
                                          snapshot.data![index].location,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black.withOpacity(.8),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 2.5.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                                'E£${snapshot.data![index].parkPrice}',
                                                style:
                                                    TextStyle(fontSize: 14.sp)),
                                            Text(
                                                ' / ${snapshot.data![index].reservationDuration} Hours',
                                                style:
                                                    TextStyle(fontSize: 9.sp)),
                                            Container(
                                              margin:
                                                  EdgeInsets.only(left: 10.w),
                                              height: 18.h,
                                              width: 55.w,
                                              decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.r)),
                                              child: Center(
                                                child: Text(
                                                  'Now Active',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 9.sp),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        child: Text(''),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            const Divider(color: Colors.grey),
                            SizedBox(height: 8.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                LogButton(
                                    borderColor: Colors.blue,
                                    widget: const Text(
                                      'View Timer',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                    backgroundColor: Colors.white,
                                    textColor: Colors.white,
                                    onPressed: () {
                                      print('${(snapshot.data![index].startHour).toString().replaceRange(10, 19, '')} omar omar');
                                      print('${(DateTime.now()).toString().replaceRange(10, 26, '')} omar omar');


                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ParkingTimerState(
                                                      slotId: snapshot
                                                          .data![index].slotId,
                                                      hourSelected: snapshot
                                                          .data![index]
                                                          .reservationDuration,
                                                      parkSlotName: snapshot
                                                          .data![index]
                                                          .parkSlotName,
                                                      randomNumber: snapshot
                                                          .data![index]
                                                          .parkCode,
                                                      parkName: snapshot
                                                          .data![index]
                                                          .parkName,
                                                      parkLocation: snapshot
                                                          .data![index]
                                                          .location,
                                                      reservationDate: snapshot
                                                          .data![index]
                                                          .startHour,
                                                      startDateFormat: snapshot
                                                          .data![index]
                                                          .startHour,
                                                      endDateFormat: snapshot
                                                          .data![index].endHour,
                                                      latitude: snapshot
                                                          .data![index]
                                                          .latitude,
                                                      longitude: snapshot
                                                          .data![index]
                                                          .longitude,
                                                      combinedEndDateFormat:
                                                          DateTime.parse(
                                                              snapshot
                                                                  .data![index]
                                                                  .endHour), parkStateId:  snapshot.data![index].id,)));
                                    },
                                    radius: 20.r,
                                    width: 275.w,
                                    height: 35.h),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            )
                          ],
                        )),
                  ));
                } else {
                  return Center(child: Text('error'));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

class Completed extends StatefulWidget {
  const Completed(
      {Key? key, required this.userId, required this.parkSateApisCompleted})
      : super(key: key);
  final int userId;
  final Future<List<ParkStateModel>> parkSateApisCompleted;

  @override
  State<Completed> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<List<ParkStateModel>>(
              future: widget.parkSateApisCompleted,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Column(
                    children: [
                      SizedBox(height: 270.h),
                      Center(child: CircularProgressIndicator()),
                    ],
                  );
                } else if (snapshot.hasData) {
                  return Column(
                      children: List.generate(
                    snapshot.data!.length,
                    (index) => Container(
                      margin: EdgeInsets.fromLTRB(19.w, 19.w, 19.w, 0),
                      padding: EdgeInsets.all(18.w),
                      // height: 100.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xffEDECEA),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 70.w,
                                height: 60.h,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(19.r),
                                  child: Image.asset('assets/images/garage.png',
                                      height: 200,
                                      width: 200,
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                width: 180.w,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 2.5.h, horizontal: 10.w),
                                      width: 160.w,
                                      child: Text(
                                        snapshot.data![index].parkName,
                                        textScaleFactor: 1.45,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black.withOpacity(.7),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 2.5.h, horizontal: 10.w),
                                      width: 180,
                                      child: Text(
                                        snapshot.data![index].location,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black.withOpacity(.8),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.5.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                              'E£${snapshot.data![index].parkPrice}',
                                              style:
                                                  TextStyle(fontSize: 14.sp)),
                                          Text(
                                              ' / ${snapshot.data![index].reservationDuration} Hours',
                                              style: TextStyle(fontSize: 9.sp)),
                                          Container(
                                            margin: EdgeInsets.only(left: 10.w),
                                            height: 18.h,
                                            width: 55.w,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(5.r),
                                                border: Border.all(
                                                    color: CupertinoColors
                                                        .activeGreen)),
                                            child: Center(
                                              child: Text(
                                                'Completed',
                                                style: TextStyle(
                                                    color: CupertinoColors
                                                        .activeGreen,
                                                    fontSize: 9.sp),
                                              ),
                                            ),
                                          )
                                        ],
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
                                      child: Text(''),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          const Divider(color: Colors.grey),
                          SizedBox(height: 8.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              LogButton(
                                  borderColor: Colors.blue,
                                  widget: const Text(
                                    'View Ticket',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  backgroundColor: Colors.white,
                                  textColor: Colors.white,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ReservationTicket(
                                                    parkName: snapshot
                                                        .data![index].parkName,
                                                    reservationDate: snapshot
                                                        .data![index].startHour,
                                                    parkLocation: snapshot
                                                        .data![index].location,
                                                    hourSelected:
                                                        snapshot.data![index]
                                                            .reservationDuration,
                                                    startDateFormat: snapshot
                                                        .data![index].startHour,
                                                    endDateFormat: snapshot
                                                        .data![index].endHour,
                                                    parkSlotName: snapshot
                                                        .data![index]
                                                        .parkSlotName,
                                                    randomNumber: snapshot
                                                        .data![index]
                                                        .parkCode)));
                                  },
                                  radius: 20.r,
                                  width: 275.w,
                                  height: 35.h),
                            ],
                          )
                        ],
                      ),
                    ),
                  ));
                } else {
                  return Center(child: Text('error'));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

class Canceled extends StatefulWidget {
  final int userId;
  final Future<List<ParkStateModel>> parkSateApisCanceled;

  const Canceled(
      {Key? key, required this.userId, required this.parkSateApisCanceled})
      : super(key: key);

  @override
  State<Canceled> createState() => _CanceledState();
}

class _CanceledState extends State<Canceled> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<List<ParkStateModel>>(
              future: widget.parkSateApisCanceled,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Column(
                    children: [
                      SizedBox(height: 270.h),
                      const Center(child: CircularProgressIndicator()),
                    ],
                  );
                } else if (snapshot.hasData) {
                  return Column(
                      children: List.generate(
                          snapshot.data!.length,
                          (index) => Container(
                                margin:
                                    EdgeInsets.fromLTRB(19.w, 19.w, 19.w, 0),
                                padding: EdgeInsets.all(18.w),
                                // height: 100.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color(0xffEDECEA),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 65.w,
                                          height: 56.h,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(19.r),
                                            child: Image.asset(
                                                'assets/images/garage.png',
                                                height: 200,
                                                width: 200,
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          width: 180.w,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 2.5.h,
                                                    horizontal: 10.w),
                                                width: 160.w,
                                                child: Text(
                                                  snapshot
                                                      .data![index].parkName,
                                                  textScaleFactor: 1.45,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black
                                                        .withOpacity(.7),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 2.5.h,
                                                    horizontal: 10.w),
                                                width: 180,
                                                child: Text(
                                                  snapshot
                                                      .data![index].location,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black
                                                        .withOpacity(.8),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 2.5.h),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text(
                                                        'E£${snapshot.data![index].parkPrice}',
                                                        style: TextStyle(
                                                            fontSize: 14.sp)),
                                                    Text(
                                                        ' / ${snapshot.data![index].reservationDuration} Hours',
                                                        style: TextStyle(
                                                            fontSize: 9.sp)),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10.w),
                                                      height: 18.h,
                                                      width: 55.w,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.r),
                                                          border: Border.all(
                                                              color: CupertinoColors
                                                                  .destructiveRed)),
                                                      child: Center(
                                                        child: Text(
                                                          'Canceled',
                                                          style: TextStyle(
                                                              color: CupertinoColors
                                                                  .destructiveRed,
                                                              fontSize: 9.sp),
                                                        ),
                                                      ),
                                                    )
                                                  ],
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
                                                child: Text(''),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )));
                } else {
                  return Center(child: Text('error else'));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
