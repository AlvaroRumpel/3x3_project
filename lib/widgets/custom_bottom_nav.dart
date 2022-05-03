import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNav extends StatelessWidget {
  int index;

  CustomBottomNav({
    Key? key,
    required this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'Histórico',
        ),
        BottomNavigationBarItem(
          label: 'text',
          icon: Icon(Icons.home),
        ),
      ],
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: const Color(0xffefefef),
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: const IconThemeData(size: 40),
      showUnselectedLabels: false,
      currentIndex: index,
      onTap: onTap,
    );
  }

  void onTap(int index) {
    switch (index) {
      case 0:
        Get.currentRoute != '/home' && Get.currentRoute != '/'
            ? Get.toNamed('/home')
            : null;
        break;
      case 1:
        Get.toNamed('/');
        break;
      case 2:
        Get.toNamed('/');
        break;
      default:
        Get.toNamed('/home');
    }
  }
}
