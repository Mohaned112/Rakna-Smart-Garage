import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_memory_image/cached_image_base64_manager.dart';
import 'package:cached_memory_image/cached_image_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:rakna/data/data_source/remote_data_source.dart';
import 'package:rakna/garage_owner/components/select_photo_options_screen.dart';
import 'package:rakna/presentation/screens/sign_in_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../core/utility/color.dart';
import '../presentation/components/LogButton_Widget.dart';
import '../presentation/screens/google_map.dart';
import '../presentation/screens/map2.dart';
import '../presentation/screens/navigation_bar.dart';
import 'components/set_photo_screen.dart';
import 'navigation_bar_garage_owner.dart';
import 'package:maps_launcher/maps_launcher.dart';

class AddPark extends StatefulWidget {
  const AddPark({Key? key, required this.garageOwnerId}) : super(key: key);
  final int garageOwnerId;

  @override
  State<AddPark> createState() => _AddParkState();
}

class _AddParkState extends State<AddPark> {
  File? _image;
  Uint8List? bytes;
  String? img64;
  List<String> images = [];
  LatLng latLng = LatLng(0, 0);

  TextEditingController parkNameController = TextEditingController();
  TextEditingController parkLocationController = TextEditingController();
  TextEditingController parkPriceController = TextEditingController();

  void cacheImage() async {
    final CachedImageManager cachedImageManager =
        CachedImageBase64Manager.instance();
    await cachedImageManager.clearCache();
  }

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      setState(() {
        _image = img;
        bytes = File(_image!.path).readAsBytesSync();
        img64 = base64Encode(bytes!);
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
  Widget build(BuildContext context) {
    Color color = Colors.blue.shade800;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 85.h,
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
                        InkWell(
                          onTap: () {
                            print(latLng);
                          },
                          child: Text(
                            'Add New Parking',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500),
                          ),
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
                    height: 605.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(50.r))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        InkWell(
                          onTap: () => _showSelectPhotoOptions(context),
                          child: Center(
                            child: Container(
                              height: 180,
                              width: 225,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white),
                              child: Center(
                                  child: _image == null
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.asset(
                                              'assets/images/Default_Image_Thumbnail.png',
                                              width: 225,
                                              height: 180,
                                              fit: BoxFit.cover))
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image(
                                              image: FileImage(_image!),
                                              width: 225,
                                              height: 180,
                                              fit: BoxFit.cover))),
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
                            controller: parkNameController,
                            decoration: InputDecoration(
                              labelText: 'Park Name',
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
                              right: 22.w, left: 22.w, top: 30.h, bottom: 30.h),
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
                        Center(
                          child: latLng == LatLng(0, 0)
                              ? LogButton(
                                  onPressed: () {
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => MapScreen(garageOwnerId: widget.garageOwnerId)));
                                    _navigateAndDisplayData(context);
                                  },
                                  borderColor: Colors.transparent,
                                  widget: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Select Park location'),
                                      SizedBox(width: 1),
                                      Icon(CupertinoIcons.location_solid,
                                          color: Colors.white),
                                    ],
                                  ),
                                  backgroundColor: CupertinoColors.activeBlue,
                                  textColor: Colors.white,
                                  radius: 40,
                                  width: 185,
                                  height: 50)
                              : LogButton(
                                  onPressed: () {
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => MapScreen(garageOwnerId: widget.garageOwnerId)));
                                    _navigateAndDisplayData(context);
                                  },
                                  borderColor: Colors.transparent,
                                  widget: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Select Park location'),
                                      SizedBox(width: 1),
                                      Icon(CupertinoIcons.check_mark,
                                          color: Colors.white),
                                    ],
                                  ),
                                  backgroundColor: CupertinoColors.activeGreen,
                                  textColor: Colors.white,
                                  radius: 40,
                                  width: 185,
                                  height: 50),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.h, top: 40.h),
                          child: Center(
                            child: LogButton(
                              backgroundColor: CupertinoColors.activeBlue,
                              textColor: Colors.white,
                              radius: 5.r,
                              width: 305.w,
                              onPressed: () async {
                                print(img64);

                                if (latLng != LatLng(0.0, 0.0) &&
                                    img64 != null) {
                                  final currentContext = context;
                                  if (await ParkingRemoteDataSource().postPark(
                                      parkName: parkNameController.text,
                                      parkLocation: parkLocationController.text,
                                      parkPrice: double.parse(
                                          parkPriceController.text),
                                      garageOwnerId: widget.garageOwnerId,
                                      parkImage: '$img64',
                                      latitude: latLng.latitude,
                                      longitude: latLng.longitude)) {
                                    Future.delayed(
                                        Duration.zero,
                                        () => AwesomeDialog(
                                              context: currentContext,
                                              animType: AnimType.leftSlide,
                                              headerAnimationLoop: false,
                                              dialogType: DialogType.success,
                                              showCloseIcon: true,
                                              title: 'Success',
                                              desc: 'Method Success',
                                              btnOkOnPress: () {
                                                debugPrint('OnClcik');
                                              },
                                            ).show());
                                    Future.delayed(
                                        const Duration(milliseconds: 1600), () {
                                      cacheImage();
                                      Navigator.pop(context);
                                    });
                                    Future.delayed(
                                        const Duration(milliseconds: 2000), () {
                                      cacheImage();
                                      Navigator.pop(context);
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
                                              desc:
                                                  'Error occurred. Please try again.',
                                              btnOkOnPress: () {},
                                              btnOkIcon: Icons.cancel,
                                              btnOkColor: Colors.red,
                                            ).show());
                                  }
                                }
                              },
                              widget: const Text('Add Park'),
                              height: 50.h,
                              borderColor: Colors.transparent,
                            ),
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

  _navigateAndDisplayData(BuildContext context) async {
    final LatLng result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => MapScreen()));
    setState(() {
      latLng = result;
    });
  }
}
