import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projecty/core/colors.dart';
import 'package:projecty/core/values.dart';
import 'package:projecty/icons.dart';
import 'package:projecty/log.dart';
import 'package:projecty/view/card/tabs.dart';
import 'package:projecty/view/widget/button.dart';
import 'package:projecty/view/widget/counter.dart';
import 'package:projecty/view/widget/info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: designSize,
      builder: (context, _) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final headerScroll = ScrollController();
  ValueNotifier<double> headerTranparents = ValueNotifier(0);
  ValueNotifier<double> headerSize = ValueNotifier(0);
  ValueNotifier<int> badgeNumber = ValueNotifier(3);

  @override
  void initState() {
    headerScroll.addListener(() {
      if (headerScroll.offset <= 0) {
        headerTranparents.value = 0;
        if (headerScroll.offset <= -300) {
          headerSize.value = -300;
        } else {
          headerSize.value = headerScroll.offset;
        }
        return;
      }
      if (headerScroll.offset >= 100) {
        headerTranparents.value = 1;
        headerSize.value = 100;
        return;
      }
      headerSize.value = headerScroll.offset;
      headerTranparents.value = (headerScroll.offset / 100) * 1;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    ScreenUtil.init(context, designSize: designSize);
    return Scaffold(
        backgroundColor: grey,
        bottomNavigationBar: Container(
          height: 71.h,
          padding: EdgeInsets.only(left: 37.w, right: 37.w, top: 12.h, bottom: 34.h),
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: middlegrey, width: 1)),
            color: bottomgrey,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(IIcons.tabHome, width: 24.w, color: unselectedgrey,),
              SvgPicture.asset(IIcons.tabChat, width: 24.w, color: unselectedgrey,),
              SvgPicture.asset(IIcons.tabPost, width: 24.w, color: unselectedgrey,),
              Badge(
                position: BadgePosition.topEnd(top: -9.h, end: -8.w),
                badgeContent: Text('1', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: white),),
                child: SvgPicture.asset(IIcons.tabNotif, width: 24.w, color: unselectedgrey,)),
              SvgPicture.asset(IIcons.tabProfile, width: 24.w,),
            ],
          ),
        ),
        body: Stack(
          children: [
            ValueListenableBuilder(
                valueListenable: headerSize,
                builder: (context, s, _) {
                  return Container(
                    width: w,
                    height: 210 - s,
                    child: ValueListenableBuilder(
                        valueListenable: headerTranparents,
                        builder: (context, t, _) {
                          return Image.asset(
                            'assets/images/oblozhka.png',
                            fit: BoxFit.cover,
                            colorBlendMode: BlendMode.lighten,
                            color: white.withOpacity(t),
                          );
                        }),
                  );
                }),
            Container(
              width: w,
              height: h,
              child: ListView(
                padding: EdgeInsets.only(top: 175.h),
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                controller: headerScroll,
                shrinkWrap: true,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: w,
                        margin: EdgeInsets.only(top: 31.h),
                        padding: EdgeInsets.only(
                            top: 82, left: 20.w, right: 20.w, bottom: 19.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22.r),
                          color: white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Евгений Гдюжъ ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp),
                                ),
                                SvgPicture.asset(
                                  IIcons.verify,
                                  width: 25.w,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  IIcons.id,
                                  width: 12.w,
                                ),
                                Text(
                                  " nedvijimostexpert",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 9.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  "Занимаю в этой компании должность риелтора, продаю квартиры, как пирожки. живу ради этого",
                                  style: TextStyle(fontSize: 14.sp),
                                ))
                              ],
                            ),
                            SizedBox(
                              height: 14.h,
                            ),
                            Row(
                              children: [
                                Counter(
                                  count: '3',
                                  text: 'Продажи',
                                ),
                                Counter(
                                  count: '11',
                                  text: 'Опыт',
                                ),
                                Counter(
                                  count: '100',
                                  text: 'Баллы',
                                ),
                                Counter(
                                  count: '5',
                                  text: 'Контакты',
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 14.w, right: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ValueListenableBuilder(
                                    valueListenable: headerTranparents,
                                    builder: (context, t, _) {
                                      var s = 100.w;
                                      return Container(
                                        margin: EdgeInsets.only(top: 5.h),
                                        width: s * 0.6 + ((s * 0.4) * (1 - t)),
                                        height: s * 0.6 + ((s * 0.4) * (1 - t)),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                width: 3.w, color: white)),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(s / 2),
                                          child: Image.asset(
                                            'assets/images/avatar.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                    }),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6.h, horizontal: 4.w),
                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(8.r)),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        " lv.3",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12.sp),
                                      ),
                                      Text(
                                        " 60,30% ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 9.sp),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 10.h),
                              child: IButton(
                                icon: IIcons.gear,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: w,
                    margin: EdgeInsets.only(top: 10.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 22.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22.r),
                      color: white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            InfoWidget(
                              icon: IIcons.reward,
                              text: "Награды",
                              count: 1250,
                            ),
                            SizedBox(
                              width: 18.w,
                            ),
                            InfoWidget(
                              icon: IIcons.light,
                              text: "Рейтинг",
                              count: 0,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(
                          children: [
                            InfoWidget(
                              icon: IIcons.direct,
                              text: "Направления",
                              count: 14,
                            ),
                            SizedBox(
                              width: 18,
                            ),
                            InfoWidget(
                              icon: IIcons.clock,
                              text: "Часы на работе",
                              count: 3,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Tabs(),
                ],
              ),
            ),
            ValueListenableBuilder(
                valueListenable: headerTranparents,
                builder: (context, t, _) {
                  return Container(
                    width: w,
                    color: white.withOpacity(t),
                    child: SafeArea(
                        child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const IButton(
                            icon: IIcons.menu,
                          ),
                          Row(
                            children: [
                              ValueListenableBuilder(
                                  valueListenable: badgeNumber,
                                  builder: (context, n, _) {
                                    return Badge(
                                      badgeAnimation:
                                          const BadgeAnimation.rotation(),
                                      badgeContent: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 3.w),
                                        child: Text(
                                          '$n',
                                          style: TextStyle(
                                              color: white,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      child: IButton(
                                        onTap: () {
                                          badgeNumber.value++;
                                        },
                                        icon: IIcons.settings,
                                      ),
                                    );
                                  }),
                              SizedBox(
                                width: 10.w,
                              ),
                              const IButton(
                                icon: IIcons.coin,
                                text: ' 500',
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                  );
                }),
            // Opacity(
            //   opacity: 0.5,
            //   child: Container(width: w, height: h, child: Column(

            //     children: [
            //       Image.asset('assets/images/screen.jpg', fit: BoxFit.fitWidth,),
            //     ],
            //   ),),
            // )
          ],
        ));
  }
}
