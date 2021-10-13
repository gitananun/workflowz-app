import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomArrowBackIconGestureDetector extends StatelessWidget {
  const CustomArrowBackIconGestureDetector({Key? key, required this.onTap}) : super(key: key);
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: FaIcon(
        Icons.arrow_back_outlined,
        size: 30,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
