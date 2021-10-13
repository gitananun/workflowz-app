import 'package:flutter/material.dart';
import 'package:workflowz/presentation/screens/dashboard/planning/scaffolds/planning_screen_floating_action_button.dart';

class PlanningScreenScaffold extends StatelessWidget {
  const PlanningScreenScaffold({Key? key, required this.body}) : super(key: key);
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      floatingActionButton: PlanningScreenFloatingActionButton(),
    );
  }
}
