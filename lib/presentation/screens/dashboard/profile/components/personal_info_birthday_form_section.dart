import 'package:flutter/material.dart';
import 'package:workflowz/presentation/styles/custom_spaces.dart';
import 'package:workflowz/presentation/widgets/form/text_fields/custom_text_form_field.dart';

class PersonalInfoBirthdayFormSection extends StatelessWidget {
  const PersonalInfoBirthdayFormSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text('Birthday', style: _themeData.textTheme.caption?.apply(fontSizeDelta: -2)),
        ),
        CustomSpaces.verticalSpace,
        Row(
          children: const [
            Expanded(child: CustomTextFormField(labelText: 'Day', validator: null)),
            CustomSpaces.horizontalSpace,
            Expanded(child: CustomTextFormField(labelText: 'Month', validator: null)),
            CustomSpaces.horizontalSpace,
            Expanded(child: CustomTextFormField(labelText: 'Year', validator: null)),
          ],
        ),
      ],
    );
  }
}
