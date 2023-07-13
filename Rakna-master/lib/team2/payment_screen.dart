import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/team2/payment_success_screen.dart';

import '../presentation/components/LogButton_Widget.dart';

class payment1 extends StatefulWidget {
  const payment1({Key? key}) : super(key: key);

  @override
  State<payment1> createState() => _payment1State();
}

class _payment1State extends State<payment1> {
  int value = 0;
  final paymentlabels = [
    'Credit Card / Debit Card',
    'PayPal',
    'Cash on arrive',
  ];
  final paymentIcons = [
    Icons.credit_card,
    Icons.money_off,
    Icons.account_balance_wallet,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Payment'),
        leading: BackButton(
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Choose Your Payment Method',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: paymentlabels.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Radio(
                      value: index,
                      groupValue: value,
                      activeColor: Colors.blue,
                      onChanged: (i) =>
                          setState(() => value = int.parse(i.toString()))),
                  title: Text(
                    paymentlabels[index],
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  trailing: Icon(
                    paymentIcons[index],
                    color: Colors.black,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
          ),
          Center(
            child: LogButton(borderColor: Colors.transparent,
              widget: Text('Add',style: TextStyle(color: Colors.white, fontSize: 16.sp)),
              backgroundColor: Color(0xff067fd0),
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Success()));
              },
              radius: 5.r,
              width: 295.w,
              height: 43.h,
            ),
          ),
        ],
      ),
    );
  }
}
