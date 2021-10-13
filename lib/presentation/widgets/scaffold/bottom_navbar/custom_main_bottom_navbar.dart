import 'package:flutter/material.dart';

class CustomMainBottomNavbar extends StatelessWidget {
  const CustomMainBottomNavbar({
    Key? key,
    required this.items,
    required this.onTap,
    required this.currentIndex,
  }) : super(key: key);
  final List<BottomNavigationBarItem> items;
  final ValueChanged<int>? onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return BottomNavigationBar(
      elevation: 0,
      iconSize: 25,
      selectedFontSize: 0,
      currentIndex: currentIndex,
      selectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: _themeData.accentColor,
      backgroundColor: Theme.of(context).cardColor,
      onTap: onTap,
      items: items,
    );
  }
}
