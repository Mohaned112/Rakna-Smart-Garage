import 'dart:convert';
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_memory_image/cached_image_base64_manager.dart';
import 'package:cached_memory_image/cached_image_manager.dart';
import 'package:cached_memory_image/cached_memory_image.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rakna/garage_owner/components/select_photo_options_screen.dart';
import '../core/utility/error_img.dart';
import '../data/data_source/remote_data_source.dart';
import '../presentation/components/LogButton_Widget.dart';
import '../presentation/screens/google_map.dart';

class EditPark extends StatefulWidget {
   EditPark(
      {Key? key,
      required this.garageOwnerId,
      required this.parkRating,
      required this.parkId, required this.parkName, required this.parkLocation, required this.parkPrice, required this.parkImage, required this.latitude, required this.longitude})
      : super(key: key);
  final int garageOwnerId;
  final double parkRating;
  final int parkId;
   String parkName;
   String parkLocation;
   double parkPrice;
  final String parkImage;
  final double latitude;
  final double longitude;




  @override
  State<EditPark> createState() => _EditParkState();
}

class _EditParkState extends State<EditPark> {
  bool boolParkName = true;
  bool boolParkLocation = true;
  bool boolParkPrice = true;





  File? _image;
  Uint8List? bytes;
  String? img64;
  List<String> images = [];
  LatLng latLng = LatLng(0, 0);

  TextEditingController parkNameController = TextEditingController();
  TextEditingController parkLocationController = TextEditingController();
  TextEditingController parkPriceController = TextEditingController();



  void cacheImage() async {
    final CachedImageManager cachedImageManager = CachedImageBase64Manager.instance();
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
                  height: 84.h,
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
                            'Edit Your Parking',
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
                                  child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: _image == null?

                                          CachedMemoryImage(
                                            uniqueKey: 'app://editPark/${widget.parkId}',
                                            errorWidget: const Text('Error'),
                                            base64:  widget.parkImage,
                                            width: 200,
                                            fit: BoxFit.cover,
                                            placeholder: Container(color: Colors.blue.shade200),
                                          )
                                          // Image.memory(base64Decode(widget.parkImage))


                                              :Image(
                                              image: FileImage(_image!),
                                              width: 225,
                                              height: 180,
                                              fit: BoxFit.cover))),
                            ),
                          ),
                        ),
                        boolParkName == true
                            ? Padding(
                                padding: EdgeInsets.only(
                                    right: 22, left: 22, top: 40.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(widget.parkName,
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          color: Colors.black.withOpacity(.7),
                                        )),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                           boolParkName =
                                                !boolParkName;
                                          });
                                        },
                                        icon: Icon(Icons.edit,
                                            color: Colors.blue, size: 25.r)),
                                  ],
                                ),
                              )
                            : Padding(
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
                       boolParkLocation == true
                            ? Padding(
                                padding: EdgeInsets.only(
                                    right: 22, left: 22, top: 40.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(widget.parkLocation,
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            color:
                                                Colors.black.withOpacity(.7))),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                          boolParkLocation =
                                                !boolParkLocation;
                                          });
                                        },
                                        icon: Icon(Icons.edit,
                                            color: Colors.blue, size: 25.r)),
                                  ],
                                ),
                              )
                            : Padding(
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
                        boolParkPrice == true
                            ? Padding(
                                padding: EdgeInsets.only(
                                    right: 22, left: 22, top: 40.h, bottom: 30),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(widget.parkPrice.toString().replaceFirst('.0', ''),
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            color:
                                                Colors.black.withOpacity(.7))),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            boolParkPrice =
                                                !boolParkPrice;
                                          });
                                        },
                                        icon: Icon(Icons.edit,
                                            color: Colors.blue, size: 25.r)),
                                  ],
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.only(
                                    right: 22.w,
                                    left: 22.w,
                                    top: 30.h,
                                    bottom: 30.h),
                                child: TextFormField(

                                  controller: parkPriceController,
                                  decoration: InputDecoration(

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
                          child: LogButton(borderColor: Colors.transparent,
                              onPressed: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => MapScreen(garageOwnerId: widget.garageOwnerId)));
                                _navigateAndDisplayData(context);
                              },
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
                              height: 50),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 0.h, top: 40.h),
                          child: Center(
                            child: LogButton(borderColor: Colors.transparent,
                              backgroundColor: CupertinoColors.activeBlue,
                              textColor: Colors.white,
                              radius: 5.r,
                              width: 305.w,
                              onPressed: ()async {
                                print('$img64');


                                final currentContext = context;
                                if (await ParkingRemoteDataSource().putPark(
                                    parkName:boolParkName == false? parkNameController.text:widget.parkName,
                                    parkLocation:boolParkLocation == false?  parkLocationController.text:widget.parkLocation,
                                    parkPrice: boolParkPrice == false?  double.parse(parkPriceController.text):widget.parkPrice,
                                    garageOwnerId: widget.garageOwnerId,
                                    parkImage:_image != null? '$img64':widget.parkImage,
                                    parkId: widget.parkId,
                                    parkRating: widget.parkRating,
                                    latitude:latLng != LatLng(0, 0)? latLng.latitude:widget.latitude,
                                    longitude:latLng != LatLng(0, 0)? latLng.longitude:widget.longitude))
                                {
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





                              },
                              widget: const Text('Edit Park'),
                              height: 50.h,
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
    latLng = result;
  }
}
