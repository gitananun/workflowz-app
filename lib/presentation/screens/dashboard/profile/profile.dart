import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workflowz/logic/profile/bloc/profile_bloc.dart';
import 'package:workflowz/logic/profile/bloc/profile_state.dart';
import 'package:workflowz/presentation/screens/dashboard/profile/screens/personal_info.dart';
import 'package:workflowz/presentation/widgets/theme_switcher.dart';
import '../../../../infrastructure/actions/auth_actions.dart';

import '../../../../logic/session/bloc/session_cubit.dart';
import '../../../Styles/custom_spaces.dart';
import '../../../screens/shared/main_container.dart';
import 'components/profile_circle_avatar.dart';
import 'components/profile_functions_list_view.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final AuthActions _authActions = AuthActions();

  void _onSignOut(SessionCubit cubit) => _authActions.logOut(cubit);

  void _onPersonalInfo(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute<Widget>(
          builder: (_) => PersonalInfoScreen(profileBloc: context.read<ProfileBloc>()),
        ),
      );

  void _onChangePassword(BuildContext context) => Navigator.pushNamed(context, '/profile/change_password');

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return BlocBuilder<SessionCubit, SessionState>(
      buildWhen: (_, state) => state is AuthenticatedSession,
      builder: (context, state) {
        final user = (state as AuthenticatedSession).user;

        return Scaffold(
          floatingActionButton: ThemeSwitcher(),
          body: MainContainer(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProfileCircleAvatar(),
                  CustomSpaces.verticalSpace,
                  BlocBuilder<ProfileBloc, ProfileState>(
                    buildWhen: (_, state) => state is UpdatedProfile,
                    builder: (context, state) => Text(
                      state is UpdatedProfile ? state.user.getFullName : user.getFullName,
                      style: _themeData.textTheme.bodyText2,
                    ),
                  ),
                  CustomSpaces.verticalSpace,
                  ProfileFunctionsListView(
                    onPersonalInfo: () => _onPersonalInfo(context),
                    onChangePassword: () => _onChangePassword(context),
                    onSignOut: () => _onSignOut(context.read<SessionCubit>()),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
