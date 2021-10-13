import 'package:flutter/material.dart';

class AssignmentItemTitleSection extends StatelessWidget {
  const AssignmentItemTitleSection({
    Key? key,
    required this.name,
    required this.textStyle,
  }) : super(key: key);
  final TextStyle textStyle;
  final String name;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name, style: textStyle, maxLines: 1),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Text('montage', style: textStyle.copyWith(color: _themeData.primaryColor)),
            SizedBox(width: 10),
            Expanded(child: Divider(color: _themeData.primaryColor)),
          ],
        ),
      ],
    );
  }
}
