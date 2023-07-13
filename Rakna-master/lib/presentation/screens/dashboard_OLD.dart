import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    Color color = const Color.fromRGBO(2, 80, 60, .92);
    double height, width;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    var scroll = ScrollController();
    return Scaffold(
      body: CustomScrollView(
        controller: scroll,
        slivers: [
          //TODO app bar
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.black,
            leading: Icon(Icons.menu),
            title: Text('S L I V E R A P P B A R'),
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: color,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(
                        Icons.person,
                        color: Colors.white70,
                        size: 35,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only( right: 135),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Customer',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 13.5)),
                          Text('Account Name',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                            color: Colors.white30,
                            borderRadius: BorderRadius.circular(15)),
                        child: const Icon(
                          Icons.notifications,
                          color: Colors.white70,
                          size: 35,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //TODO sliver items
          SliverList(
              delegate: SliverChildListDelegate(
            [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 25),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Search Place',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [Icon(Icons.cabin), Text('data')],
                        ),
                        Container(
                          child: Column(
                            children: [Icon(Icons.cabin), Text('data')],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [Icon(Icons.cabin), Text('data')],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 275, top: 25),
                    child: Text(
                      'Nearest Parking',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                    ),
                  ),
                  // SizedBox(height: 360),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 25, left: 15, right: 15),
                        child: Container(
                          width: 400,
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    'assets/images/download.jpeg',
                                    width: 140,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      'parking name',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text('parking location',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black54)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 25),
                                    child: Row(
                                      children: [
                                        Icon(Icons.attach_money,
                                            color: Colors.green.shade700),
                                        Text(
                                          '20/Hr',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 25, left: 15, right: 15),
                        child: Container(
                          width: 400,
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    'assets/images/download.jpeg',
                                    width: 140,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      'parking name',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text('parking location',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black54)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 25),
                                    child: Row(
                                      children: [
                                        Icon(Icons.attach_money,
                                            color: Colors.green.shade700),
                                        Text(
                                          '20/Hr',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 25, left: 15, right: 15),
                        child: Container(
                          width: 400,
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    'assets/images/download.jpeg',
                                    width: 140,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      'parking name',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text('parking location',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black54)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 25),
                                    child: Row(
                                      children: [
                                        Icon(Icons.attach_money,
                                            color: Colors.green.shade700),
                                        Text(
                                          '20/Hr',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 25, left: 15, right: 15),
                        child: Container(
                          width: 400,
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    'assets/images/download.jpeg',
                                    width: 140,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      'parking name',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text('parking location',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black54)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 25),
                                    child: Row(
                                      children: [
                                        Icon(Icons.attach_money,
                                            color: Colors.green.shade700),
                                        Text(
                                          '20/Hr',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }
}
// Column(
// mainAxisAlignment: MainAxisAlignment.end,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Container(
// height: height * 0.72,
// width: width,
// decoration: const BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(35),
// topRight: Radius.circular(35),
// ),
// ),
// child: Column(
// children: [
// Padding(
// padding: const EdgeInsets.symmetric(
// vertical: 30, horizontal: 25),
// child: TextFormField(
// decoration: InputDecoration(
// hintText: 'Search Place',
// prefixIcon: Icon(Icons.search),
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(20),
// ),
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Column(
// children: [Icon(Icons.cabin), Text('data')],
// ),
// Container(
// child: Column(
// children: [Icon(Icons.cabin), Text('data')],
// ),
// ),
// Container(
// child: Column(
// children: [Icon(Icons.cabin), Text('data')],
// ),
// ),
// ],
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(right: 275, top: 25),
// child: Text(
// 'Nearest Parking',
// style: TextStyle(
// fontSize: 17, fontWeight: FontWeight.w400),
// ),
// ),
// // SizedBox(height: 360),
// Column(
// children: [
// Padding(
// padding: const EdgeInsets.only(
// bottom: 25, left: 15, right: 15),
// child: Container(
// width: 400,
// height: 150,
// decoration: BoxDecoration(
// border: Border.all(color: Colors.black),
// borderRadius: BorderRadius.circular(10),
// ),
// child: Row(
// children: [
// Padding(
// padding: const EdgeInsets.symmetric(
// vertical: 10, horizontal: 20),
// child: ClipRRect(
// borderRadius: BorderRadius.circular(20),
// child: Image.asset(
// 'assets/images/download.jpeg',
// width: 140,
// ),
// ),
// ),
// Column(
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// const Padding(
// padding: EdgeInsets.only(top: 20),
// child: Text(
// 'parking name',
// style: TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.w500),
// ),
// ),
// const Padding(
// padding: EdgeInsets.only(top: 5),
// child: Text('parking location',
// style: TextStyle(
// fontSize: 15,
// color: Colors.black54)),
// ),
// Padding(
// padding: EdgeInsets.only(top: 25),
// child: Row(
// children: [
// Icon(Icons.attach_money,
// color: Colors.green.shade700),
// Text(
// '20/Hr',
// style: TextStyle(
// fontSize: 20,
// color: Colors.black),
// ),
// ],
// ),
// ),
// ],
// ),
// ],
// ),
// ),
// ),
// ],
// ),
// ],
// ),
// ),
// ],
// )
