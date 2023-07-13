import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/presentation/screens/setting_screen.dart';

import '../../data/data_source/remote_data_source.dart';
import '../../data/model/user_data_model.dart';
import '../../garage_owner/book_mark.dart';
import '../components/appbar.dart';
import 'ticket_state_screen.dart';
import 'home_screen.dart';

class NavigationBarScreen extends StatefulWidget {
  NavigationBarScreen({super.key, this.screenIndex = 0, required this.userPhoneNumber, required this.userEmail, required this.userName});

        int screenIndex;
        int userId = 0;
  final  String userName ;
  final String  userPhoneNumber;
  final String  userEmail;

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  bool isLoading = true;
  bool stopLoading = false;
  bool stopLoading2 = false;
late String userName;
  late String  userPhoneNumber;
  late int  userId1;
  void _onItemTapped(int index) {
    setState(() {
      widget.screenIndex = index;
    });
  }




  void userId() async {
    List<UserDataModel> userDataList = await ParkingRemoteDataSource().checkUserData();
    for (int i = 0; i < userDataList.length; i++) {
      if (userDataList[i].email == widget.userEmail) {
        widget.userId = userDataList[i].userID;
      }
    }
    print('widget.userId: ${widget.userId} omar  check');
    if (!stopLoading && !stopLoading2) {
      setState(() {
        isLoading = false;
        stopLoading = true;
        stopLoading2 = true;
      });
    }
  }
  @override
  void initState() {
    super.initState();
    userName = widget.userName; // or provide a default value
    userPhoneNumber =  widget.userPhoneNumber; // or provide a default value

  }
  @override
  Widget build(BuildContext context) {
    userId();
    return  Scaffold(
      body: isLoading
          ? Column(
            children: [
              AppBarCustom(
                image: 'assets/images/garage.png', userId: widget.userId, userName:widget.userName, userPhoneNumber: widget.userPhoneNumber, userEmail: widget.userEmail,
              ),
              SizedBox(height: 30.h),
              Center(child: CircularProgressIndicator()),
            ],
          )
          : Center(
        child: [
          HomeScreen(userId: widget.userId, userName: userName, userPhoneNumber: userPhoneNumber, getParking: ParkingRemoteDataSource().getParking(), userEmail: widget.userEmail,),
          TicketState(userId: widget.userId),
          BookMark(userId: widget.userId, userName: userName, userPhoneNumber: userPhoneNumber, getBookMark:  ParkingRemoteDataSource().getBookMark(widget.userId), userEmail: widget.userEmail,),
          SettingScreen(userID: widget.userId, getUserData:   ParkingRemoteDataSource().getUserData(widget.userId)),
        ].elementAt(widget.screenIndex),),
      bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.tickets_fill),
          label: 'Ticket',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          label: 'BookMark',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Account',
        ),
      ],
      currentIndex: widget.screenIndex,
      selectedItemColor: Colors.blue[800],
      onTap: _onItemTapped,
    ),

    );
    //   Scaffold(
    //   body:widget.userId != 0? Center(
    //     child: [
    //        HomeScreen(userId: widget.userId, userName: widget.userName, userPhoneNumber: widget.userPhoneNumber, getParking: ParkingRemoteDataSource().getParking()),
    //        TicketState(userId: widget.userId),
    //        BookMark(userId: widget.userId, userName: widget.userName, userPhoneNumber: widget.userPhoneNumber, getBookMark:  ParkingRemoteDataSource().getBookMark(widget.userId)),
    //        SettingScreen(userID: widget.userId, getUserData:   ParkingRemoteDataSource().getUserData(widget.userId)),
    //     ].elementAt(widget.screenIndex),):const Center(child: Text('Please Reload the Screen')),
    //   bottomNavigationBar: BottomNavigationBar(
    //     type: BottomNavigationBarType.fixed,
    //     items: const <BottomNavigationBarItem>[
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.home),
    //         label: 'Home',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(CupertinoIcons.tickets_fill),
    //         label: 'Ticket',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.bookmark),
    //         label: 'BookMark',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.person),
    //         label: 'Account',
    //       ),
    //     ],
    //     currentIndex: widget.screenIndex,
    //     selectedItemColor: Colors.blue[800],
    //     onTap: _onItemTapped,
    //   ),
    // );
  }
}
