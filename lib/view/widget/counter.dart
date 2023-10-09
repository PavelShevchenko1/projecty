import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projecty/core/colors.dart';
import 'package:projecty/core/values.dart';

class Counter extends StatelessWidget {
  const Counter({Key? key, required this.count, required this.text})
      : super(key: key);
  final String count;
  final String text;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: designSize);
    return Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: Column(
        children: [
          Text(
            count,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
          ),
          Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 12.sp,
                color: darkgrey),
          ),
        ],
      ),
    );
  }
}
