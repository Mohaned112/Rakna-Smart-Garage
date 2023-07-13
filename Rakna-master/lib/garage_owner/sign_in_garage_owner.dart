import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:rakna/core/utility/enums.dart';
import 'package:rakna/domain/usecase/sign_in_garage_owner_usecase.dart';
import 'package:rakna/garage_owner/navigation_bar_garage_owner.dart';

import 'package:rakna/presentation/components/LogButton_Widget.dart';
import 'package:rakna/presentation/screens/old1H.dart';
import 'package:rakna/presentation/screens/sign_up_screen.dart';
import '../../core/services/services_locator.dart';
import '../../core/utility/color.dart';
import '../data/data_source/remote_data_source.dart';
import '../data/model/garage_owner_data_model.dart';
import '../data/repository/parking_repository.dart';
import '../presentation/controller/sign_in_garage_owner_bloc/sign_in_garage_owner_bloc.dart';
import '../presentation/screens/forget_password.dart';
import '../presentation/screens/navigation_bar.dart';



class SignInOwner extends StatefulWidget {
  SignInOwner({Key? key}) : super(key: key);
  bool check = false;
  bool eye = true;

  @override
  State<SignInOwner> createState() => _SignInOwnerState();
}

class _SignInOwnerState extends State<SignInOwner> {
  late double height, width;
  Color color = const Color.fromRGBO(2, 32, 42, .82);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ButtonState stateOnlyText = ButtonState.idle;
  ButtonState stateTextWithIcon = ButtonState.idle;
  final formKeyLogin = GlobalKey<FormState>();

  // Color colors = Colors.blue.shade900.withOpacity(.82);
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => SignInGarageOwnerBloc(signInGarageOwnerUseCase:SignInGarageOwnerUseCase(ParkingRepository(ParkingRemoteDataSource())))..add(GetDataGarageOwnerEvent()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: height * .5,
                    decoration: const BoxDecoration(
                        borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(50))),
                    child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(50)),
                        child: Image.asset(
                          'assets/images/garage.png',
                          fit: BoxFit.cover,
                        )),
                  ),
                  Column(
                    children: [
                      Container(
                        width: width,
                        height: height * .5,
                        decoration: BoxDecoration(
                            color: color,
                            borderRadius:  BorderRadius.only(
                                bottomRight: Radius.circular(45.r))),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 170.h),
                              child: Container(
                                height: 105.w,
                                width: 105.w,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius:  BorderRadius.all(
                                        Radius.circular(200.r))),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(200.r),
                                    child: Image.asset(
                                        'assets/images/rakna_logo.jpg')),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 10.h, left: 75.w, right: 75.w),
                              child: Text(
                                'Welcome Back!',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25.8.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: color,
                        ),
                        child: Container(
                          height: height * .5,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                            ),
                          ),
                          child: Form(
                            key: formKeyLogin,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: 22.w, left: 22.w, top: 35.h),
                                    child: TextFormField(
                                      controller: emailController,
                                      decoration: InputDecoration(
                                        labelText: "Email Address",
                                        labelStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.sp,
                                        ),
                                      ),
                                      validator: (value) {
                                        if(value!.isEmpty || RegExp(r'^[a-z A-z]+$').hasMatch(value!)){

                                          return 'Enter the Email';

                                        } else {
                                          return null;
                                        }
                                      },

                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: 22.w, left: 22.w, top: 35.h),
                                    child: TextFormField(
                                      controller: passwordController,
                                      obscureText: widget.eye,
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: Icon(widget.eye == true
                                              ? Icons.visibility
                                              : Icons.visibility_off),
                                          onPressed: () {
                                            widget.eye = !widget.eye;
                                            setState(() {});
                                          },
                                        ),
                                        border: const UnderlineInputBorder(),
                                        labelText: "Password",
                                        labelStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.sp,
                                        ),
                                      ),
                                      validator: (value) {
                                        if(value!.isEmpty ){
                                          return 'Enter the Password';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: EdgeInsets.only(left: 230.w, top: 10.h),
                                  //   child: TextButton(
                                  //     onPressed: () {
                                  //       Navigator.push(
                                  //           context,
                                  //           MaterialPageRoute(
                                  //             builder: (context) =>
                                  //                 ForgetPassword(),
                                  //           ));
                                  //     },
                                  //     child: Text(
                                  //       'Forgot Password?',
                                  //       style: TextStyle(
                                  //           color: kPrimaryColor, fontSize: 12.5.sp),
                                  //     ),
                                  //   ),
                                  // ),
                                  SizedBox(height: 45.h),
                                  BlocBuilder<SignInGarageOwnerBloc, SignInGarageOwnerState>(
                                    builder: (context, state) {
                                      print('${state.requestState }   omar poamra');
                                      print('${state.garageOwnerData.isEmpty }   omar isEmpty');

                                      return Padding(
                                        padding:
                                        EdgeInsets.only(bottom: 8.h, top: 20.h),
                                        child: LogButton(borderColor: Colors.transparent,
                                          widget: Text('Sign In',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16.sp)),
                                          backgroundColor: kPrimaryColor,
                                          textColor: Colors.white,
                                          radius: 15.r,
                                          width: 305.w,
                                          height: 50.h,
                                          onPressed: () {
                                            List garageOwnerIdList = [];
                                            List emailDataList = [];
                                            List passwordDataList = [];
                                            for(int i = 0;i<state.garageOwnerData.length;i++){
                                              garageOwnerIdList.add(state.garageOwnerData[i].garageOwnerId);
                                              emailDataList.add(state.garageOwnerData[i].email);
                                              passwordDataList.add(state.garageOwnerData[i].password);
                                            }


                                            // String  listString = emailDataList.toString().replaceAll('UserDataModel(', '').replaceAll('),', '').replaceAll(')]', '').replaceAll(',', '').replaceAll('[', '');

                                            if (!formKeyLogin.currentState!.validate()) {
                                              final snackBar = SnackBar(content: Text('Submitting form'));
                                              _scaffoldKey.currentState!.showBottomSheet((context) => snackBar);

                                            }

                                            final currentContext = context;
                                        if(state.garageOwnerData.isNotEmpty) {
                                              for (int i = 0;
                                                  i <
                                                      state.garageOwnerData
                                                          .length;
                                                  i++) {
                                                if (emailDataList[i].contains(
                                                            emailController
                                                                .text.toLowerCase()) ==
                                                        true &&
                                                    passwordDataList[i].contains(
                                                            passwordController
                                                                .text) ==
                                                        true &&
                                                    emailController
                                                            .text.isEmpty ==
                                                        false &&
                                                    passwordController
                                                            .text.isEmpty ==
                                                        false) {
                                                  print(garageOwnerIdList[i]);
                                                  print(emailDataList[i]);
                                                  print(passwordDataList[i]);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            NavigationBarGarageOwner(
                                                          garageOwnerId:
                                                              garageOwnerIdList[
                                                                  i],
                                                          name: 'user',
                                                          email:
                                                              emailDataList[i],
                                                        ),
                                                      ));
                                                }
                                              }
                                            }else{
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
                                        ),
                                      );
                                    },
                                  ),


                                ],
                              ),
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
      ),
    );
  }
}



