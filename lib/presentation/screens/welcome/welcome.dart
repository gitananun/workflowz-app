import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/session/bloc/session_cubit.dart';
import '../../Styles/custom_spaces.dart';
import '../../screens/shared/welcome_auth/welcome_auth_shared_logo_with_subtitle_column.dart';
import '../../screens/welcome/layouts/welcome_layout.dart';
import '../../screens/welcome/layouts/welcome_scaffold.dart';
import '../../widgets/buttons/custom_primary_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WelcomeScaffold(
      body: WelcomeLayout(
        section1: WelcomeAuthSharedLogoWithSubtitleColumn('Welcome to Workflowz'),
        section2: BlocConsumer<SessionCubit, SessionState>(
          listenWhen: (_, state) => state is AuthenticatedSession,
          listener: (context, state) => Navigator.pushNamed(context, '/dashboard'),
          builder: (context, state) {
            return Container(
              width: 200,
              padding: const EdgeInsets.only(bottom: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomPrimaryButton(
                    text: 'Sign In',
                    withBackground: true,
                    onPressed: () => Navigator.pushNamed(context, '/sign_in'),
                  ),
                  CustomSpaces.verticalSpace,
                  CustomPrimaryButton(
                    text: 'Sign Up',
                    onPressed: () => Navigator.pushNamed(context, '/sign_up'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
