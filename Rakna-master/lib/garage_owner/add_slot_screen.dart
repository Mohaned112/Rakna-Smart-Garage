import 'dart:convert';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rakna/data/data_source/remote_data_source.dart';
import 'package:rakna/garage_owner/components/select_photo_options_screen.dart';
import 'package:rakna/presentation/screens/sign_in_screen.dart';

import '../core/utility/color.dart';
import '../presentation/components/LogButton_Widget.dart';
import '../presentation/screens/navigation_bar.dart';
import 'components/set_photo_screen.dart';
import 'navigation_bar_garage_owner.dart';

class AddSlotScreen extends StatefulWidget {
  const AddSlotScreen({Key? key, required this.parkId}) : super(key: key);
  final int parkId;

  @override
  State<AddSlotScreen> createState() => _AddSlotScreenState();
}

class _AddSlotScreenState extends State<AddSlotScreen> {
  File? _image;
  Uint8List? bytes;
  String? img64;
  List<String> images = [];

  TextEditingController parkNameController = TextEditingController();
  TextEditingController parkLocationController = TextEditingController();
  TextEditingController parkPriceController = TextEditingController();






  @override
  Widget build(BuildContext context) {
    double height, width;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    Color color = Colors.blue.shade800;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
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
                          'Add New Park Slot',
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
                    height: height * .9,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(50.r))),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        Padding(
                          padding: EdgeInsets.only(
                            right: 22.w,
                            left: 22.w,
                            top: 30.h,
                          ),
                          child: TextFormField(
                            controller: parkNameController,
                            decoration: InputDecoration(
                              labelText: 'Park Slot Name',
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: 22.w,
                            left: 22.w,
                            top: 30.h,
                          ),
                          child: TextFormField(
                            controller: parkLocationController,
                            decoration: InputDecoration(
                              // labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,),
                                labelText: 'Park Location',
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54,
                                  fontSize: 13.sp,
                                ),
                                border: UnderlineInputBorder()),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: 22.w,
                            left: 22.w,
                            top: 30.h,
                          ),
                          child: TextFormField(
                            controller: parkPriceController,
                            decoration: InputDecoration(
                              // labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,),
                                labelText: 'Price',
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54,
                                  fontSize: 13.sp,
                                ),
                                border: UnderlineInputBorder()),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.h, top: 50.h),
                          child: LogButton(
                            backgroundColor: kPrimaryColor,
                            textColor: Colors.white,
                            radius: 15.r,
                            width: 305.w,borderColor: Colors.transparent,
                            onPressed: () {


                            },
                            widget: const Text('Add Park'),
                            height: 50.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
