import 'package:careercraft/constant/constant.dart';
import 'package:careercraft/src/screen/career/career.dart';
import 'package:careercraft/src/screen/community/community.dart';
import 'package:careercraft/src/screen/counsellor/counsellor.dart';
import 'package:careercraft/src/screen/news/news.dart';
import 'package:careercraft/src/screen/user/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatefulWidget {
  final int index;

  const HomePage({Key? key, required this.index}) : super(key: key);

  @override
  HomePageState createState() => HomePageState(index: index);
}

class HomePageState extends State<HomePage> {
  static int currentIndex = 0;
  final int index;
  HomePageState({required this.index});
  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  @override
  void initState() {
    super.initState();
    currentIndex = widget.index;
    print(currentIndex);
  }

  Widget build(BuildContext context) {
    List<Widget> bodyList = [
      CareerPage(),
      NewsPage(),
      CommunityPage(),
      Counsellor(),
      UserPage(),
    ];
    return SafeArea(
      child: PersistentTabView(context,
          navBarHeight: 60,
          controller: controller,
          screens: bodyList,
          items: _navBarsItems(context),
          confineInSafeArea: true,
          backgroundColor: primaryColor, // Default is Colors.white.
          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset:
              true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardShows:
              true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          decoration: NavBarDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, -2),
                color: const Color.fromARGB(255, 194, 194, 194),
                spreadRadius: 1.sp,
                blurRadius: 2.sp,
              )
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.sp),
              topRight: Radius.circular(16.sp),
            ),
            // colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style9),
    );
  }
}

List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
  return [
    PersistentBottomNavBarItem(
      icon: Icon(Icons.home_rounded),
      title: "Home",
      activeColorPrimary: primary2,
      inactiveColorPrimary: greyColor,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.newspaper_outlined),
      title: "News",
      activeColorPrimary:  primary2,
      inactiveColorPrimary: greyColor,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.comment),
      title: "Community",
      activeColorPrimary:  primary2,
      inactiveColorPrimary: greyColor,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.person_2),
      title: "Counsellor",
      activeColorPrimary:  primary2,
      inactiveColorPrimary: greyColor,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.person),
      title: "User",
      activeColorPrimary:  primary2,
      inactiveColorPrimary: greyColor,
    ),
  ];
}
//