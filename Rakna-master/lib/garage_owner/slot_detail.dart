import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/data/data_source/remote_data_source.dart';
import 'package:rakna/domain/usecase/get_parking_slot_usecase.dart';
import 'package:rakna/presentation/controller/get_parking_slots_bloc/parking_slots_bloc.dart';

import '../core/services/services_locator.dart';
import '../core/utility/enums.dart';
import '../data/model/parking_slot_model.dart';
import '../presentation/components/LogButton_Widget.dart';
import '../presentation/components/custom_text_form.dart';
import '../presentation/components/slot-place.dart';
import 'add_slot_screen.dart';
import 'components/add_slot_component.dart';

class SlotsDetail extends StatefulWidget {
  SlotsDetail({Key? key, required this.parkId, required this.parkPrice, required this.getParkingSlot})
      : super(key: key);
  int parkId;
  num parkPrice;

final  Stream<List<ParkingSlotModel>>  getParkingSlot ;

  @override
  State<SlotsDetail> createState() => _SlotsDetailState();
}

class _SlotsDetailState extends State<SlotsDetail> {
  TextEditingController parkSlotNameController = TextEditingController();

  int onSelectedIndex = -1;

  // bool click = false;
  Color primaryColor = Color(0xff007fff);
  Color mainColor = Colors.blue;
  Color selectedColor = Colors.orange.shade700;
  Color bookedColor = Color(0xff990000);
  late int slotId;
  late String parkingSlotName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ParkingSlotBloc(GetParkingSlotUseCase(sl()), widget.parkId)
            ..add(GetParkingSlotDataEvent()),
      child: GestureDetector(
        onTap: () {
          setState(() {
            onSelectedIndex = -1;
          });
        },
        child: Scaffold(

          body: SafeArea(
            child: Padding(
              padding:
                  EdgeInsets.only(bottom: 20.w, left: 3.w, right: 3.w, top: 10.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            size: 28.r,
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
                      height: 15.w,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: 5.h, left: 10.w, right: 10.w, top: 15.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 0, right: 5.w),
                                  child: Container(
                                    height: 18.w,
                                    width: 18.w,
                                    decoration: BoxDecoration(
                                        color: mainColor,
                                        border: Border.all(color: primaryColor),
                                        borderRadius: BorderRadius.circular(2)),
                                  ),
                                ),
                                Text(
                                  'Available',
                                  style: TextStyle(color: Colors.black),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 25.w, right: 5.w),
                                  child: Container(
                                    height: 18.w,
                                    width: 18.w,
                                    decoration: BoxDecoration(
                                        color: selectedColor,
                                        borderRadius: BorderRadius.circular(2)),
                                  ),
                                ),
                                Text('Selected',
                                    style: TextStyle(color: Colors.black)),
                                Padding(
                                  padding: EdgeInsets.only(left: 25.w, right: 5.w),
                                  child: Container(
                                    height: 18.w,
                                    width: 18.w,
                                    decoration: BoxDecoration(
                                        color: bookedColor,
                                        borderRadius: BorderRadius.circular(2.r)),
                                  ),
                                ),
                                Text('Booked',
                                    style: TextStyle(color: Colors.black))
                              ],
                            ),
                          ),
                          SizedBox(height: 30.h),
                          StreamBuilder<List<ParkingSlotModel>> (
                            stream: widget.getParkingSlot,
                            builder: (context, state) {
                             if(!state.hasData){
                               return Column(
                                 children: [
                                   SizedBox(height: 200.h),
                                   CircularProgressIndicator(),
                                 ],
                               );
                             }else if(state.hasData){
                               return Column(
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.only(top: 0),
                                     child: SizedBox(
                                       width: 350.w,
                                       height: 350.h,
                                       child: SingleChildScrollView(scrollDirection: Axis.horizontal,
                                         child: Wrap(alignment: WrapAlignment.start,
                                           direction: Axis.vertical,
                                           children: List.generate(
                                             // 30,
                                             state.data!.length, ///todo uncomment this
                                                 (index) => Row(
                                               crossAxisAlignment:
                                               CrossAxisAlignment.start,
                                               children: [
                                                 SlotPlace(
                                                   name1:
                                                   // 'c200',
                                                   state.data![index].parkingSlotName,
                                                   textName: '⏐',
                                                   onSelectedIndex: onSelectedIndex,
                                                   color1: mainColor,
                                                   color2: selectedColor,
                                                   onTap: () {
                                                     onSelectedIndex = index;
                                                     setState(() {});
                                                     slotId = state.data![index].slotId;
                                                     parkingSlotName = state.data![index].parkingSlotName;
                                                   },
                                                   index: index,
                                                   isAvailable:
                                                   // false
                                                   state.data![index].isAvailable,
                                                   notAvailableColor:
                                                   bookedColor,
                                                 ),
                                               ],
                                             ),
                                           ),
                                         ),
                                       ),
                                     ),
                                   ),
                                   SizedBox(
                                     height:125.h ,
                                   ),

                                   onSelectedIndex == -1? LogButton(borderColor: Colors.transparent,
                                     widget: Text('Add Park Slot',
                                         style: TextStyle(
                                             color: Colors.white, fontSize: 16.sp)),
                                     backgroundColor: mainColor,
                                     textColor: Colors.white,
                                     onPressed: () {
                                       showDialog(
                                           context: context,
                                           builder: (context) {
                                             print(widget.parkId);
                                             return Dialog(
                                               child: SizedBox(
                                                 height: 250,
                                                 child: Column(
                                                   mainAxisAlignment: MainAxisAlignment.center,
                                                   crossAxisAlignment: CrossAxisAlignment.center,
                                                   children: [
                                                     Padding(
                                                       padding: EdgeInsets.symmetric(horizontal: 20.w),
                                                       child: CustomTextField(
                                                         hintText: ' Park Slot Name',
                                                         leftPadding: 5.w,
                                                         rightPadding: 5.w,
                                                         bottomPadding: 40.h,
                                                         topPadding: 5.h,
                                                         controller: parkSlotNameController,
                                                       ),
                                                     ),
                                                     LogButton(borderColor: Colors.transparent,
                                                       widget: const Icon(Icons.send),
                                                       backgroundColor: Colors.blue,
                                                       textColor: Colors.white,
                                                       onPressed: () {
                                                         ParkingRemoteDataSource().postReservationData(parkingSlotName: parkSlotNameController.text.toString(), parkForeignKey: widget.parkId);
                                                         Navigator.pop(context);},
                                                       radius: 30,
                                                       width: 90,
                                                       height: 45,
                                                     ),
                                                   ],
                                                 ),
                                               ),
                                             );
                                           });
                                     },
                                     radius: 5.r,
                                     width: 300.w,
                                     height: 48.w,
                                   ):Row(
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     children: [
                                       Padding(
                                         padding:  EdgeInsets.only(left: 11.w),
                                         child: LogButton(borderColor: Colors.transparent,
                                           widget: Text('Edit',
                                               style: TextStyle(
                                                   color: Colors.white, fontSize: 16.sp)),
                                           backgroundColor: mainColor,
                                           textColor: Colors.white,
                                           onPressed: () {
                                             showDialog(
                                                 context: context,
                                                 builder: (context) {
                                                   print(widget.parkId);
                                                   return Dialog(
                                                     child: SizedBox(
                                                       height: 250,
                                                       child: Column(
                                                         mainAxisAlignment: MainAxisAlignment.center,
                                                         crossAxisAlignment: CrossAxisAlignment.center,
                                                         children: [
                                                           Text('Edit Your Parking Slot',style: TextStyle(
                                                               fontSize: 18.sp
                                                           ),),
                                                           Padding(
                                                             padding: EdgeInsets.symmetric(horizontal: 20.w),
                                                             child: CustomTextField(
                                                               hintText: ' Park Slot Name',
                                                               leftPadding: 5.w,
                                                               rightPadding: 5.w,
                                                               bottomPadding: 35.h,
                                                               topPadding: 20.h,
                                                               controller: parkSlotNameController,
                                                             ),
                                                           ),
                                                           LogButton(borderColor: Colors.transparent,
                                                             widget: const Icon(Icons.send),
                                                             backgroundColor: Colors.blue,
                                                             textColor: Colors.white,
                                                             onPressed: () {
                                                               ParkingRemoteDataSource().putReservationData(id: state.data![onSelectedIndex].slotId, parkingSlotName: parkSlotNameController.text, startHour: '2023-06-14T18:33:00', endHour: '2023-06-14T18:33:00', isAvailable: true, randomNumber: '1231', parkForeignKey: widget.parkId);
                                                               Navigator.pop(context);},
                                                             radius: 30,
                                                             width: 90,
                                                             height: 45,
                                                           ),
                                                         ],
                                                       ),
                                                     ),
                                                   );
                                                 });
                                           },
                                           radius: 5.r,
                                           width: 160.w,
                                           height: 48.w,
                                         ),
                                       ),
                                       SizedBox(width: 12.w),
                                       Padding(
                                         padding:  EdgeInsets.only(right: 11.w),
                                         child: LogButton(borderColor: Colors.transparent,
                                           widget: Text('Delete',
                                               style: TextStyle(
                                                   color: Colors.white, fontSize: 16.sp)),
                                           backgroundColor: Colors.red,
                                           textColor: Colors.white,
                                           onPressed: () {
                                             // showDialog(context: context, builder: (context) {
                                             //       print(widget.parkId);
                                             //       return Dialog(
                                             //         child: SizedBox(
                                             //           height: 250,
                                             //           child: Column(
                                             //             mainAxisAlignment: MainAxisAlignment.start,
                                             //             crossAxisAlignment: CrossAxisAlignment.center,
                                             //             children: [
                                             //               SizedBox(
                                             //                 width: 225,
                                             //                 child: Text('Are you sure you want to delete this slot',style: TextStyle(
                                             //                     fontSize: 18.sp
                                             //                 ),),
                                             //               ),
                                             //               LogButton(
                                             //                 widget: const Icon(Icons.send),
                                             //                 backgroundColor: Colors.red,
                                             //                 textColor: Colors.white,
                                             //                 onPressed: () {
                                             //                   ParkingRemoteDataSource().deleteReservationData(parkSlotId: state.parkingSlot[onSelectedIndex].slotId);
                                             //                   Navigator.pop(context);},
                                             //                 radius: 30,
                                             //                 width: 90,
                                             //                 height: 45,
                                             //               ),
                                             //             ],
                                             //           ),
                                             //         ),
                                             //       );
                                             //     });

                                             ParkingRemoteDataSource().deleteReservationData(parkSlotId: state.data![onSelectedIndex].slotId);
                                           },
                                           radius: 5.r,
                                           width: 160.w,
                                           height: 48.w,
                                         ),
                                       ),
                                     ],
                                   ),

                                 ],
                               );
                             }else {
                               return Center(child: Text('Error else condition'),);
                             }
                              }
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

