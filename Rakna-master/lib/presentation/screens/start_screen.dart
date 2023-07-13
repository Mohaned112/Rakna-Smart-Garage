import 'package:flutter/material.dart';
import 'package:rakna/presentation/screens/sign_in_screen.dart';

import '../../garage_owner/navigation_bar_garage_owner.dart';
import '../../garage_owner/sign_in_garage_owner.dart';
import '../components/LogButton_Widget.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  Image.asset('assets/images/rakna_logo-removebg.png',
                      filterQuality: FilterQuality.high),
                  const SizedBox(
                    height: 100,
                  ),
                  LogButton(borderColor: Colors.transparent,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn(),));

                    },
                    widget: Text('Customer'),
                    radius: 20,
                    width: 300,
                    height: 60, backgroundColor: Colors.blue, textColor: Colors.white,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  LogButton(borderColor: Colors.transparent,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignInOwner(),));
                    },
                    widget: Text('Garage Owner'),
                    radius: 20,
                    width: 300,
                    height: 60, backgroundColor: Colors.blue, textColor: Colors.white,
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
