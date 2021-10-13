import 'package:flutter/material.dart';

import '../../../../infrastructure/Validations/validators/EmailValidator.dart';
import '../../../Styles/custom_spaces.dart';
import '../../../screens/auth/layouts/auth_shared_layout.dart';
import '../../../screens/auth/layouts/auth_shared_scaffold.dart';
import '../../../widgets/form/form_button_with_back_icon_row.dart';
import '../../../widgets/form/text_fields/custom_text_form_field.dart';
import '../../shared/welcome_auth/welcome_auth_shared_logo_with_subtitle_column.dart';

class RecoverByEmailScreen extends StatelessWidget {
  const RecoverByEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SharedAuthScaffold(
      body: SharedAuthLayout(
        section1: WelcomeAuthSharedLogoWithSubtitleColumn('Please enter your email to receive recover code'),
        section2: Column(
          children: [
            CustomTextFormField(
              labelText: 'Email Address',
              validator: (value) => EmailValidator(value!).validate,
            ),
            CustomSpaces.verticalSpace,
            CustomSpaces.verticalSpace,
            FormButtonWithBackIconRow(
              buttonText: 'Confirm',
              onPressed: () => Navigator.pushNamed(context, '/new_password'),
            ),
          ],
        ),
      ),
    );
  }
}
