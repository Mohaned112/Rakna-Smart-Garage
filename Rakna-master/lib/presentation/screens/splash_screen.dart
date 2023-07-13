import 'package:flutter/material.dart';

import 'onboarding_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 2000),() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  OnBoardingScreen(),));
    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
        width: double.infinity,
        height: height,
        color: Colors.white,
        child: Image.asset("assets/images/rakna_logo-removebg.png",));
  }
}
