import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/garage_owner/payment_method_owner.dart';

import '../core/utility/category.dart';
import '../core/utility/color.dart';
import '../presentation/components/LogButton_Widget.dart';
import '../presentation/components/category_card.dart';
import '../team2/notification_screen.dart';
import 'category_card_garage_owner.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(height: 340, child: head()),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 10),
                  //   child: Text(
                  //     "Activity",
                  //     style: TextStyle(
                  //         fontSize: 18,
                  //         fontWeight: FontWeight.bold,
                  //         color: Colors.grey),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     InkWell(
                  //       onTap: () {
                  //         Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //               builder: (context) => PaymentMethodOwner(),
                  //             ));
                  //       },
                  //       child: buildActivityButton(
                  //           Icons.credit_card_rounded,
                  //           "My Card",
                  //           Colors.blue.withOpacity(0.2),
                  //           Color(0XFF01579B)),
                  //     ),
                  //     buildActivityButton(
                  //         Icons.transfer_within_a_station,
                  //         "Transfer",
                  //         Colors.cyanAccent.withOpacity(0.2),
                  //         Color(0XFF0097A7)),
                  //     buildActivityButton(
                  //         Icons.pie_chart,
                  //         "Statistics",
                  //         Color(0XFFD7CCC8).withOpacity(0.4),
                  //         Color(0XFF9499B7)),
                  //   ],
                  // ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Top Earning",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  buildCategoryCard(
                      Icons.local_parking, "Park Name 1", 2000, 25),
                  buildCategoryCard(
                      Icons.local_parking, "Park Name 2", 2000, 25),
                  buildCategoryCard(
                      Icons.local_parking, "Park Name 3", 2000, 25),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget head() {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 240,
              decoration: BoxDecoration(
                color: kPrimaryColor,

                /// todo color
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Stack(
                children: [
                  // Positioned(
                  //   top: 35,
                  //   left: 340,
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.circular(7),
                  //     child: Container(
                  //       height: 40,
                  //       width: 40,
                  //       color: Color.fromRGBO(250, 250, 250, 0.1),
                  //       child: InkWell(
                  //         onTap: () {
                  //
                  //           Navigator.push(context, MaterialPageRoute(builder: (context) => Notifications()));
                  //         },
                  //         child: Icon(
                  //           Icons.notifications_none,
                  //           size: 30,
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 35, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Afternoon',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color.fromARGB(255, 224, 223, 223),
                          ),
                        ),
                        Text(
                          'Omar',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 140,
          left: 37,
          child: Container(
            height: 170,
            width: 320,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 3),
                  blurRadius: 5,
                  spreadRadius: 0.5,
                ),
              ],
              gradient: SweepGradient(
                  center: AlignmentDirectional(1, -1),
                  startAngle: 1.7,
                  endAngle: 3,
                  colors: <Color>[
                    Colors.blue.shade700,
                    Colors.blue.shade700,
                    Colors.blue.shade800,
                    Colors.blue.shade800,
                    Colors.blue.shade700,
                    Colors.blue.shade700,
                  ],
                  stops: const <double>[
                    0.0,
                    0.3,
                    0.3,
                    0.7,
                    0.7,
                    1.0,
                  ]),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Balance',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Text(
                        'E£ 4000',

                        ///todo total money
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          CircleAvatar(
                            radius: 13,
                            backgroundColor: Colors.blue,
                            child: Icon(
                              Icons.arrow_upward,
                              color: Colors.white,
                              size: 19,
                            ),
                          ),
                          SizedBox(width: 7),
                          Text(
                            'Income',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color.fromARGB(255, 216, 216, 216),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          CircleAvatar(
                            radius: 13,
                            backgroundColor: Colors.blue,
                            child: Icon(
                              Icons.arrow_downward,
                              color: Colors.white,
                              size: 19,
                            ),
                          ),
                          SizedBox(width: 7),
                          Text(
                            'Expenses',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color.fromARGB(255, 216, 216, 216),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'E£ 6000',

                        ///todo income money
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'E£ -2000',

                        ///todo expenses money maybe not imp
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

GestureDetector buildActivityButton(
    IconData icon, String title, Color backgroundColor, Color iconColor) {
  return GestureDetector(
    child: Container(
      margin: EdgeInsets.all(10),
      height: 90,
      width: 90,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
  );
}

Container buildCategoryCard(
    IconData icon, String title, int amount, int percentage) {
  return Container(
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    ),
    height: 85,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: Colors.blue,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "E£$amount",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "($percentage%)",
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Stack(
          children: [
            Container(
              height: 5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.grey.shade300),
            ),
            Container(
              height: 5,
              width: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2), color: Colors.blue),
            ),
          ],
        )
      ],
    ),
  );
}
