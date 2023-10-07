import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projecty/icons.dart';
import 'package:projecty/log.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      ),
      home: const MyHomePage(),
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
    return Scaffold(
        backgroundColor: grey,
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
                padding: const EdgeInsets.only(top: 160),
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                controller: headerScroll,
                shrinkWrap: true,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: w,
                        margin: const EdgeInsets.only(top: 28),
                        padding: const EdgeInsets.only(
                            top: 82, left: 20, right: 15, bottom: 19),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Евгений Гдюжъ ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SvgPicture.asset(IIcons.verify)
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(IIcons.id),
                                const Text(
                                  " nedvijimostexpert",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Text(
                                        "Занимаю в этой компании должность риелтора, продаю квартиры, как пирожки. живу ради этого"))
                              ],
                            ),
                            SizedBox(
                              height: 14,
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
                        padding: const EdgeInsets.symmetric(horizontal: 15),
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
                                      return Container(
                                        width: 60 + (40 * (1 - t)),
                                        height: 60 + (40 * (1 - t)),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                width: 3, color: white)),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Image.asset(
                                            'assets/images/avatar.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                    }),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 4),
                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Text(
                                        "lv.3",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                      const Text(
                                        " 60,30%",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 9),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 10),
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
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 22),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
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
                              width: 18,
                            ),
                            InfoWidget(
                              icon: IIcons.light,
                              text: "Рейтинг",
                              count: 0,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
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
                      padding: const EdgeInsets.all(15),
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
                                      badgeContent: Text(
                                        '$n',
                                        style: TextStyle(
                                            color: white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      child: IButton(
                                        onTap: () {
                                          badgeNumber.value++;
                                        },
                                        icon: IIcons.settings,
                                      ),
                                    );
                                  }),
                              const SizedBox(
                                width: 10,
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
          ],
        ));
  }
}

class Tabs extends StatefulWidget {
  const Tabs({
    Key? key,
  }) : super(key: key);

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> with SingleTickerProviderStateMixin {
  final tabs = [
    Tab(text: 'Коммерч', height: 30),
    Tab(text: 'Квартиры', height: 30),
    Tab(text: 'Торги', height: 30),
  ];
  late var tabController = TabController(length: tabs.length, vsync: this);
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      width: w,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TabBar(
                  indicatorPadding: EdgeInsets.zero,
                  padding: EdgeInsets.only(right: 10, bottom: 5),
                  isScrollable: true,
                  controller: tabController,
                  tabs: tabs,
                  labelColor: black,
                  indicatorWeight: 3,
                  indicatorColor: black,
                  unselectedLabelColor: darkgrey,
                  indicatorSize: TabBarIndicatorSize.label,
                ),
              ),
              Center(
                child: SvgPicture.asset(IIcons.panel),
              )
            ],
          ),
          Divider(
            color: grey,
            height: 3,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              SvgPicture.asset(IIcons.card),
              Text('  Хранилище  ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              SvgPicture.asset(IIcons.arrowRight)
            ]),
          ),
        ],
      ),
    );
  }
}

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
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 11),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: grey,
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            SizedBox(
              width: 7,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$count",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    text,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                    style: TextStyle(color: darkgrey, fontSize: 12),
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

class Counter extends StatelessWidget {
  const Counter({Key? key, required this.count, required this.text})
      : super(key: key);
  final String count;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Text(
            count,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.normal, fontSize: 12, color: darkgrey),
          ),
        ],
      ),
    );
  }
}

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) {
        Log.success("TAPUP");
        pressed.value = true;
      },
      onTapDown: (details) {
        Log.success("TAPDOWN");
        pressed.value = false;
      },
      onTap: widget.onTap,
      child: ValueListenableBuilder(
          valueListenable: pressed,
          builder: (context, p, _) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                        color: black, offset: Offset(p ? 3 : 0, p ? 3 : 0))
                  ],
                  border: Border.all(width: 2, color: black),
                  borderRadius: BorderRadius.circular(12)),
              padding: EdgeInsets.all(p ? 7 : 5),
              child: Row(
                children: [
                  if (widget.icon != null)
                    SvgPicture.asset(
                      widget.icon!,
                    ),
                  if (widget.text != null)
                    Text(
                      widget.text!,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    )
                ],
              ),
            );
          }),
    );
  }
}

var black = Colors.black;
var grey = const Color(0xffF8F8F7);
var darkgrey = const Color(0xff8B8B8B);
var white = Colors.white;
