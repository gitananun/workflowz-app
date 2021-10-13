import 'package:flutter/material.dart';
import 'package:workflowz/presentation/widgets/containers/custom_main_decorated_container.dart';
import 'package:workflowz/presentation/widgets/progress_indicators/custom_circular_progress_indicator.dart';

class CustomOverlayContainer extends StatelessWidget {
  const CustomOverlayContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomMainDecoratedContainer(
      opacity: 0.8,
      height: double.infinity,
      child: CustomCircularProgressIndicator(),
    );
  }
}
