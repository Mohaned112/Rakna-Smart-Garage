import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/presentation/screens/parking_timer.dart';

import '../../core/utility/custom_paypal.dart';
import '../../data/data_source/remote_data_source.dart';
import '../components/LogButton_Widget.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({
    Key? key,
    required this.startDateFormat,
    required this.endDateFormat,
    required this.coupon,
    required this.priceAmount,
    required this.parkSlotName,
    required this.slotId,
    required this.hourSelected,
    required this.parkId,
    required this.randomNumber,
    required this.parkName,
    required this.parkLocation,
    required this.reservationDate,
    required this.latitude,
    required this.longitude,
    required this.combinedEndDateFormat, required this.userName, required this.userPhoneNumber, required this.userId, required this.userEmail,
  }) : super(key: key);

  final String startDateFormat;
  final String endDateFormat;
  final String userEmail;
  final String coupon;
  final double priceAmount;
  final String parkSlotName;
  final int slotId;
  final int hourSelected;
  final int parkId;
  final String randomNumber;
  final String parkName;
  final String parkLocation;
  final String reservationDate;
  final double latitude;
  final double longitude;
  final DateTime combinedEndDateFormat;

  final String userName;
  final String  userPhoneNumber;
  final int userId;

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  late int selected = 200;
  var rng = Random();
  List<String> randomNumber = [
    '8020',
    '9024',
    '2209',
    '3024',
    '1605',
    '1812',
    '1106',
    '1018',
    '2705',
    '2608',
    '2604',
    '1501',
    '1060',
    '9040',
    '2080',
    '2901',
    '2308',
    '1508',
    '9070',
    '2201',
    '9090',
    '2803',
    '1211',
    '2105',
    '2060',
    '2104',
    '2307',
    '2110',
    '1301',
    '2311',
    '1305',
    '1040',
    '1070',
    '2404',
    '2104',
    '1401',
    '2611',
    '8021',
    '2605',
    '2508',
  ];

  @override
  Widget build(BuildContext context) {
    String finalRandomNumber = randomNumber[rng.nextInt(19)];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(18.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          size: 30.r,
                        ),
                      ),
                      Text(
                        'Payment Method',
                        style: TextStyle(
                          fontSize: 27.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 13.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Choose Payment Methods',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 1;
                  });
                },
                child: Container(
                  height: 80.h,
                  width: 365.w,
                  margin: EdgeInsets.only(
                    bottom: 0,
                    top: 15.h,
                    left: 0,
                    right: 0,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color:
                              selected == 1 ? Colors.blue : Colors.transparent,
                          width: 1.8)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.paypal,
                            color: Colors.blue.shade700, size: 60),
                        const Text('Paypal'),
                        Icon(
                            selected == 1
                                ? Icons.circle
                                : Icons.circle_outlined,
                            color: Colors.blue.shade700),
                      ],
                    ),
                  ),
                ),
              ),

              //Index 2
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 2;
                  });
                },
                child: Container(
                  height: 80.h,
                  width: 365.w,
                  margin: EdgeInsets.only(
                    bottom: 0,
                    top: 15.h,
                    left: 0,
                    right: 0,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color:
                              selected == 2 ? Colors.blue : Colors.transparent,
                          width: 1.8)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(CupertinoIcons.money_pound_circle,
                            color: Colors.blue.shade700, size: 60),
                        Text('Pay Cash'),
                        Icon(
                            selected == 2
                                ? Icons.circle
                                : Icons.circle_outlined,
                            color: Colors.blue.shade700),
                      ],
                    ),
                  ),
                ),
              ),

              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => AddPayment()));
              //   },
              //   child: Container(
              //     height: 44.h,
              //     width: 365.w,
              //     margin: EdgeInsets.only(
              //       bottom: 0,
              //       top: 15.h,
              //       left: 0,
              //       right: 0,
              //     ),
              //     decoration: BoxDecoration(
              //       color: Colors.grey[200],
              //       borderRadius: BorderRadius.circular(25.r),
              //     ),
              //     child: Padding(
              //       padding: EdgeInsets.all(14.0.r),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Icon(Icons.add_circle_outline,
              //               color: Colors.blue.shade700, size: 20.r),
              //           SizedBox(width: 4.w),
              //           Text('Add New Card',
              //               style: TextStyle(color: Colors.blue.shade700)),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(height: 280.h),
              Center(
                child: LogButton(
                  borderColor: Colors.transparent,
                  widget: Text('Book',
                      style: TextStyle(color: Colors.white, fontSize: 16.sp)),
                  backgroundColor: Color(0xff067fd0),
                  textColor: Colors.white,
                  onPressed: () async {
                    if (selected == 1) {
                      if (kDebugMode) {
                        print(
                            '$finalRandomNumber this the random number paypal test 1 ');
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UsePaypal1(
                            sandboxMode: true,
                            clientId:
                                "AW1TdvpSGbIM5iP4HJNI5TyTmwpY9Gv9dYw8_8yW5lYIbCqf326vrkrp0ce9TAqjEGMHiV3OqJM_aRT0",
                            secretKey:
                                "EHHtTDjnmTZATYBPiGzZC_AZUfMpMAzj2VZUeqlFUrRJA_C0pQNCxDccB5qoRQSEdcOnnKQhycuOWdP9",
                            returnURL: "https://samplesite.com/return",
                            cancelURL: "https://samplesite.com/cancel",
                            transactions: [
                              {
                                "amount": {
                                  "total": '${widget.priceAmount}',
                                  "currency": "USD",
                                  "details": {
                                    "subtotal": '${widget.priceAmount}',
                                    "shipping": '0',
                                    "shipping_discount": 0
                                  }
                                },
                                "description":
                                    "The payment transaction description.",
                                // "payment_options": {
                                //   "allowed_payment_method":
                                //       "INSTANT_FUNDING_SOURCE"
                                // },
                                "item_list": {
                                  "items": [
                                    {
                                      "name": "A demo product",
                                      "quantity": 1,
                                      "price": '${widget.priceAmount}',
                                      "currency": "USD"
                                    }
                                  ],

                                  // shipping address is not required though
                                  "shipping_address": {
                                    "recipient_name": "Jane Foster",
                                    "line1": "Travis County",
                                    "line2": "",
                                    "city": "Austin",
                                    "country_code": "US",
                                    "postal_code": "73301",
                                    "phone": "+00000000",
                                    "state": "Texas"
                                  },
                                }
                              }
                            ],
                            note: "Contact us for any questions on your order.",
                            onSuccess: (Map params) async {
                              // navigatorKey?.currentState?.pushNamed('/');
                              print('$params omar success');
return params;
                              print("onSuccess: $params");
                            },
                            onError: (error) {
                              print("onError: $error");
                            },
                            onCancel: (params) {
                              print('cancelled: $params');
                            },
                            slotId: widget.slotId,
                            hourSelected: widget.hourSelected,
                            parkSlotName: widget.parkSlotName,
                            startDateFormat: widget.startDateFormat,
                            endDateFormat: widget.endDateFormat,
                            finalRandomNumber: finalRandomNumber,
                            parkId: widget.parkId,
                            randomNumber: finalRandomNumber,
                            parkName: widget.parkName,
                            parkLocation: widget.parkLocation,
                            reservationDate: widget.reservationDate,
                            latitude: widget.latitude,
                            longitude: widget.longitude,
                            combinedEndDateFormat: widget.combinedEndDateFormat, priceAmount: widget.priceAmount, userName: widget.userName, userPhoneNumber: widget.userPhoneNumber, userId:widget.userId, userEmail: widget.userEmail,
                          ),
                        ),
                      );
                    } else if (selected == 2) {
                      print(
                          '${widget.parkSlotName}\n${widget.startDateFormat} \n${widget.endDateFormat}');
                      if (kDebugMode) {
                        print(
                            '$finalRandomNumber this the random number cash test 1');
                      }
                      // if(widget.startDateFormat.toString().replaceRange(10, 19, '') != (DateTime.now()).toString().replaceRange(10, 26, '') ){
                      //   seconds = minutes = 0;
                      //   x = false;
                      //   hours = widget.hourSelected;
                      // }
                      final currentContext = context;
                      if (await ParkingRemoteDataSource().putReservationData(
                            id: widget.slotId,
                            parkingSlotName: widget.parkSlotName,
                            startHour: widget.startDateFormat,
                            endHour: widget.endDateFormat,
                            isAvailable: false,
                            randomNumber: finalRandomNumber,
                            parkForeignKey: widget.parkId,
                          ) &&
                          await ParkingRemoteDataSource().postParkSateApis(
                              parkName: widget.parkName,
                              location: widget.parkLocation,
                              parkState: 'ongoing',
                              userName: widget.userName,
                              parkCode: finalRandomNumber,
                              startHour: widget.startDateFormat,
                              endHour: widget.endDateFormat,
                              userPhoneNumber: widget.userPhoneNumber,
                              parkSlotName: widget.parkSlotName,
                              parkPrice: widget.priceAmount,
                              reservationDuration: widget.hourSelected,
                              userForeignKey: widget.userId,
                              isCash: true, latitude: widget.latitude, longitude: widget.longitude, slotID: widget.slotId)) {
                        print('${widget.hourSelected} oamrommromaf hour selected ');
                    await   ParkingRemoteDataSource().patchPark(parkId: widget.parkId, amount: widget.priceAmount) == true ?print('all done patch amount'):print('error patch amount');
                        Future.delayed(Duration.zero,
                            () => AwesomeDialog(
                                  context: currentContext,
                                  animType: AnimType.leftSlide,
                                  headerAnimationLoop: false,
                                  dialogType: DialogType.success,
                                  showCloseIcon: true,
                                  title: 'Success',
                                  desc: 'Payment Success',
                                  btnOkOnPress: () {
                                    debugPrint('OnClcik');
                                  },
                                ).show());
                        Future.delayed(const Duration(milliseconds: 1600), () {
                          Navigator.pushReplacement(
                            currentContext,
                            MaterialPageRoute(
                              builder: (context) => ParkingTimer(
                                slotId: widget.slotId,
                                hourSelected: widget.hourSelected,
                                parkSlotName: widget.parkSlotName,
                                randomNumber: finalRandomNumber,
                                parkName: widget.parkName,
                                parkLocation: widget.parkLocation,
                                reservationDate: widget.reservationDate,
                                startDateFormat: widget.startDateFormat,
                                endDateFormat: widget.endDateFormat,
                                latitude: widget.latitude,
                                longitude: widget.longitude,
                                combinedEndDateFormat:
                                    widget.combinedEndDateFormat,
                              ),
                            ),
                          );
                        });
                      } else {
                        print('Error occurred. Please try again.');
                        Future.delayed(
                            Duration.zero,
                            () => AwesomeDialog(
                                  context: currentContext,
                                  dialogType: DialogType.error,
                                  animType: AnimType.rightSlide,
                                  headerAnimationLoop: false,
                                  title: 'Error',
                                  desc: 'Error occurred. Please try again.',
                                  btnOkOnPress: () {},
                                  btnOkIcon: Icons.cancel,
                                  btnOkColor: Colors.red,
                                ).show());
                      }
                    }
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
    );
  }
}
