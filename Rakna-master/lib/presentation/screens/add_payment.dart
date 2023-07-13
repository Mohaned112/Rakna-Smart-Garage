import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/presentation/components/LogButton_Widget.dart';
import 'package:rakna/presentation/components/custom_text_form.dart';
import 'package:rakna/presentation/screens/book_screen_OLD.dart';

import 'payment_method.dart';

class AddPayment extends StatelessWidget {
   AddPayment({super.key});
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      'Add Payment',
                      style: TextStyle(
                        fontSize: 27.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Container(
                  height: 152.h,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: SweepGradient(
                        center: AlignmentDirectional(1, -1),
                        startAngle: 1.7,
                        endAngle: 3,
                        colors: <Color>[
                          Colors.blue.shade700,
                          Colors.blue.shade700,
                          Colors.blue.shade800,
                          Colors.blue.shade800,
                          Colors.blue.shade700,
                          Colors.blue.shade700,

                          // Color(0xff148535),
                          // Color(0xff148535),
                          // Color(0xff0d6630),
                          // Color(0xff0d6630),
                          // Color(0xff148535),
                          // Color(0xff148535),
                        ],
                        stops: const <double>[
                          0.0,
                          0.3,
                          0.3,
                          0.7,
                          0.7,
                          1.0,
                        ]),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('VISA',
                              style: TextStyle(
                                  fontSize: 21.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          Text(
                            'visa Electron',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Text(
                        '****\t\t****\t\t****\t\t****\t\t 2193',
                        style: TextStyle(
                            fontSize: 21.5.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Card holder',
                                      style: TextStyle(
                                          fontSize: 10.5.sp, color: Colors.white),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Omar',
                                      style: TextStyle(
                                          fontSize: 10.5.sp, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Expires',
                                      style: TextStyle(
                                          fontSize: 10.5.sp, color: Colors.white),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      '07\t/\t23',
                                      style: TextStyle(
                                          fontSize: 10.5.sp, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.blue.shade400,
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                CustomTextField(controller: controller,///todo make controller for every one
                    hintText: 'Card Holder', leftPadding: 13.w, rightPadding: 13.w, bottomPadding: 16.h, topPadding: 16.h,
                ),
                CustomTextField(controller: controller,
                    hintText: 'Card number', leftPadding: 13.w, rightPadding: 13.w, bottomPadding: 16.h, topPadding: 16.h,
                ),
                Row(
                  //todo EXP CVV TextFormField
                  children: [
                    Expanded(
                        child: CustomTextField(controller: controller,
                            hintText: 'EXP', leftPadding: 13.w, rightPadding: 5, bottomPadding: 16.h, topPadding: 16.h,
                        ),
                    ),
                    Expanded(
                        child: CustomTextField(controller: controller,
                            hintText: 'CVV', leftPadding: 5.w, rightPadding: 13.w, bottomPadding: 16.h, topPadding: 16.h,
                        ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100.h,
                ),
                Center(
                  child: LogButton(borderColor: Colors.transparent,
                    widget: Text('add',style: TextStyle(color: Colors.white, fontSize: 16.sp),),
                    backgroundColor: Color(0xff067fd0),
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
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
      ),
    );
  }
}
