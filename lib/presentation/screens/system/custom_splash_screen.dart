import 'package:flutter/material.dart';
import '../../widgets/progress_indicators/custom_circular_progress_indicator.dart';

class CustomSplashScreen extends StatelessWidget {
  const CustomSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomCircularProgressIndicator(),
      ),
    );
  }
}
