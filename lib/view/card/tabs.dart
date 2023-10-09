import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projecty/core/colors.dart';
import 'package:projecty/core/values.dart';
import 'package:projecty/icons.dart';

class Tabs extends StatefulWidget {
  const Tabs({
    Key? key,
  }) : super(key: key);

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> with SingleTickerProviderStateMixin {
  final tabs = [
    Tab(text: 'Коммерч', height: 33.h),
    Tab(text: 'Квартиры', height: 33.h),
    Tab(text: 'Торги', height: 33.h),
  ];
  late var tabController = TabController(length: tabs.length, vsync: this);
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    ScreenUtil.init(context, designSize: designSize);
    return Container(
      width: w,
      margin: EdgeInsets.only(top: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.r),
        color: white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TabBar(
                  physics: AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
                  indicatorPadding: EdgeInsets.only(right: 20.w),
                  padding: EdgeInsets.zero,
                  labelPadding: EdgeInsets.only(right: 20.w),
                  isScrollable: true,
                  controller: tabController,
                  tabs: tabs,
                  labelColor: black,
                  labelStyle:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  indicatorWeight: 3.h,
                  indicatorColor: black,
                  unselectedLabelColor: darkgrey,
                  indicatorSize: TabBarIndicatorSize.tab,
                ),
              ),
              Center(
                child: SvgPicture.asset(
                  IIcons.panel,
                  width: 20.w,
                ),
              )
            ],
          ),
          Divider(
            color: grey,
            height: 3,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 25.h),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              SvgPicture.asset(
                IIcons.card,
                width: 20.w,
              ),
              Text('  Хранилище  ',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp)),
              SvgPicture.asset(
                IIcons.arrowRight,
                width: 7.w,
              )
            ]),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 6.w,
                    ),
                    CircleAvatar(
                      foregroundImage: AssetImage('assets/images/avatar.png'),
                      maxRadius: 19.r,
                    ),
                    SizedBox(
                      width: 11.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('nedvijimostexpert',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp)),
                        Text('15 июнь 2020 14:06',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12.sp)),
                      ],
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 7.w),
                          child: SvgPicture.asset(
                            IIcons.pin,
                            width: 18.w,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 7.w),
                          child: SvgPicture.asset(
                            IIcons.more,
                            width: 18.w,
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.h),
                  padding: EdgeInsets.all(10.r),
                  width: double.infinity,
                  height: 164.w,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(18.r)),
                    color: middlegrey,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: 12.w, right: 10.w, top: 10.h, bottom: 10.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: white,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              IIcons.coin,
                              width: 20.w,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              '100',
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            IIcons.lightFill,
                            width: 16.w,
                          ),
                          SizedBox(width: 5.w),
                          SvgPicture.asset(
                            IIcons.lightFill,
                            width: 16.w,
                          ),
                          SizedBox(width: 5.w),
                          SvgPicture.asset(
                            IIcons.lightFill,
                            width: 16.w,
                          ),
                          SizedBox(width: 5.w),
                          SvgPicture.asset(
                            IIcons.lightEmpty,
                            width: 16.w,
                          ),
                          SizedBox(width: 5.w),
                          SvgPicture.asset(
                            IIcons.lightEmpty,
                            width: 16.w,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 13.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(width: 6.w),
                    Container(
                        width: 49.w,
                        child: Stack(
                          children: [
                            Positioned(
                              child: CircleAvatar(
                                  maxRadius: 9.w, backgroundColor: darkgrey),
                            ),
                            Positioned(
                              left: 13.w,
                              child: CircleAvatar(
                                  maxRadius: 9.w, backgroundColor: darkgrey),
                            ),
                            Positioned(
                              left: 26.w,
                              child: CircleAvatar(
                                  maxRadius: 9.w, backgroundColor: darkgrey),
                            ),
                          ],
                        )),
                    Text('Нравится ', style: TextStyle(fontSize: 12.sp)),
                    Text('11',
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.bold)),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          IIcons.like,
                          width: 25.w,
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        SvgPicture.asset(
                          IIcons.open,
                          width: 25.w,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                      ],
                    ))
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Апартаменты на Курской ',
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold)),
                      SizedBox(height: 5.h),
                      Text('Москва, Россия', style: TextStyle(fontSize: 12.sp)),
                      SizedBox(height: 5.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 4.w),
                            child: SvgPicture.asset(
                              IIcons.star,
                              width: 24.w,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: Text('4,5',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 8.h,
                                  right: 4.w),
                                child: SvgPicture.asset(
                                  IIcons.clock,
                                  width: 28.w,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 8.w),
                            child: Text('72ч.',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.only( top: 8.h,right: 4.w),
                            child: SvgPicture.asset(
                              IIcons.direct,
                              width: 28.w,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: Text('223км.',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: SvgPicture.asset(
                              IIcons.remont,
                              width: 24.w,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: SvgPicture.asset(
                              IIcons.dolya,
                              width: 24.w,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
