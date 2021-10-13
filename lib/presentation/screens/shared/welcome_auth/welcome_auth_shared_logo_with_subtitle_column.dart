import 'package:flutter/material.dart';

import '../../../Styles/custom_spaces.dart';
import 'welcome_auth_shared_logo_subtitle.dart';
import 'welcome_auth_shared_sized_logo.dart';

class WelcomeAuthSharedLogoWithSubtitleColumn extends StatelessWidget {
  const WelcomeAuthSharedLogoWithSubtitleColumn(this.text, {Key? key}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        WelcomeAuthSharedSizedLogo(),
        CustomSpaces.verticalSpace,
        WelcomeAuthSharedLogoSubtitle(text),
      ],
    );
  }
}
