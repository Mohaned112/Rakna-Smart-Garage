import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogButton extends StatelessWidget {
  const LogButton({
    Key? key,
    required this.widget,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
    required this.radius, required this.width, required this.height, required this.borderColor,
  }) : super(key: key);
  final VoidCallback onPressed;
  final Widget widget;
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final double radius;
  final double width;
  final double height;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              side: BorderSide(color: borderColor,width: 1.5),
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
        ),
        child: widget


      ),
    );
  }
}

// Text style: TextStyle(color: textColor, fontSize: 16.sp),
