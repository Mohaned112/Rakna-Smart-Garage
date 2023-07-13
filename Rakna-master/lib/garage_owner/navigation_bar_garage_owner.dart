import 'package:flutter/material.dart';
import 'package:rakna/garage_owner/setting_screen_owner.dart';

import '../data/data_source/remote_data_source.dart';
import 'finance.dart';
import 'garage_owner_home_screen.dart';

class NavigationBarGarageOwner extends StatefulWidget {
   const NavigationBarGarageOwner({super.key,required this.garageOwnerId,required this.name,required this.email});
   final int garageOwnerId;
   final String name;
   final String email;


   @override
  State<NavigationBarGarageOwner> createState() => _NavigationBarGarageOwnerState();
}

class _NavigationBarGarageOwnerState extends State<NavigationBarGarageOwner> {
  int _selectedIndex = 0;
  static  TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
   // List _widgetOptions =

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  [
          // Home(),
          MyCustomUI(garageOwnerId: widget.garageOwnerId, garageOwnerParkingFuture:  ParkingRemoteDataSource().getParkingGarageOwner(widget.garageOwnerId)),
          SettingScreenGarageOwner(name: widget.name, email: widget.email, garageOwnerUserId: widget.garageOwnerId, garageOwnerDataFuture: ParkingRemoteDataSource().garageOwnerData(widget.garageOwnerId)),
        ].elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.local_parking),
          //   label: 'Parking',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
