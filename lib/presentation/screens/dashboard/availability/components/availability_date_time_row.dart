import 'package:flutter/material.dart';
import 'package:workflowz/presentation/styles/custom_spaces.dart';
import 'package:workflowz/presentation/widgets/form/text_fields/custom_date_text_form_field.dart';
import 'package:workflowz/presentation/widgets/form/text_fields/custom_time_text_form_field.dart';

class AvailabilityDateTimeRow extends StatelessWidget {
  const AvailabilityDateTimeRow({
    Key? key,
    required this.dateController,
    required this.timeController,
  }) : super(key: key);
  final TextEditingController dateController;
  final TextEditingController timeController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          Expanded(child: CustomDateTextFormField(controller: dateController)),
          CustomSpaces.horizontalSpace,
          Expanded(child: CustomTimeTextFormField(controller: timeController)),
        ],
      ),
    );
  }
}
