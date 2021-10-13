import 'package:flutter/material.dart';

class CustomFancyFabRectItem extends StatelessWidget {
  const CustomFancyFabRectItem({
    Key? key,
    this.onTap,
    required this.label,
    required this.icon,
    this.additionalRightPadding = 0,
  }) : super(key: key);
  final GestureTapCallback? onTap;
  final String label;
  final IconData icon;
  final double additionalRightPadding;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(border: Border(right: BorderSide())),
        padding: EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10 + additionalRightPadding),
        child: Row(
          children: [
            Icon(icon, color: _themeData.accentColor, size: _themeData.textTheme.caption?.fontSize),
            SizedBox(width: 3),
            Text(label, style: _themeData.textTheme.caption?.apply(fontSizeDelta: -5)),
          ],
        ),
      ),
    );
  }
}
