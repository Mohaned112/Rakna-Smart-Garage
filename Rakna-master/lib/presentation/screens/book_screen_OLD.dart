import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/LogButton_Widget.dart';

class Book extends StatefulWidget {
  const Book({Key? key}) : super(key: key);

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff07193e).withOpacity(.79),
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new_rounded),
        title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 77),
            child: Text('Add Details')),
        shadowColor: Colors.transparent,
        backgroundColor: Color(0xff4169E1).withOpacity(.20),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              'Parking name',
              style: TextStyle(color: Colors.white,fontSize: 22),
            ),
            subtitle:
                Text('parking location', style: TextStyle(color: Colors.white70)),
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNOAMaCXQVqpfoVVx74o4dLsDCUsDKq1ZU-w&usqp=CAU',
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 19),
            child: Text(
              'Duration hour',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(.85)),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 22),
                child: Container(
                  width: 110,
                  height: 70,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white.withOpacity(.4),
                      ),
                      borderRadius: BorderRadius.circular(7)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('1 Hour', style: TextStyle(color: Colors.white)),
                      Text('\$10',
                          style: TextStyle(
                            color: Colors.yellow.shade800,
                          )),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: 110,
                  height: 70,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.white.withOpacity(.4)),
                      borderRadius: BorderRadius.circular(7)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('2 Hour', style: TextStyle(color: Colors.white)),
                      Text('\$20',
                          style: TextStyle(
                            color: Colors.yellow.shade800,
                          )),
                    ],
                  ),
                ),
              ),
              Container(
                width: 110,
                height: 70,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white.withOpacity(.4)),
                    borderRadius: BorderRadius.circular(7)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('3 Hour', style: TextStyle(color: Colors.white)),
                    Text('\$30',
                        style: TextStyle(
                          color: Colors.yellow.shade800,
                        )),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 298, top: 10),
            child: InkWell(
                onTap: () {},
                child: Text(
                  'Custom Range',
                  style: TextStyle(color: Colors.blue.shade700),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 100,horizontal: 20),
            child: LogButton(borderColor: Colors.transparent,
              widget: Text('book',style: TextStyle(color: Colors.white, fontSize: 16.sp)),
              backgroundColor: Color(0xff4b78ff).withOpacity(.87),
              textColor: Colors.white,
              onPressed: () {},
              radius: 5,
              width: 355,
              height: 53,
            ),
          ),
        ],
      ),
    );
  }
}
