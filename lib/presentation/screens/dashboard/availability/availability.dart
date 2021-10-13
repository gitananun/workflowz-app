import 'package:flutter/material.dart';
import 'package:workflowz/presentation/extensions/date_time_extension.dart';
import 'package:workflowz/presentation/screens/dashboard/availability/components/availability_date_time_row.dart';
import 'package:workflowz/presentation/screens/dashboard/availability/scaffolds/availability_screen_scaffold.dart';
import 'package:workflowz/presentation/screens/shared/main_container.dart';
import 'package:workflowz/presentation/styles/custom_spaces.dart';
import 'package:workflowz/presentation/widgets/buttons/custom_small_centered_primary_button.dart';

class AvailabilityScreen extends StatelessWidget {
  AvailabilityScreen({Key? key}) : super(key: key);
  final TextEditingController _timeController = TextEditingController(
    text: '${TimeOfDay.now().hour}:${TimeOfDay.now().minute}',
  );
  final TextEditingController _dateController = TextEditingController(text: DateTime.now().getDate);

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return AvailabilityScreenScaffold(
      body: MainContainer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomSmallCenteredPrimaryButton(text: "I'm available", withBackground: true),
              CustomSpaces.verticalSpace,
              CustomSpaces.verticalSpace,
              Text('Or choose your availability hours', style: _themeData.textTheme.caption),
              CustomSpaces.verticalSpace,
              CustomSpaces.verticalSpace,
              AvailabilityDateTimeRow(dateController: _dateController, timeController: _timeController),
              CustomSpaces.verticalSpace,
              CustomSpaces.verticalSpace,
              CustomSmallCenteredPrimaryButton(text: 'Save', withBackground: true),
            ],
          ),
        ),
      ),
    );
  }
}
