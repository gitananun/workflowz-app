import 'package:flutter/material.dart';
import 'package:workflowz/presentation/theme/mts_theme.dart';

class CustomCircularGradientIconButton extends StatelessWidget {
  const CustomCircularGradientIconButton({
    Key? key,
    this.text,
    this.icon,
    this.size,
    this.onTap,
  }) : super(key: key);
  final String? text;
  final double? size;
  final IconData? icon;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 20,
      onTap: onTap ?? () {},
      borderRadius: BorderRadius.circular(100),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: MTStheme.primaryGradientColors,
          ),
        ),
        padding: EdgeInsets.all(size ?? 20),
        child: Column(
          children: [
            Icon(icon, color: Colors.white),
            if (text != null)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(text!, style: Theme.of(context).textTheme.caption),
              )
            else
              SizedBox(),
          ],
        ),
      ),
    );
  }
}
