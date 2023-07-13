import 'package:flutter/material.dart';
import 'package:rakna/presentation/components/search_bar.dart';

import '../../core/utility/color.dart';
import '../../team2/notification_screen.dart';
import 'circle_button.dart';




class AppBarCustom extends StatefulWidget {
   AppBarCustom({Key? key, required this.image, required this.userId, required this.userName, required this.userPhoneNumber, required this.userEmail}) : super(key: key);

   final int userId;
   final String userName;
   final String  userPhoneNumber;
   final String  userEmail;
String image;
  @override
  State<AppBarCustom> createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.7],
          colors: [
            // Colors.blue.shade500,
            // Colors.blue.shade900,
            kPrimaryLight,
            // Color(0xff886ff2),
            kPrimaryColor
            // Color(0xff144272)
          ],
        ),
      ),
      child: Column(
        children: [
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hello,\nGood Morning",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          // InkWell(
          //   onTap: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => Notifications()));
          //   },
          //   child: CircleButton(
          //     icon: Icons.notifications,
          //     onPressed: () {},
          //   ),
          // ),
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      TextFormField(onTap: () {
        showSearch(context: context, delegate: SearchUser(image: widget.image, userPhoneNumber: widget.userPhoneNumber, userName:widget.userName, userId: widget.userId, userEmail: widget.userEmail));
      },
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,

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
        ),)
        ],
      ),
    );
  }
}


