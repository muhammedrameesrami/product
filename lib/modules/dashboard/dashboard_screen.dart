import 'package:flutter/material.dart';
import 'package:product/util_constant/image_constants.dart';
import '../../util_constant/color_constants.dart';
import '../home/home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const Center(child: Text("Categories")),
    const Center(child: Text("Cart")),
    const Center(child: Text("Profile")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: ColorConstants.buttonColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items:  [
          BottomNavigationBarItem(
            icon: Image.asset(ImageConstants.home, color: _currentIndex == 0 ? ColorConstants.buttonColor : Colors.grey,),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon:Image.asset(ImageConstants.category2, color: _currentIndex == 1 ? ColorConstants.buttonColor : Colors.grey,),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(ImageConstants.cart2, color: _currentIndex == 2 ? ColorConstants.buttonColor : Colors.grey,),
            // activeIcon:  Image.asset(ImageConstants.cart2),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon:Image.asset(ImageConstants.profile, color: _currentIndex == 3? ColorConstants.buttonColor : Colors.grey,),
            // activeIcon:Image.asset(ImageConstants.profile),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
