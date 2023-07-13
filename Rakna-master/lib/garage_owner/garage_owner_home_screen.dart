import 'dart:convert';

import 'package:cached_memory_image/cached_memory_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rakna/data/data_source/remote_data_source.dart';
import 'package:rakna/data/repository/parking_repository.dart';
import 'package:rakna/domain/usecase/get_garage_owner_parking_usecase.dart';
import '../core/services/services_locator.dart';
import '../core/utility/color.dart';
import '../core/utility/enums.dart';
import '../core/utility/error_img.dart';
import '../data/model/garage_owner_parking_data_model.dart';
import '../domain/entities/garage_owner_parking_data.dart';
import '../presentation/controller/get_garage_owner_parking_bloc/get_garage_owner_parking_bloc.dart';
import 'add_parking.dart';
import 'edit_parking.dart';
import 'slot_detail.dart';
import 'category_card_garage_owner.dart';

class GarageOwnerHomeScreen extends StatefulWidget {
  const GarageOwnerHomeScreen({Key? key}) : super(key: key);

  @override
  State<GarageOwnerHomeScreen> createState() => _GarageOwnerHomeScreenState();
}

class _GarageOwnerHomeScreenState extends State<GarageOwnerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MiniAppBarCustom(),
              const Padding(
                padding: EdgeInsets.only(
                    right: 15, left: 15, top: 30, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Your Parking',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 19,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0; i < 3; i++)
                      Padding(
                        padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: CategoryCardOwner(
                            parkingName: 'Parking Name',
                            parkingLocation: 'Parking Location',
                            parkImage:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9FvFe1zRItStF3sa5SoJ6T9LihZcKSEGLdQ&usqp=CAU',
                            parkPrice: '10/Hours',
                            nextScreen: const Text('sddsdd'),
                            widthCard: 0.w,
                            bookmark: true,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            spreadRadius: .5,
                            blurRadius: 1.5,
                            offset: Offset(0, .5))
                      ]),
                  width: 45,
                  height: 45,
                  child: Center(
                    child: InkWell(
                      onTap: () {},
                      child: Icon(
                        CupertinoIcons.add,
                        color: Colors.blue.shade900,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MiniAppBarCustom extends StatelessWidget {
  const MiniAppBarCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 18.h, left: 18.h, right: 18.h),
        height: 80.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.r),
            bottomRight: Radius.circular(20.r),
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.1, 0.7],
            colors: [
              kPrimaryLight,
              kPrimaryColor,
              // Colors.blue.shade500,
              // Colors.blue.shade900,
              // Color(0xff886ff2),
              // Color(0xff144272)
            ],
          ),
        ),
        child: TextFormField(
          onTap: () {
            // showSearch(context: context, delegate: SearchUser());
            // setState(() {
            //
            // });
          },
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
              size: 26,
            ),

            // helperText: "Search your topic",
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: "Search your park",
            labelStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            isDense: true,
          ),
        ),
      ),
    );
  }
}

class MyCustomUI extends StatefulWidget {
  const MyCustomUI({super.key, required this.garageOwnerId, required this.garageOwnerParkingFuture});

  @override
  _MyCustomUIState createState() => _MyCustomUIState();
  final Future<List<GarageOwnerParkingModel>> garageOwnerParkingFuture ;
  final int garageOwnerId;

}

class _MyCustomUIState extends State<MyCustomUI>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _animation2;


  @override
  void initState() {
    super.initState();



    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _animation2 = Tween<double>(begin: 0, end: -5).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => GetGarageOwnerParkingBloc(
          garageOwnerParkingUseCase: GetGarageOwnerParkingUseCase(
              ParkingRepository(ParkingRemoteDataSource())),
          garageOwnerId: widget.garageOwnerId)
        ..add(GetGarageOwnerParkingEvent()),
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 120.w, right: 120.w, top: 15.w),
                child: Row(
                  children: [
                    const Text(
                      'Your Parking',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      height: 60.h,
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 800,
                decoration: const BoxDecoration(
                  color: Color(0xffF5F5F5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child:
                  FutureBuilder<List<GarageOwnerParkingModel>>(
                    future: widget.garageOwnerParkingFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // Show a progress indicator if the data is not yet loaded
                        return Column(
                          children: [
                            SizedBox(height: 280.h),
                            const CircularProgressIndicator(),
                          ],
                        );
                      } else if (snapshot.hasData) {
                        // If data has been loaded successfully, render the UI using the data from snapshot
                        final List park = snapshot.data![0].parkingData;
                        return Column(
                          children: [
                            // CustomPaint(
                            //   painter: MyPainter(),
                            //   child: Container(height: 0),
                            // ),
                            SizedBox(height: 30.h),

                            Column(
                                children: List.generate(park.length, (index) {
                                  return Opacity(
                                    opacity: _animation.value,
                                    child: Transform.translate(
                                      offset: Offset(0.01, _animation2.value),
                                      child: InkWell(
                                        enableFeedback: true,
                                        onTap: () {
                                          print(park);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>SlotsDetail(parkId: park[index]['parkId'], parkPrice:park[index]['parkPrice'], getParkingSlot:   ParkingRemoteDataSource().getParkingSlot1(park[index]['parkId'])
                                                  ,),
                                              ));
                                        },
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        child: Container(
                                          margin:
                                          EdgeInsets.fromLTRB(19.w, 19.w, 19.w, 0),
                                          padding: EdgeInsets.all(18.w),
                                          // height: 100.h,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Color(0xffEDECEA),
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              CircleAvatar(
                                                backgroundColor:
                                                Colors.blue.withOpacity(.1),
                                                radius: 30.r,
                                                child: ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.circular(50),
                                                    child:CachedMemoryImage(
                                                      uniqueKey: 'app://image/$index',
                                                      errorWidget: const Text('Error'),
                                                      base64:  park[index]['parkImage'],
                                                      height: 200,
                                                      width: 200,
                                                      fit: BoxFit.cover,
                                                      placeholder: Container(color: Colors.transparent
                                                    ),


                                                    // Image.memory(base64Decode(park[index]['parkImage'] == 'string'?errorImg:park[index]['parkImage']),
                                                      // '',
                                                      // height: 200,
                                                      // width: 200,
                                                      // fit: BoxFit.cover,
                                                    )),
                                              ),
                                              // SizedBox(width: 5.w),
                                              Container(
                                                alignment: Alignment.topLeft,
                                                width: 150.w,
                                                child: Column(
                                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 160.w,
                                                      child: Text(
                                                        park[index]['parkName'],
                                                        textScaleFactor: 1.45,
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w600,
                                                          color: Colors.black
                                                              .withOpacity(.7),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 180,
                                                      child: Text(
                                                        park[index]['parkLocation'],
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w400,
                                                          color: Colors.black
                                                              .withOpacity(.8),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.centerRight,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      height: 30,
                                                      width: 30,
                                                      child: Builder(
                                                          builder: (context) {
                                                            return   PopUpMenu(icon: Icon(Icons.settings), menuList:  [
                                                              PopupMenuItem(child: ListTile(
                                                                leading: const Icon(Icons.edit,color: Colors.blue),
                                                                title: const Text('Edit'),
                                                                onTap: () {
                                                                  Navigator.push(context, MaterialPageRoute(builder: (context) =>EditPark(garageOwnerId: widget.garageOwnerId, parkRating: park[index]['parkingRating'], parkId: park[index]['parkId'], parkName: park[index]['parkName'], parkLocation: park[index]['parkLocation'], parkPrice: park[index]['parkPrice'], parkImage: park[index]['parkImage'], latitude: park[index]['latitude'], longitude: park[index]['longitude'],)));
                                                                } ,
                                                              )),
                                                            ]);
                                                          }
                                                      ),

                                                    ),
                                                    SizedBox(height: 20.h),
                                                    Text('${park[index]['parkPrice'].toString().replaceAll('.0', '')}/Hr',style: TextStyle(fontSize: 14.sp),)
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );})
                            ),


                            SizedBox(
                              height: 10.h,
                            ),
                            Center(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border:
                                    Border.all(color: Colors.blue, width: 2),
                                    borderRadius: BorderRadius.circular(40),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: .5,
                                          blurRadius: 1.5,
                                          offset: Offset(0, .5))
                                    ]),
                                width: 45,
                                height: 45,
                                child: Center(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddPark(garageOwnerId: widget.garageOwnerId)));
                                    },
                                    child: Icon(
                                      CupertinoIcons.add,
                                      color: Colors.blue.shade700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 30.h),
                          ],
                        );
                      } else {
                        // If an error occurs or data is not loaded yet, show an error message
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  )


              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class MyPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint_1 = Paint()
//       ..color = Colors.blue
//       ..style = PaintingStyle.fill;
//
//     Path path_1 = Path()
//       ..moveTo(0, 0)
//       ..lineTo(size.width * .1, 0)
//       ..cubicTo(size.width * .05, 0, 0, 20, 0, size.width * .08);
//
//     Path path_2 = Path()
//       ..moveTo(size.width, 0)
//       ..lineTo(size.width * .9, 0)
//       ..cubicTo(
//           size.width * .95, 0, size.width, 20, size.width, size.width * .08);
//
//     Paint paint_2 = Paint()
//       ..color = Color(0xffF57752)
//       ..strokeWidth = 1
//       ..style = PaintingStyle.stroke;
//
//     Path path_3 = Path()
//       ..moveTo(0, 0)
//       ..lineTo(size.width, 0);
//
//     canvas.drawPath(path_1, paint_1);
//     canvas.drawPath(path_2, paint_1);
//     canvas.drawPath(path_3, paint_2);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }



class PopUpMenu extends StatelessWidget {
  const PopUpMenu({Key? key, required this.menuList, this.icon}) : super(key: key);
  final List<PopupMenuEntry>menuList;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        itemBuilder: (context)=>menuList,icon: icon);
  }
}


// ParkingRemoteDataSource().getParkingGarageOwner(widget.garageOwnerId),