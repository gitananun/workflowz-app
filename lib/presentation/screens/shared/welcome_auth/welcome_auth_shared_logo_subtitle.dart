import 'package:flutter/material.dart';

class WelcomeAuthSharedLogoSubtitle extends StatelessWidget {
  const WelcomeAuthSharedLogoSubtitle(this.text, {Key? key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyText2?.apply(color: Colors.white),
    );
  }
}
