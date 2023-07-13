import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:rakna/presentation/screens/payment_method.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:time/time.dart';

import '../components/LogButton_Widget.dart';

class ReservationParkingPlace extends StatefulWidget {
  ReservationParkingPlace(
      {Key? key,
      required this.slotId,
      required this.parkSlotName,
      required this.parkPrice,
      required this.parkForeignKey, required this.randomNumber, required this.parkName, required this.parkLocation, required this.latitude, required this.longitude, required this.userName, required this.userPhoneNumber, required this.userId, required this.userEmail})
      : super(key: key);
  final int slotId;
  final int parkForeignKey;
  final String parkSlotName;
  final double latitude;
  final double longitude;
  final String randomNumber;
  final String parkName;
  final String parkLocation;
  final String userName;
  final String userEmail;
  final String  userPhoneNumber;
  final int userId;
  int hour = 1;
  num parkPrice;

  @override
  State<ReservationParkingPlace> createState() =>
      _ReservationParkingPlaceState();
}

class _ReservationParkingPlaceState extends State<ReservationParkingPlace> {



  TextEditingController controller = TextEditingController();
  TextEditingController coupon = TextEditingController();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  TimeOfDay? pickTime;

  String? selectedDateTime;
  String? startHourAndEndHour;


  final formKey = GlobalKey<FormState>();
  late TextEditingController _date1 = TextEditingController();
  Duration startH = Duration();
  Duration endH = Duration();

  // final TextEditingController _date2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 10),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          size: 30,
                        ),
                      ),
                      Text(
                        'Reservation',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  Center(
                    child: Container(
                      // width: 380.w,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: 13.w, right: 13.w, top: 13.w, bottom: 13.w),
                          child: TableCalendar(
                            currentDay: _selectedDay,
                            firstDay: DateTime(2023, 1, 1),
                            lastDay: DateTime.utc(2030, 1, 1),
                            focusedDay: _focusedDay,
                            calendarFormat: _calendarFormat,
                            selectedDayPredicate: (day) {
                              // Use `selectedDayPredicate` to determine which day is currently selected.
                              // If this returns true, then `day` will be marked as selected.

                              // Using `isSameDay` is recommended to disregard
                              // the time-part of compared DateTime objects.
                              DateFormat dateFormatText = DateFormat('yyyy-MM-dd');
                               selectedDateTime = dateFormatText.format(_focusedDay);

                              if (_selectedDay == null) {
                                _selectedDay = DateTime.now();
                                _selectedDay = DateTime.tryParse(_selectedDay
                                    .toString()
                                    .replaceRange(16, 25, '00.000000'));
                                return isSameDay(_selectedDay, day);
                              } else {
                                return isSameDay(_selectedDay, day);
                              }

                              // return isSameDay(_selectedDay, day);
                            },
                            onDaySelected: (selectedDay, focusedDay) {
                              if (!isSameDay(_selectedDay, selectedDay)) {
                                // Call `setState()` when updating the selected day
                                setState(() {
                                  _selectedDay = selectedDay;
                                  _focusedDay = focusedDay;
                                });
                              }
                            },
                            onFormatChanged: (format) {
                              if (_calendarFormat != format) {
                                // Call `setState()` when updating calendar format
                                setState(() {
                                  _calendarFormat = format;
                                });
                              }
                            },
                            onPageChanged: (focusedDay) {
                              // No need to call `setState()` here

                              _focusedDay = focusedDay;
                            },
                          )),
                    ),
                  ),
                  // Text('${today.toString().split(' ')[0]}'),
                  SizedBox(
                    height: 7.h,
                  ), //todo hi up
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Start Hour',
                              style: TextStyle(
                                fontSize: 16.0.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              height: 50.h,
                              margin: EdgeInsets.only(
                                bottom: 0,
                                top: 7.h,
                                left: 0,
                                right: 0,
                              ),
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter the Date';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: _date1,
                                decoration: InputDecoration(
                                  hintText: '12:00 PM',
                                  fillColor: Colors.grey[200],
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: BorderSide.none,
                                  ),
                                  suffixIcon: InkWell(
                                    borderRadius: BorderRadius.circular(10.r),
                                    onTap: () async {
                                      pickTime = await showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now());

                                      // DateTime combinedStartDateFormat = new DateTime(
                                      //     _selectedDay!.year,
                                      //     _selectedDay!.month,
                                      //     _selectedDay!.day,
                                      //     pickTime!.hour,
                                      //     pickTime!.minute);
                                      // DateTime combinedEndDateFormat = new DateTime(
                                      //     _selectedDay!.year,
                                      //     _selectedDay!.month,
                                      //     _selectedDay!.day,
                                      //     pickTime!.hour + widget.hour,
                                      //     pickTime!.minute);
                                      // DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');
                                      // String formattedStartDateTime1 = dateFormat.format(combinedStartDateFormat);
                                      // String formattedEndDateTime1 = dateFormat.format(combinedEndDateFormat);



                                      setState(() {
                                        _date1.text = pickTime!
                                            .format(context)
                                            .toString();

                                      });

                                    },
                                    child:
                                        const Icon(Icons.access_time_rounded),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 35.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Hours',
                              style: TextStyle(
                                fontSize: 16.0.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              height: 50.h,
                              margin: EdgeInsets.only(
                                bottom: 0,
                                top: 7.h,
                                left: 0,
                                right: 0,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(7.0.r),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            widget.hour == 1
                                                ? widget.hour = 1
                                                : widget.hour--;
                                          });
                                        },
                                        child: Icon(CupertinoIcons.minus)),
                                    Text(
                                      '${widget.hour}',
                                      style: TextStyle(fontSize: 19),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            widget.hour++;
                                          });
                                        },
                                        icon: Icon(CupertinoIcons.add)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 0,
                      top: 14.h,
                      left: 0,
                      right: 0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 13.w, right: 13.w, top: 22.w, bottom: 22.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(7.0.r),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Duration'),
                                Text('${widget.hour}'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0.r),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Date'),
                                Text('$selectedDateTime'),
                              ],
                            ),
                          ),
                          // Padding(
                          //   padding: EdgeInsets.all(7.0.r),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       Text('Hours'),
                          //       Text('${startHourText1} - $endHourText1')
                          //
                          //       ///todo put the hours here
                          //     ],
                          //   ),
                          // ),
                          Divider(color: Colors.grey, thickness: .6),
                          Padding(
                            padding: EdgeInsets.all(7.0.r),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Amount'),
                                Text('E£${(widget.parkPrice * widget.hour)}'),
                              ],
                            ),
                          ),
                          SizedBox(height: 40.h),
                          Center(
                            child: LogButton(borderColor: Colors.transparent,
                              widget: Text('Next',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp)),
                              backgroundColor: Color(0xff067fd0),
                              textColor: Colors.white,
                              onPressed: () {

                              print('${widget.hour} oamr oamr hour selected');

                                DateTime reservationDate = new DateTime(
                                    _selectedDay!.year,
                                    _selectedDay!.month,
                                    _selectedDay!.day);

                                DateTime combinedStartDateFormat = new DateTime(
                                    _selectedDay!.year,
                                    _selectedDay!.month,
                                    _selectedDay!.day,
                                    pickTime!.hour,
                                    pickTime!.minute);
                                DateTime combinedEndDateFormat = new DateTime(
                                    _selectedDay!.year,
                                    _selectedDay!.month,
                                    _selectedDay!.day,
                                    pickTime!.hour + widget.hour,
                                    pickTime!.minute);
                                DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');
                                String formattedStartDateTime = dateFormat.format(combinedStartDateFormat);
                                String formattedEndDateTime = dateFormat.format(combinedEndDateFormat);

                                print('$formattedStartDateTime START');
                                print('$formattedEndDateTime END');
                                print('$combinedEndDateFormat ENDhour Date Time');

                                if (!formKey.currentState!.validate()) {
                                  final snackBar = SnackBar(
                                      content: Text('Submitting form'));
                                  _scaffoldkey.currentState!
                                      .showBottomSheet((context) => snackBar);
                                }

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PaymentMethod(
                                      startDateFormat: formattedStartDateTime,
                                      endDateFormat: formattedEndDateTime,
                                      coupon: coupon.text,
                                      priceAmount: (widget.parkPrice.toDouble() * widget.hour),
                                      parkSlotName: widget.parkSlotName,
                                      slotId: widget.slotId,
                                      hourSelected: widget.hour,
                                      parkId: widget.parkForeignKey,
                                      randomNumber:widget.randomNumber,
                                      parkName: widget.parkName,
                                      parkLocation: widget.parkLocation,
                                      reservationDate: reservationDate.toString(),
                                      latitude: widget.latitude,
                                      longitude: widget.longitude,
                                      combinedEndDateFormat: combinedEndDateFormat, userName: widget.userName, userPhoneNumber: widget.userPhoneNumber, userId: widget.userId, userEmail: widget.userEmail,
                                    ),
                                  ),
                                );
                              },
                              radius: 5.r,
                              width: 295.w,
                              height: 43.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
