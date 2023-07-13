import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:rakna/garage_owner/finance.dart';
import 'package:rakna/presentation/screens/home_screen.dart';

import '../../data/data_source/remote_data_source.dart';
import '../components/LogButton_Widget.dart';

class ParkingTimerState extends StatefulWidget {
  const ParkingTimerState(
      {Key? key,
      required this.slotId,
      required this.hourSelected,
      required this.parkSlotName,
      required this.randomNumber,
      required this.parkName,
      required this.parkLocation,
      required this.reservationDate, required this.startDateFormat, required this.endDateFormat, required this.latitude, required this.longitude, required this.combinedEndDateFormat, required this.parkStateId})
      : super(key: key);
  final int hourSelected;
  final int slotId;
  final int parkStateId;
  final String parkSlotName;
  final String randomNumber;
  final String parkName;
  final String parkLocation;
  final String reservationDate;
  final String startDateFormat;
  final String endDateFormat;
  final double latitude;
  final double longitude;
  final DateTime combinedEndDateFormat;

  @override
  State<ParkingTimerState> createState() => _ParkingTimerStateState();
}

class _ParkingTimerStateState extends State<ParkingTimerState>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool isPlaying = false;
  DateTime now = DateTime.now();


  String get countText {
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed
        ? '${(controller.duration!.inHours % 60).toString().padLeft(2, '0')}:${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${(count.inHours % 60).toString().padLeft(2, '0')}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  double progress = 1.0;

  void notify() {
    if (countText == '00:00:05') {
      FlutterRingtonePlayer.playNotification();
    }
  }
  bool x = true;

  @override
  void initState() {
    super.initState();
    Duration remainingTime = widget.combinedEndDateFormat.difference(now);
    int hours = remainingTime.inHours;
    int minutes = remainingTime.inMinutes.remainder(60) + 10;
    int seconds = remainingTime.inSeconds.remainder(60);


    if(widget.startDateFormat.toString().replaceRange(10, 19, '') != (DateTime.now()).toString().replaceRange(10, 26, '') ){
      seconds = minutes = 0;
      x = false;
      hours = widget.hourSelected;
    }
    if (seconds < 0 || minutes < 0 || hours < 0) {
      ParkingRemoteDataSource().patchParkState(parkStateId:widget.parkStateId ,parkState:'completed' );
      seconds = minutes = hours = 0;
    }
    controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: seconds, minutes: minutes, hours: hours
            // widget.hourSelected

            ));
    controller.reverse(from: controller.value == 0 ? 1.0 : controller.value);
    controller.addListener(() {
      notify();
      if (controller.isAnimating) {
        setState(() {
          progress = controller.value;
        });
      } else {
        setState(() {
          progress = 1.0;
          isPlaying = false;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).popUntil((route){
          return route.settings.name == 'NavigationBarScreen';
        });
        return Future.value(false);
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 23.h),
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 300,
                        width: 300,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.grey.shade300,
                          value: progress,
                          strokeWidth: 6,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (controller.isDismissed) {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => SizedBox(
                                height: 300,
                                child: CupertinoTimerPicker(
                                    initialTimerDuration: controller.duration!,
                                    onTimerDurationChanged: (time) {
                                      setState(() {
                                        controller.duration = time;
                                      });
                                    }),
                              ),
                            );
                          }
                        },
                        child: AnimatedBuilder(
                          animation: controller,
                          builder: (BuildContext context, Widget? child) => Text(
                            x == true?  countText:'0${widget.hourSelected}:00:00',
                            style: const TextStyle(
                              fontSize: 60,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    // height: 315,
                    width: double.infinity,
                    margin: EdgeInsets.only(
                      bottom: 0.h,
                      top: 30.h,
                      left: 18.w,
                      right: 18.w,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 12.w,
                        right: 12.w,
                        top: 5.h,
                        bottom: 5.h,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(7.0.r),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Your Entry Code',
                                style: TextStyle(fontSize: 24.sp)),
                            SizedBox(height: 8.h),
                            Text(widget.randomNumber,
                                style: TextStyle(
                                    fontSize: 40.sp,
                                    color: Colors.blue.shade800)),
                            //TODO connect Api
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                Container(
                  // height: 315,
                  // width:350,
                  margin: EdgeInsets.only(
                    bottom: 10.h,
                    top: 10.h,
                    left: 18.w,
                    right: 18.w,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 12.w,
                      right: 12.w,
                      top: 17.h,
                      bottom: 17.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(7.0.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Parking Name'),
                              Text(widget.parkName),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(7.0.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Location'),
                              Text(widget.parkLocation),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Parking Spot'),
                              Text(widget.parkSlotName),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(7.0.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Date'),
                              Text(widget.reservationDate.replaceRange(11, 19, '').replaceFirst('T', '').replaceFirst('.000', '')),
                              // Text('${today.toString().split(' ')[0]}'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(7.0.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Duration'),
                              Text(widget.hourSelected.toString()),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(7.0.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Hours'),
                              Text('${widget.startDateFormat.toString().replaceRange(0, 10, '').replaceFirst('T', '').replaceFirst(':00', '')}  /  ${widget.endDateFormat.toString().replaceRange(0, 10, '').replaceFirst('T', '').replaceFirst(':00', '')}'), //TODO connect Api
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LogButton(borderColor: Colors.transparent,
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Direction',
                              style: TextStyle(color: Colors.white, fontSize: 16.sp)),
                          SizedBox(width: 5.w),
                          Icon(Icons.location_on)
                        ],
                      ),
                      backgroundColor: CupertinoColors.systemBlue.withOpacity(.9),
                      textColor: Colors.white,
                      onPressed: () {
                        MapsLauncher.launchCoordinates(widget.latitude, widget.longitude);

                      },
                      radius: 30.r,
                      width: 150.w,
                      height: 43.h,
                    ),
                    LogButton(borderColor: CupertinoColors.activeBlue,
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Home',
                              style: TextStyle(color: CupertinoColors.activeBlue, fontSize: 16.sp)),
                          SizedBox(width: 5.w),
                          const Icon(Icons.home,color: CupertinoColors.activeBlue,)
                        ],
                      ),
                      backgroundColor: Colors.white,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.of(context).popUntil((route){
                          return route.settings.name == 'NavigationBarScreen';
                        });

                      },
                      radius: 30.r,
                      width: 150.w,
                      height: 43.h,
                    ),
                  ],
                ),
                SizedBox(
                  height: 18.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
