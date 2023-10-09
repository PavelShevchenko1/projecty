import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projecty/core/colors.dart';
import 'package:projecty/core/debounce.dart';
import 'package:projecty/core/values.dart';
import 'package:projecty/log.dart';

class IButton extends StatefulWidget {
  const IButton({Key? key, this.icon, this.text, this.onTap}) : super(key: key);
  final String? icon;
  final String? text;
  final void Function()? onTap;

  @override
  State<IButton> createState() => _IButtonState();
}

class _IButtonState extends State<IButton> {
  final ValueNotifier<bool> pressed = ValueNotifier(false);
  final animationDuration = const Duration(milliseconds: 100);
  late final debouncer =
      Debouncer(milliseconds: animationDuration.inMilliseconds * 2);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: designSize);
    return GestureDetector(
      // onTapUp: (details) {
      //   Log.success("TAPUP");
      //   pressed.value = false;
      // },
      onTapDown: (details) {
        Log.success("TAPDOWN");
        pressed.value = true;
      },
      onTap: () {
        Log.success("TAP");
        debouncer.run(() async {
          if (!pressed.value) {
            pressed.value = true;
          }
          if (widget.onTap != null) {
            widget.onTap!();
          }
          if (!pressed.value) {
            await Future.delayed(animationDuration);
          }
          pressed.value = false;
        });
      },
      child: ValueListenableBuilder(
          valueListenable: pressed,
          builder: (context, p, _) {
            return AnimatedContainer(
              duration: animationDuration,
              decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                        color: black, offset: Offset(p ? 0 : 3.w, p ? 0 : 3.w))
                  ],
                  border: Border.all(width: 2.w, color: black),
                  borderRadius: BorderRadius.circular(12).r),
              padding: EdgeInsets.all(p ? 8.w : 10.w),
              child: Row(
                children: [
                  if (widget.icon != null)
                    SvgPicture.asset(
                      widget.icon!,
                      width: 20.w,
                    ),
                  if (widget.text != null)
                    Text(
                      widget.text!,
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.bold),
                    )
                ],
              ),
            );
          }),
    );
  }
}
