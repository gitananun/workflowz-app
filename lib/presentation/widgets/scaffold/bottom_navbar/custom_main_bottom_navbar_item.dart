import 'package:flutter/material.dart';
import 'package:workflowz/presentation/theme/mts_theme.dart';

import '../../masks/custom_%20radiant_gradient_mask.dart';

class CustomMainBottomNavbarItem extends StatelessWidget {
  const CustomMainBottomNavbarItem(this.icon, this.label, {Key? key, this.active = false}) : super(key: key);
  final bool active;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 25),
      margin: const EdgeInsets.only(bottom: 5),
      width: MediaQuery.of(context).size.width / 5,
      decoration: BoxDecoration(
        color: active ? _themeData.canvasColor : Colors.transparent,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      ),
      child: Column(
        children: [
          CustomRadiantGradientMask(
            colors: active ? MTStheme.primaryGradientColors : [Colors.white, Colors.white],
            child: Icon(icon),
          ),
          SizedBox(height: 5),
          Text(label, style: TextStyle(fontSize: 10), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
