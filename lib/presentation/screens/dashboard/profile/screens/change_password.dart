import 'package:flutter/material.dart';
import 'package:workflowz/presentation/screens/dashboard/profile/scaffolds/profile_screen_scaffold.dart';
import 'package:workflowz/presentation/screens/shared/main_container.dart';
import 'package:workflowz/presentation/styles/custom_spaces.dart';
import 'package:workflowz/presentation/widgets/buttons/custom_small_centered_primary_button.dart';
import 'package:workflowz/presentation/widgets/form/text_fields/custom_text_form_field.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _repeatPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return ProfileScreenScaffold(
      body: MainContainer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Change Password', style: _themeData.textTheme.caption),
              CustomSpaces.verticalSpace,
              CustomSpaces.verticalSpace,
              CustomTextFormField(
                validator: null,
                labelText: 'Current Password',
                controller: _currentPasswordController,
              ),
              CustomSpaces.verticalSpace,
              CustomTextFormField(
                validator: null,
                labelText: 'New Password',
                controller: _newPasswordController,
              ),
              CustomSpaces.verticalSpace,
              CustomTextFormField(
                validator: null,
                labelText: 'Repeat Password',
                controller: _repeatPasswordController,
              ),
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
