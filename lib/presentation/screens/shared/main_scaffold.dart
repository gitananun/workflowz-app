import 'package:flutter/material.dart';

import '../../Common/navbarDetails.dart';
import '../../widgets/scaffold/bottom_navbar/custom_main_bottom_navbar.dart';
import '../../widgets/scaffold/bottom_navbar/custom_main_bottom_navbar_item.dart';
import '../dashboard/shared/dashboard_app_bar.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({
    Key? key,
    required this.body,
    required this.onTap,
    required this.currentIndex,
  }) : super(key: key);
  final ValueChanged<int>? onTap;
  final int currentIndex;
  final Widget body;

  final _navbarIcons = navbarIcons;
  final _navbarLabels = navbarLabels;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: body),
      appBar: DashboardAppBar(),
      bottomNavigationBar: CustomMainBottomNavbar(
        onTap: onTap,
        currentIndex: currentIndex,
        items: [
          _bottomNavbarItem(_navbarIcons[0], _navbarLabels[0]),
          _bottomNavbarItem(_navbarIcons[1], _navbarLabels[1]),
          _bottomNavbarItem(_navbarIcons[2], _navbarLabels[2]),
          _bottomNavbarItem(_navbarIcons[3], _navbarLabels[3]),
        ],
      ),
    );
  }
}

BottomNavigationBarItem _bottomNavbarItem(IconData icon, String label) => BottomNavigationBarItem(
      label: '',
      tooltip: '',
      icon: CustomMainBottomNavbarItem(icon, label),
      activeIcon: CustomMainBottomNavbarItem(icon, label, active: true),
    );
