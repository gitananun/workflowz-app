import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../infrastructure/Validations/validators/EmailValidator.dart';
import '../../../../infrastructure/actions/auth_actions.dart';
import '../../../../infrastructure/exceptions/http/auth/ApiAuthInternalServerException.dart';
import '../../../../infrastructure/exceptions/http/auth/ApiAuthRepositoryException.dart';
import '../../../../infrastructure/exceptions/http/auth/ApiAuthRepositoryLoginException.dart';
import '../../../../logic/auth/api_auth_repository.dart';
import '../../../../logic/auth/api_user_repository.dart';
import '../../../../logic/auth/form_submission_status.dart';
import '../../../../logic/auth/login/bloc/login_bloc.dart';
import '../../../../logic/auth/login/bloc/login_state.dart';
import '../../../../logic/session/bloc/session_cubit.dart';
import '../../../Styles/custom_spaces.dart';
import '../../../screens/auth/layouts/auth_shared_layout.dart';
import '../../../screens/auth/layouts/auth_shared_scaffold.dart';
import '../../../screens/shared/welcome_auth/welcome_auth_shared_logo_with_subtitle_column.dart';
import '../../../widgets/form/form_button_with_back_icon_row.dart';
import '../../../widgets/form/form_forgot_password.dart';
import '../../../widgets/form/text_fields/custom_password_text_form_field.dart';
import '../../../widgets/form/text_fields/custom_text_form_field.dart';
import '../../../widgets/progress_indicators/custom_circular_progress_indicator.dart';
import '../../../widgets/snackbar/custom_snackbars.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthActions _authActions = AuthActions();
  final _storage = FlutterSecureStorage();
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      _authActions.login(
        email: _emailController.text,
        bloc: context.read<LoginBloc>(),
        password: _passwordController.text,
      );
    }
  }

  void _submissionFailed(BuildContext context, LoginState state) {
    final SubmissionFailed _failedState = state.formStatus as SubmissionFailed;
    final CustomSnackbars _snackbars = CustomSnackbars(context);

    if (_failedState.e is ApiAuthRepositoryLoginException) {
      final e = _failedState.e as ApiAuthRepositoryLoginException;
      _snackbars.showMessageSnackbar(e.message);
    } else if (_failedState.e is ApiAuthInternalServerException || _failedState.e is ApiAuthRepositoryException)
      _snackbars.showUnexpectedSnackbar();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SessionCubit, SessionState>(
      listenWhen: (context, sessionState) => sessionState is AuthenticatedSession,
      listener: (context, __) => Navigator.pushNamed(context, '/dashboard'),
      builder: (context, sessionState) {
        return SharedAuthScaffold(
          body: SharedAuthLayout(
            section1: WelcomeAuthSharedLogoWithSubtitleColumn('Welcome back!'),
            section2: BlocProvider.value(
              value: LoginBloc(
                authRepo: context.read<ApiAuthRepository>(),
                userRepo: context.read<ApiUserRepository>(),
                sessionCubit: context.read<SessionCubit>(),
                storage: _storage,
              ),
              child: BlocListener<LoginBloc, LoginState>(
                listenWhen: (_, state) => state.formStatus is SubmissionFailed,
                listener: _submissionFailed,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        labelText: 'Email Address',
                        validator: (value) => EmailValidator(value!).validate,
                        controller: _emailController,
                      ),
                      CustomSpaces.verticalSpace,
                      CustomPasswordTextFormField(controller: _passwordController),
                      CustomSpaces.verticalSpace,
                      FormForgotPassword(),
                      CustomSpaces.verticalSpace,
                      CustomSpaces.verticalSpace,
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) => state.formStatus is FormSubmitting
                            ? CustomCircularProgressIndicator()
                            : FormButtonWithBackIconRow(
                                buttonText: 'Sign In',
                                onPressed: () => _submit(context),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
