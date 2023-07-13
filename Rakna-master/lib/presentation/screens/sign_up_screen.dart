import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/presentation/screens/sign_in_screen.dart';

import '../../core/utility/color.dart';
import '../../data/data_source/remote_data_source.dart';
import '../components/LogButton_Widget.dart';
import 'old1H.dart';
import 'navigation_bar.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);
  bool eyeOne = true;
  bool eyeTwo = true;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formKeyReg = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    double height, width;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    Color color = Colors.blue.shade800;

    RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
    //A function that validate user entered password
    bool validatePassword(String pass) {
      String _password = pass.trim();
      if (pass_valid.hasMatch(_password)) {
        return true;
      } else {
        return false;
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Form(
              key: formKeyReg,
              child: Column(
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
                            'Create Account',
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
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50.r))),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                right: 22.w,
                                left: 22.w,
                                top: 30.h,
                              ),
                              child: TextFormField(
                                controller: userNameController,
                                decoration: InputDecoration(
                                  labelText: "Name",
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54,
                                    fontSize: 13.sp,
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r'^[a-z A-Z]+$')
                                          .hasMatch(value!)) {
                                    return " enter your correct name";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 22.w,
                                left: 22.w,
                                top: 30.h,
                              ),
                              child: TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  labelText: "Email Address",
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54,
                                    fontSize: 13.sp,
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                          .hasMatch(value!)) {
                                    return " enter your correct Email";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 22.w,
                                left: 22.w,
                                top: 30.h,
                              ),
                              child: TextFormField(
                                controller: phoneNumberController,
                                decoration: InputDecoration(
                                    // labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,),
                                    labelText: "Phone Number",
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54,
                                      fontSize: 13.sp,
                                    ),
                                    border: UnderlineInputBorder()),
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r'^[+]*[(]{0,1}[0,9]{1,4}[(]{0,1}[-\s\./0-9]+$')
                                          .hasMatch(value!)) {
                                    return " enter your correct number";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 22.w,
                                left: 22.w,
                                top: 30.h,
                              ),
                              child: TextFormField(
                                controller: ageController,
                                decoration: InputDecoration(
                                    // labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,),
                                    labelText: "Age",
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54,
                                      fontSize: 13.sp,
                                    ),
                                    border: UnderlineInputBorder()),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return " enter your correct age";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 22.w,
                                left: 22.w,
                                top: 30.h,
                              ),
                              child: TextFormField(
                                obscureText: widget.eyeOne,
                                controller: passwordController,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(widget.eyeOne == true
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      onPressed: () {
                                        widget.eyeOne = !widget.eyeOne;
                                        setState(() {});
                                      },
                                    ),

                                    // labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,),
                                    labelText: "Password",
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54,
                                      fontSize: 13.sp,
                                    ),
                                    border: UnderlineInputBorder()),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter password";
                                  } else {
                                    //call function to check password
                                    bool result = validatePassword(value);
                                    if (result) {
                                      // create account event
                                      return null;
                                    } else {
                                      return " Password should contain Capital, small letter & Number & Special";
                                    }
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 22.w,
                                left: 22.w,
                                top: 30.h,
                              ),
                              child: TextFormField(
                                obscureText: widget.eyeTwo,
                                controller: confirmPasswordController,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          widget.eyeTwo = !widget.eyeTwo;
                                          setState(() {});
                                        },
                                        icon: Icon(widget.eyeTwo == true
                                            ? Icons.visibility
                                            : Icons.visibility_off)),
                                    // labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,),
                                    labelText: "Confirm Password",
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54,
                                      fontSize: 13.sp,
                                    ),
                                    border: UnderlineInputBorder()),
                                validator: (value) {
                                  if (value!.isEmpty &&
                                      value == passwordController.text) {
                                    return "Please enter password";
                                  } else {
                                    //call function to check password
                                    bool result = validatePassword(value);
                                    if (result) {
                                      // create account event
                                      return null;
                                    } else {
                                      return " Password is not the same ";
                                    }
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 8.h, top: 50.h),
                              child: LogButton(
                                borderColor: Colors.transparent,
                                widget: Text('Sign Up',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.sp)),
                                backgroundColor: kPrimaryColor,
                                textColor: Colors.white,
                                radius: 15.r,
                                width: 305.w,
                                height: 50.h,
                                onPressed: () async {
                                  if (!formKeyReg.currentState!.validate()) {
                                    final snackBar = SnackBar(
                                        content: Text('Submitting form'));
                                    _scaffoldKey.currentState!
                                        .showBottomSheet((context) => snackBar);
                                  }

                                  // BaseRemoteDataSource parkingRemoteDataSource =
                                  //     ParkingRemoteDataSource();

                                  final currentContext = context;
                                  if (await ParkingRemoteDataSource()
                                      .postSignUp(
                                    userName: userNameController.text,
                                    age: int.parse(ageController.text),
                                    email: emailController.text.toLowerCase(),
                                    password: passwordController.text,
                                    confirmPassword:
                                        confirmPasswordController.text,
                                    phoneNumber: phoneNumberController.text,
                                  )) {
                                    Future.delayed(
                                        Duration.zero,
                                        () => AwesomeDialog(
                                              context: currentContext,
                                              animType: AnimType.leftSlide,
                                              headerAnimationLoop: false,
                                              dialogType: DialogType.success,
                                              showCloseIcon: true,
                                              title: 'Success',
                                              desc: 'Sign Up Success',
                                              btnOkOnPress: () {
                                                debugPrint('OnClcik');
                                              },
                                            ).show());
                                    Future.delayed(
                                        const Duration(milliseconds: 1600), () {
                                      Navigator.pushReplacement(
                                          currentContext,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  NavigationBarScreen(
                                                      userName: userNameController.text,
                                                      userPhoneNumber: phoneNumberController.text, userEmail:emailController.text.toLowerCase()),
                                              settings: const RouteSettings(
                                                name: 'NavigationBarScreen',
                                              )

                                              ///todo userId must do patch

                                              ));
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
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 65.w, right: 65.w, top: 10.h),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignIn()));
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      'Already have an account?',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    Text(
                                      ' SIGN IN',
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
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
    );
  }
}
