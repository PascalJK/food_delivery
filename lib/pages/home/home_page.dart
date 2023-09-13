import 'package:flutter/material.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const MainFoodPage(),
    const Center(child: Text('Test Page_1')),
    const Center(child: Text('Test Page_2')),
    const Center(child: Text('Test Page_3')),
  ];

  final List<BottomNavigationBarItem> _barItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
  ];

  void _onTapNav(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTapNav,
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.amberAccent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: _barItems,
      ),
    );
  }
}
