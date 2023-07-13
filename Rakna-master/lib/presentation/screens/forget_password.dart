import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:rakna/core/utility/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:rakna/presentation/components/LogButton_Widget.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    double height, width;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    Color color = Colors.blue.shade800;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 105.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 35.h, left: 12.w),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 1.h, right: 5.w),
                    child: InkWell(
                      onTap: () {},
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          CupertinoIcons.arrow_left_circle_fill,
                          color: Colors.white,
                          size: 40.r,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Reset Password',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: color,
            ),
            child: Container(
              height: height * .847,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(50.r))),
              child: SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: 22.w,
                      left: 22.w,
                      top: 30.h,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Please Enter Your E-mail',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "E-mail",
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        LogButton(borderColor: Colors.transparent,
                            widget: Text(
                              'Send Verification',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.sp),
                            ),
                            backgroundColor: Colors.blueAccent,
                            textColor: Colors.white,
                            onPressed: () {},
                            radius: 15.r,
                            width: 305.w,
                            height: 50.h)
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
