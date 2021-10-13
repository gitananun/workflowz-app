import 'package:flutter/material.dart';

import '../../../Styles/custom_spaces.dart';
import '../../../screens/auth/layouts/auth_shared_layout.dart';
import '../../../screens/auth/layouts/auth_shared_scaffold.dart';
import '../../../screens/shared/welcome_auth/welcome_auth_shared_logo_with_subtitle_column.dart';
import '../../../widgets/form/form_button_with_back_icon_row.dart';
import '../../../widgets/form/text_fields/custom_password_text_form_field.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SharedAuthScaffold(
      body: SharedAuthLayout(
        section1: WelcomeAuthSharedLogoWithSubtitleColumn('Enter the new password'),
        section2: Column(
          children: const [
            CustomPasswordTextFormField(labelText: 'New Password'),
            CustomSpaces.verticalSpace,
            CustomPasswordTextFormField(labelText: 'Repeat Password'),
            CustomSpaces.verticalSpace,
            CustomSpaces.verticalSpace,
            FormButtonWithBackIconRow(buttonText: 'Confirm'),
          ],
        ),
      ),
    );
  }
}
