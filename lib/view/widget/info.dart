import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projecty/core/colors.dart';
import 'package:projecty/core/values.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    required this.icon,
    required this.count,
    required this.text,
    Key? key,
  }) : super(key: key);
  final String text;
  final String icon;
  final int count;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: designSize);
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 13.w, right: 13.w, bottom: 8.h, top: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13).r,
          color: grey,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(icon, width: 25.w,),
            SizedBox(
              width: 5.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 1.h,),
                  Text(
                    "$count",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                  ),
                  Text(
                    text,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                    style: TextStyle(color: darkgrey, fontSize: 12.sp),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

