import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReservationTicket extends StatefulWidget {
  const ReservationTicket({Key? key, required this.parkName, required this.reservationDate, required this.parkLocation, required this.hourSelected, required this.startDateFormat, required this.endDateFormat, required this.parkSlotName, required this.randomNumber}) : super(key: key);
 final String parkName;
 final String reservationDate;
 final String parkLocation;
 final int hourSelected;
 final String startDateFormat;
 final String endDateFormat;
 final String parkSlotName;
 final String randomNumber;



  @override
  State<ReservationTicket> createState() => _ReservationTicketState();
}

class _ReservationTicketState extends State<ReservationTicket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 200.h,
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
                    mainAxisAlignment: MainAxisAlignment.center,
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
            height: 300.h,
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Padding(
                  //   padding: EdgeInsets.all(7.0.r),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       const Text('Your Entry Code'),
                  //       Text(widget.randomNumber), //TODO connect Api
                  //     ],
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.all(7.0.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Parking Name'),
                        Text(widget.parkName), //TODO connect Api
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(7.0.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Location'),
                        Text(widget.parkLocation), //TODO connect Api
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Parking Spot'),
                        Text(widget.parkSlotName), //TODO connect Api
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(7.0.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Date'),
                        Text(widget.reservationDate.replaceRange(10, 19, '')), //TODO connect Api
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
                        //TODO connect Api
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(7.0.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Hours'),
                        Text('${widget.startDateFormat.toString().replaceRange(0, 11, '').replaceFirst(':00', '')}  /  ${widget.endDateFormat.toString().replaceRange(0, 11, '').replaceFirst(':00', '')}'), //TODO connect Api
                      ],
                    ),
                  ),

                  // Padding(
                  //   padding: EdgeInsets.all(7.0.r),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text('Hours'),
                  //       Text('12:00 PM - 13:00 PM'), //TODO connect Api
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
