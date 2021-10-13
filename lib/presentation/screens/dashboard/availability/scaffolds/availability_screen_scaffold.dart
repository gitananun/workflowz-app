import 'package:flutter/material.dart';
import 'package:workflowz/presentation/screens/dashboard/shared/dashboard_app_bar.dart';
import 'package:workflowz/presentation/widgets/buttons/custom_pop_screen_back_icon_button.dart';

class AvailabilityScreenScaffold extends StatelessWidget {
  const AvailabilityScreenScaffold({Key? key, required this.body}) : super(key: key);
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      appBar: DashboardAppBar(leading: CustomPopScreenBackIconButton()),
    );
  }
}
