import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utility/category.dart';
import '../../core/utility/color.dart';
import '../../core/utility/size.dart';

class CategoryCardOwner extends StatefulWidget {
  CategoryCardOwner({
    Key? key,
    required this.widthCard,
    required this.parkPrice,
    required this.parkImage,
    required this.bookmark,
    required this.parkingLocation,
    required this.parkingName,
    required this.nextScreen,
  }) : super(key: key);
  late bool bookmark = true;
  final double widthCard;
  final String parkImage;
  final String parkingName;
  final String parkingLocation;
  final String parkPrice;
  final Widget nextScreen;

  @override
  State<CategoryCardOwner> createState() => _CategoryCardOwnerState();
}

class _CategoryCardOwnerState extends State<CategoryCardOwner> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => widget.category.nextScreen,///todo page detail
        //   ),
        // );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 4.0,
              spreadRadius: .05,
            ), //BoxShadow
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                widget.parkImage,
                height: kCategoryCardImageSize,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3.h, bottom: 0, left: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 140, child: Text(widget.parkingName)),
                      SizedBox(
                        width: 5.w, //TODO add custom
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            widget.bookmark = !widget.bookmark;
                          });
                        },
                        child: Icon(
                          widget.bookmark == true
                              ? Icons.bookmark_add_outlined
                              : Icons.bookmark_added,
                          color: kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 180,
                    child: Text(
                      widget.parkingLocation.toString(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  SizedBox(
                    height: 45.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 100.w),
                    child: Text(
                      widget.parkPrice,
                      style: TextStyle(color: kPrimaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
