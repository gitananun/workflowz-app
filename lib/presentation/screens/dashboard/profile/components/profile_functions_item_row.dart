import 'package:flutter/material.dart';
import '../../../../styles/custom_spaces.dart';

class ProfileFunctionsItemRow extends StatelessWidget {
  const ProfileFunctionsItemRow({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Icon(icon, color: _themeData.primaryColor, size: _themeData.textTheme.caption?.fontSize),
          CustomSpaces.horizontalSpace,
          Text(label, style: _themeData.textTheme.caption),
        ],
      ),
    );
  }
}
