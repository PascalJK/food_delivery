import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/account/account_page.dart';
import 'package:food_delivery/pages/cart/cart_history_page.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PersistentTabController(initialIndex: 0);

  final List<PersistentTabConfig> _tabs = [
    PersistentTabConfig(
      screen: const MainFoodPage(),
      item: ItemConfig(
        icon: const Icon(Icons.home_outlined),
        title: "Home",
        activeForegroundColor: AppColors.mainColor,
        inactiveBackgroundColor: CupertinoColors.systemGrey,
      ),
    ),
    PersistentTabConfig(
      screen: const Center(child: Text('Test Page_1')),
      item: ItemConfig(
        icon: const Icon(Icons.history),
        title: 'History',
        activeForegroundColor: AppColors.mainColor,
        inactiveBackgroundColor: CupertinoColors.systemGrey,
      ),
    ),
    PersistentTabConfig(
      screen: const CartHistoryPage(),
      item: ItemConfig(
        icon: const Icon(Icons.shopping_cart),
        title: 'Cart',
        activeForegroundColor: AppColors.mainColor,
        inactiveBackgroundColor: CupertinoColors.systemGrey,
      ),
    ),
    PersistentTabConfig(
      screen: const AccountPage(),
      item: ItemConfig(
        icon: const Icon(Icons.person),
        title: 'Account',
        activeForegroundColor: AppColors.mainColor,
        inactiveBackgroundColor: CupertinoColors.systemGrey,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      tabs: _tabs,
      navBarBuilder: (navBarConfig) => Style6BottomNavBar(
        navBarConfig: navBarConfig,
      ),
      resizeToAvoidBottomInset: true,
      // hideNavigationBarWhenKeyboardShows: true,
      // decoration: const NavBarDecoration(
      //   borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      //   colorBehindNavBar: Colors.white,
      // ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      // itemAnimationProperties: const ItemAnimationProperties(
      //   // Navigation Bar's items animation properties.
      //   duration: Duration(milliseconds: 200),
      //   curve: Curves.ease,
      // ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        curve: Curves.ease,
        duration: Duration(milliseconds: 450),
      ),
    );
  }
}
