import 'package:flutter/material.dart';

class HomeWelcomeText extends StatelessWidget {
  const HomeWelcomeText({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Hi $name!',
      style: Theme.of(context).textTheme.bodyText2,
    );
  }
}
