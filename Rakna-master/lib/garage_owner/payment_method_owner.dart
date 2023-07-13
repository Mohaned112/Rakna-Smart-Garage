import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/presentation/screens/parking_timer.dart';

import '../presentation/components/LogButton_Widget.dart';
import 'add_payment_owner.dart';

class PaymentMethodOwner extends StatefulWidget {
  const PaymentMethodOwner({Key? key}) : super(key: key);

  @override
  State<PaymentMethodOwner> createState() => _PaymentMethodOwnerState();
}

class _PaymentMethodOwnerState extends State<PaymentMethodOwner> {
  late int selected = 200;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
                  // IconButton(
                  //     onPressed: () {
                  //       ///TODO open camera to detect Credit Card
                  //     },
                  //     icon: Icon(
                  //       CupertinoIcons.viewfinder,
                  //       size: 29.r,
                  //     ))
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
              //Index 0
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 0;
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
                              selected == 0 ? Colors.blue : Colors.transparent,
                          width: 1.8)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.paypal,
                            color: Colors.blue.shade900, size: 60),
                        const Text('Paypal'),
                        Icon(
                            selected == 0
                                ? Icons.circle
                                : Icons.circle_outlined,
                            color: Colors.blue.shade700),
                      ],
                    ),
                  ),
                ),
              ),

              //Index 1
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
                            color: Colors.blue.shade900, size: 60),
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
                            color: Colors.blue.shade900, size: 60),
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

              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddPaymentOwner()));
                },
                child: Container(
                  height: 44.h,
                  width: 365.w,
                  margin: EdgeInsets.only(
                    bottom: 0,
                    top: 15.h,
                    left: 0,
                    right: 0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(14.0.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_circle_outline,
                            color: Colors.blue.shade900, size: 20.r),
                        SizedBox(width: 4.w),
                        Text('Add New Card',
                            style: TextStyle(color: Colors.blue.shade900)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 135.h),
              Center(
                child: LogButton(borderColor: Colors.transparent,
                  widget: Text('Select',
                      style: TextStyle(color: Colors.white, fontSize: 16.sp)),
                  backgroundColor: Color(0xff067fd0),
                  textColor: Colors.white,
                  onPressed: () {
                    //TODO Navigator
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => ,
                    //   ),
                    // );
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
