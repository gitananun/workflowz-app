import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FormPasswordTextFieldSuffixIcon extends StatelessWidget {
  const FormPasswordTextFieldSuffixIcon({
    Key? key,
    this.size,
    this.color,
    required this.obscure,
  }) : super(key: key);
  final double? size;
  final Color? color;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Icon(
      obscure ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
      color: color ?? Colors.white,
      size: size ?? Theme.of(context).textTheme.overline?.fontSize,
    );
  }
}
