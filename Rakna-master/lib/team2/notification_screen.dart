import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Container(margin: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  prefixIcon(),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          message(index),
                          timeAndDate(index),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },



          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: 15),
    );
  }
  Widget prefixIcon(){
    return Container(
      height: 50,
      width: 50,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade300,
      ),
      child: Icon(Icons.notifications, size: 25, color: Colors.grey.shade700,

        ),
    );

  }
}




Widget message(int index){

  return Container(
    child: RichText(
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        text: 'Message',
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
            fontWeight: FontWeight.bold
        ),
        children: [
          TextSpan(
            text: 'Notification Description',
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    ),
  );
}
Widget timeAndDate(int index){
  return Container(
    margin: EdgeInsets.only(top: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('23-01-2023',
        style: TextStyle(
          fontSize: 10,
        ),
        ),
        Text('07:10 am',
          style: TextStyle(
            fontSize: 10,
          ),

        ),
      ],
    )
  );
}


