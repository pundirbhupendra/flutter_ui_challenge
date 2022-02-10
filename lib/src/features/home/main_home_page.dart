import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_challenge/src/config/app_colors.dart';
import 'package:flutter_ui_challenge/src/presentation/shared/widget/custom_drawer.dart';
import 'package:flutter_ui_challenge/src/repository/package_repository.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../features.dart';
import 'cubit/package_data_cubit.dart';

class MianHome1 extends StatelessWidget {
  const MianHome1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => PackageDataCubit(PackageRepository()),
        child:const CommonDrawerPage(
          selectedId: 0,
          widgets:  MainHomePage(),
        ));
  }
}

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  late PersistentTabController _controller;
  late bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    context.read<PackageDataCubit>().loadPackage();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() {
    return [
      HomePage(),
      SizedBox(),
      SizedBox(),
      SizedBox(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Image.asset(
          'assets/home1.png',
          width: 30,
          height: 30,
        ),
        title: "Home",
        activeColorPrimary: kpink2Color,
        inactiveColorPrimary: Colors.grey,
        inactiveColorSecondary: Colors.purple,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          'assets/pack.png',
          width: 30,
          height: 30,
        ),
        title: ("Packages"),
        activeColorPrimary: kpink2Color,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
          icon: Image.asset(
            'assets/booking1.png',
            width: 30,
            height: 30,
          ),
          title: ("Bookings"),
          activeColorPrimary: kpink2Color,
          activeColorSecondary: Colors.white,
          inactiveColorPrimary: Colors.white,
          onPressed: (context) {}),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          'assets/profile1.png',
          width: 30,
          height: 30,
        ),
        title: ("Profile"),
        activeColorPrimary: kpink2Color,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
            ? 0.0
            : kBottomNavigationBarHeight,
        hideNavigationBarWhenKeyboardShows: true,
        margin: EdgeInsets.all(0.0),
        popActionScreens: PopActionScreensType.all,
        bottomScreenMargin: 0.0,
        onWillPop: (context) async {
          return false;
        },
        selectedTabScreenContext: (context) {},
        hideNavigationBar: _hideNavBar,
        decoration: NavBarDecoration(
            colorBehindNavBar: Colors.indigo,
            borderRadius: BorderRadius.circular(20.0)),
        popAllScreensOnTapOfSelectedTab: true,
        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style12, // Choose the nav bar style with this property
      ),
    );
  }
}
