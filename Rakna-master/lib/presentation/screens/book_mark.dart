import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookMark extends StatefulWidget {
  const BookMark({super.key});

  @override
  _BookMarkState createState() => _BookMarkState();
}

class _BookMarkState extends State<BookMark>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _animation2;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _animation2 = Tween<double>(begin: 0, end: -5).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 120.w, right: 120.w, top: 15.w),
              child: Row(
                children: [
                  Text(
                    'Your Parking',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(height: 60.h,)
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffF5F5F5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  // CustomPaint(
                  //   painter: MyPainter(),
                  //   child: Container(height: 0),
                  // ),
                  SizedBox(height: 30.h),
                  cards(),
                  cards(),
                  cards(),
                  cards(),
                  cards(),
                  cards(),
                  cards(),
                  cards(),
                  cards(),
                  cards(),
                  cards(),
                  cards(),
                  cards(),
                  cards(),
                  cards(),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                spreadRadius: .5,
                                blurRadius: 1.5,
                                offset: Offset(0, .5))
                          ]),
                      width: 45,
                      height: 45,
                      child: Center(
                        child: InkWell(
                          onTap: () {},
                          child: Icon(
                            CupertinoIcons.add,
                            color: Colors.blue.shade700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget cards() {
    return Opacity(
      opacity: _animation.value,
      child: Transform.translate(
        offset: Offset(0.01, _animation2.value),
        child: InkWell(
          enableFeedback: true,
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => RouteWhereYouGo(),
            //     ));
          },
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          child: Container(
            margin: EdgeInsets.fromLTRB(19.w, 19.w, 19.w, 0),
            padding: EdgeInsets.all(18.w),
            // height: 100.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xffEDECEA),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue.withOpacity(.1),
                  radius: 30.r,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        'assets/images/garage.png',
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      )),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: 185.w,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          'Park Name Here ',
                          textScaleFactor: 1.45,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(.7),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        child: Text(
                          'Park Location',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(.8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.navigate_next_outlined)
              ],
            ),
          ),
        ),
      ),
    );
  }
}