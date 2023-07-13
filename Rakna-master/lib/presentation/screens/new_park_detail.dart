import 'package:flutter/material.dart';

class NewParkDetail extends StatefulWidget {
  const NewParkDetail({Key? key}) : super(key: key);

  @override
  State<NewParkDetail> createState() => _NewParkDetailState();
}

class _NewParkDetailState extends State<NewParkDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(18, 50, 18, 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(50),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 28),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(Icons.arrow_back_rounded,size: 35),
                    ),
                    Text(
                      'Parking Details',
                      style: TextStyle(
                        fontSize: 29,
                        fontWeight: FontWeight.w600,
                        height: 1.1600001105,
                        color: Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // rectangle41z8H (1:9)
                margin: EdgeInsets.fromLTRB(3.63, 0, 0, 28),
                width: 368,
                height: 176,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/garage.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 1.37, 17),
                width: 371,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(23, 0, 23, 38),
                      width: double.infinity,
                      height: 50,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 244,
                            height: double.infinity,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Align(
                                    child: SizedBox(
                                      width: 244,
                                      height: 29,
                                      child: Text(
                                        'Parking Lot of San Manolia',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          height: 1.445,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  top: 28,
                                  child: Align(
                                    child: SizedBox(
                                      width: 233,
                                      height: 22,
                                      child: Text(
                                        '9569, Trantow Courts, San Manolia',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          height: 1.445,
                                          color: Color(0xffa1a1a1),
                                        ),
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
                    Container(
                      margin: EdgeInsets.fromLTRB(4, 0, 0, 35),
                      child: SingleChildScrollView(

                        scrollDirection: Axis.horizontal
                        ,child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 1, 0, 0),
                              padding: EdgeInsets.fromLTRB(19, 7, 31, 6),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffbc0063)),
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 13,
                                    height: 19,
                                  ),
                                  Text(
                                    '2 km',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      height: 1.445,
                                      color: Color(0xffbc0063),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 9,
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                              padding: EdgeInsets.fromLTRB(16, 7, 13, 6),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffbc0063)),
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 14,
                                    height: 14,
                                  ),
                                  Text(
                                    '8 AM - 10 PM',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      height: 1.445,
                                      color: Color(0xffbc0063),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 9,
                            ),
                            Container(
                              // group682HF (1:19)
                              width: 85,
                              height: 37,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffbc0063)),
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                child: Text(
                                  'Valet',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    height: 1.445,
                                    color: Color(0xffbc0063),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(4, 0, 0, 4),
                      child: Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          height: 1.445,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: 371,
                      ),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            height: 1.445,
                            color: Color(0xffa1a1a1),
                          ),
                          children: [
                            TextSpan(
                              text:
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining ',
                            ),
                            TextSpan(
                              text: 'Read more...',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                height: 1.445,
                                color: Color(0xffbc0063),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(4.63, 0, 0, 33),
                width: 365,
                height: 93,
                decoration: BoxDecoration(
                  color: Color(0xfff3f3f3),
                  borderRadius: BorderRadius.circular(23),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(alignment: Alignment.center,
                    children: [
                      Text(
                        '\$2.02',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          height: 1.445,
                          color: Color(0xffbc0063),
                        ),
                      ),
                      Positioned(
                        left: 190,
                        top: 40,
                        child: Align(
                          child: SizedBox(
                            width: 54,
                            height: 21,
                            child: Text(
                              'per hour',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                height: 1.445,
                                color: Color(0xffa1a1a1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(4, 0, 0, 0),
                width: double.infinity,
                height: 51,
                child: Center(
                  child: Container(
                    width: 174.37,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffbc0063)),
                      color: Color(0xffbc0063),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text(
                        'Book Parking',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          height: 1.445,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
