import 'package:flutter/material.dart';

import '../../../../infrastructure/Providers/AssetsPathProvider.dart';

class WelcomeScaffold extends StatelessWidget {
  const WelcomeScaffold({Key? key, required this.body}) : super(key: key);
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsPathProvider().getBackground('welcome.png')),
            fit: BoxFit.cover,
          ),
        ),
        child: body,
      ),
    );
  }
}
