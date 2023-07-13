import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:rakna/presentation/screens/sign_in_screen.dart';
import 'package:rakna/presentation/screens/start_screen.dart';

import '../../core/utility/color.dart';

class OnBoardingScreen extends StatefulWidget {
   OnBoardingScreen({Key? key}) : super(key: key);
var titleColor = Colors.blue[800];
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool skip = true;
  bool back = false;
//00425A
//144272
  @override
  Widget build(BuildContext context) {
    // TODO make it bloc and remove set state

    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Find Parking Places Around You Easily",
          body: "Don't waste your time finding available parking spot . Locate them with just one tap ",
          decoration: PageDecoration(
              titleTextStyle:
                   TextStyle(fontWeight: FontWeight.bold, fontSize: 31,color:widget.titleColor),
              bodyTextStyle: TextStyle(
                  color: Colors.grey.shade600, fontSize: 15, height: 1.5)),
          image: Image.asset('assets/images/GPS navigator-bro.png',
              fit: BoxFit.cover, width: double.infinity, height: 400),
        ),
        PageViewModel(
          title: "Suitable parking for you",
          body: "Use the app to find nearest parking for you ",
          decoration: PageDecoration(
              titleTextStyle:
                   TextStyle(fontWeight: FontWeight.bold, fontSize: 31,color:widget.titleColor),
              bodyTextStyle: TextStyle(
                  color: Colors.grey.shade600, fontSize: 15, height: 1.5)),
          image: Image.asset('assets/images/City driver-cuate.png',
              fit: BoxFit.cover, width: double.infinity, height: 400),
        ),
        PageViewModel(
          title: "Book and Pay Parking Quickly & Safely",
          body: "Payment for your parking have never been easier we offer a wide range of payment",
          decoration: PageDecoration(
              titleTextStyle:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 31,color:widget.titleColor),
              bodyTextStyle: TextStyle(
                  color: Colors.grey.shade600, fontSize: 15, height: 1.5)),
          image: Image.asset('assets/images/E-Wallet-pana.png',
              fit: BoxFit.cover, width: double.infinity, height: 400),
        ),
      ],
      //assets/images/E-Wallet-pana.png
      dotsDecorator: DotsDecorator(
        color: Colors.grey,
        activeColor: kPrimaryColor,
        size: const Size(10, 10),
        activeSize: const Size(22, 10),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
      back:  Text(
        "Back",
        style: TextStyle(color: widget.titleColor, fontWeight: FontWeight.bold),
      ),
      skip:  Text(
        "Skip",
        style: TextStyle(color: widget.titleColor, fontWeight: FontWeight.bold),
      ),

      /// TODO routes
      onSkip: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => GetStarted(),
            ));

      },
      next:  Text(
        "Next",
        style: TextStyle(color: widget.titleColor, fontWeight: FontWeight.bold),
      ),
      done:  Text(
        "Finish",
        style: TextStyle(
          color: widget.titleColor,fontWeight: FontWeight.bold
        ),
      ),

      /// TODO routes
      onDone: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => GetStarted(),
            ));
      },

      showSkipButton: skip,
      showNextButton: true,
      showBackButton: back,

      onChange: (index) {
        setState(() {
          if (index > 0) {
            skip = false;
            back = true;
          } else {
            skip = true;
            back = false;
          }
        });
      },
    );
  }
}
