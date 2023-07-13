import 'dart:convert';
import 'dart:io';

import 'package:cached_memory_image/cached_image_base64_manager.dart';
import 'package:cached_memory_image/cached_image_manager.dart';
import 'package:cached_memory_image/cached_memory_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../team2/notification_screen.dart';
import '../data/data_source/remote_data_source.dart';
import '../data/model/garage_owner_data_model.dart';
import '../presentation/screens/start_screen.dart';
import 'components/select_photo_options_screen.dart';

class SettingScreenGarageOwner extends StatefulWidget {
  const SettingScreenGarageOwner(
      {Key? key,
      required this.name,
      required this.email,
      required this.garageOwnerUserId, required this.garageOwnerDataFuture})
      : super(key: key);
  final String name;
  final String email;
  final int garageOwnerUserId;

  final Future<List<GarageOwnerDataModel>> garageOwnerDataFuture ;



  @override
  State<SettingScreenGarageOwner> createState() =>
      _SettingScreenGarageOwnerState();
}

class _SettingScreenGarageOwnerState extends State<SettingScreenGarageOwner> {
  File? _image;
  Uint8List? bytes;
  String? img64;
  List<String> images = [];
  bool isImageHere = false;

  void cacheImage() async {
    final CachedImageManager cachedImageManager =
        CachedImageBase64Manager.instance();
    await cachedImageManager.clearCache();
  }

  Future _pickImage(ImageSource source) async {
    // int userId = widget.userID;
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      setState(() {
        _image = img;
        bytes = File(_image!.path).readAsBytesSync();
        img64 = base64Encode(bytes!);
        setState(() {
          isImageHere = true;
        });
        Navigator.pop(context);
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.pop(context);
    }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  void _showSelectPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.28,
          maxChildSize: 0.4,
          minChildSize: 0.28,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: SelectPhotoOptionsScreen(
                onTap: _pickImage,
              ),
            );
          }),
    );
  }

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isImageHere == true) {
      print('isImageHere $isImageHere    omar omar omar');
      cacheImage();
      ParkingRemoteDataSource().patchGarageOwnerData(
          garageOwnerId: widget.garageOwnerUserId, garageOwnerImage: img64!);
    }
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text('Profile',
              //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              SizedBox(
                height: 20.w,
              ),
              FutureBuilder<List<GarageOwnerDataModel>>(
                future: widget.garageOwnerDataFuture,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Column(
                        children: [
                          Container(
                              height: 120.w,
                              width: 120.w,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(60.r),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(60.r),
                                child: Image.asset(
                                    'assets/images/default-avatar-profile.jpg'),
                              )),
                          SizedBox(height: 5.w),
                          Text(
                            '',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 19.sp),
                          ),
                          Text(
                            '',
                            style: TextStyle(fontSize: 13.sp),
                          )
                        ],
                      ),
                    );
                  }

                  if (snapshot.hasData) {
                    return Center(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 120.w,
                                width: 120.w,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(60.r),
                                ),
                                child: _image == null
                                    ? ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(60.r),

                                        ///todo put avatar image
                                        child: snapshot.data![0]
                                                    .garageOwnerImage ==
                                                'strin'
                                            ? Image.asset(
                                                'assets/images/default-avatar-profile.jpg')
                                            : CachedMemoryImage(
                                                uniqueKey: 'app://garageOwnerImage/${snapshot.data![0].garageOwnerId}',
                                                errorWidget:
                                                    const Text('Error'),
                                                base64: snapshot
                                                    .data![0].garageOwnerImage,
                                                height: 200,
                                                width: 200,
                                                fit: BoxFit.cover,
                                                placeholder: Container(
                                                    color: Colors.transparent),
                                              ),
                                      )
                                    : ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(60.r),
                                        child: Image(
                                            image: FileImage(_image!),
                                            width: 225,
                                            height: 180,
                                            fit: BoxFit.cover)),
                              ),
                              Positioned(
                                top: 85.w,
                                left: 75.w,
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 33.w,
                                    width: 33.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: Color(0xff067fd0),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        _showSelectPhotoOptions(context);
                                      },
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 5.w),
                          Text(
                            snapshot.data![0].garageOwnerName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 19.sp),
                          ),
                          Text(
                            snapshot.data![0].email,
                            style: TextStyle(fontSize: 13.sp),
                          )
                        ],
                      ),
                    );
                  } else {
                    return Center(child: Text('Error request'));
                  }
                },
              ),
              SizedBox(
                height: 75.w,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Column(
                  children: [
                    // Padding(
                    //   padding: EdgeInsets.only(bottom: widget.bottom),
                    //   child: InkWell(
                    //     onTap: () {},
                    //     child: SizedBox(
                    //       height: 38.w,
                    //       child: Row(
                    //         children: [
                    //           Icon(
                    //             Icons.person_outline_rounded,
                    //             color: Colors.grey,
                    //             size: 27.r,
                    //           ),
                    //           SizedBox(width: 9.w),
                    //           Text(
                    //             'Edit Profile',
                    //             style: TextStyle(
                    //                 fontSize: 16.5.sp,
                    //                 fontWeight: FontWeight.w500),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.only(bottom: widget.bottom),
                    //   child: SizedBox(
                    //     height: 38.w,
                    //     child: InkWell(
                    //       onTap: () {},
                    //       child: Row(
                    //         children: [
                    //           Icon(
                    //             Icons.payment_rounded,
                    //             color: Colors.grey,
                    //             size: 27.r,
                    //           ),
                    //           SizedBox(width: 9.w),
                    //           Text(
                    //             'Payment',
                    //             style: TextStyle(
                    //                 fontSize: 16.5.sp,
                    //                 fontWeight: FontWeight.w500),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: SizedBox(
                        height: 38.w,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Notifications()));
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.notifications_none_outlined,
                                color: Colors.grey,
                                size: 27.r,
                              ),
                              SizedBox(width: 9.w),
                              Text(
                                'Notification',
                                style: TextStyle(
                                    fontSize: 16.5.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(bottom: widget.bottom),
                    //   child: SizedBox(
                    //     height: 38.w,
                    //     child: InkWell(
                    //       onTap: () {},
                    //       child: Row(
                    //         children: [
                    //           Icon(
                    //             Icons.security,
                    //             color: Colors.grey,
                    //             size: 27.r,
                    //           ),
                    //           SizedBox(width: 9.w),
                    //           Text(
                    //             'Security',
                    //             style: TextStyle(
                    //                 fontSize: 16.5.sp,
                    //                 fontWeight: FontWeight.w500),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: SizedBox(
                        height: 38.w,
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Icon(
                                Icons.help_center_outlined,
                                color: Colors.grey,
                                size: 27.r,
                              ),
                              SizedBox(width: 9.w),
                              Text(
                                'Help',
                                style: TextStyle(
                                    fontSize: 16.5.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(bottom: widget.bottom),
                    //   child: SizedBox(
                    //     height: 38.w,
                    //     child: InkWell(
                    //       onTap: () {},
                    //       child: Row(
                    //         children: [
                    //           Icon(
                    //             Icons.remove_red_eye_outlined,
                    //             color: Colors.grey,
                    //             size: 27.r,
                    //           ),
                    //           SizedBox(width: 9.w),
                    //           Text(
                    //             'Dark Theme',
                    //             style: TextStyle(
                    //                 fontSize: 16.5.sp,
                    //                 fontWeight: FontWeight.w500),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: SizedBox(
                        height: 38.w,
                        child: InkWell(
                          onTap: () {},
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GetStarted()));
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.logout,
                                  color: Colors.red,
                                  size: 27.r,
                                ),
                                SizedBox(width: 9.w),
                                Text(
                                  'Logout',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 16.5.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
