import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/valueObjects/BaseEmail.dart';
import '../../../../domain/valueObjects/BasePassword.dart';
import '../../../../infrastructure/Validations/validators/EmailValidator.dart';
import '../../../../infrastructure/exceptions/http/auth/ApiAuthInternalServerException.dart';
import '../../../../logic/auth/api_auth_repository.dart';
import '../../../../logic/auth/form_submission_status.dart';
import '../../../../logic/auth/signup/bloc/signup_bloc.dart';
import '../../../../logic/auth/signup/bloc/signup_event.dart';
import '../../../../logic/auth/signup/bloc/signup_state.dart';
import '../../../../logic/session/bloc/session_cubit.dart';
import '../../../Styles/custom_spaces.dart';
import '../../../screens/auth/layouts/auth_shared_layout.dart';
import '../../../screens/auth/layouts/auth_shared_scaffold.dart';
import '../../../screens/shared/welcome_auth/welcome_auth_shared_logo_with_subtitle_column.dart';
import '../../../widgets/form/form_button_with_back_icon_row.dart';
import '../../../widgets/form/text_fields/custom_password_text_form_field.dart';
import '../../../widgets/form/text_fields/custom_text_form_field.dart';
import '../../../widgets/progress_indicators/custom_circular_progress_indicator.dart';
import '../../../widgets/snackbar/custom_snackbars.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late CustomSnackbars _customSnackbars;

  @override
  void initState() {
    super.initState();
    _customSnackbars = CustomSnackbars(context);
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      context.read<SignupBloc>().add(
            SignupSubmitted(
              email: BaseEmail(_emailController.text),
              password: BasePassword(_passwordController.text),
              confirmPassword: BasePassword(_confirmPasswordController.text),
            ),
          );
    }
  }

  void _submissionFailed(SubmissionFailed state) {
    if (state.e is ApiAuthInternalServerException) _customSnackbars.showUnexpectedSnackbar();
  }

  @override
  Widget build(BuildContext context) {
    return SharedAuthScaffold(
      body: SharedAuthLayout(
        section1: WelcomeAuthSharedLogoWithSubtitleColumn('Welcome on Board!'),
        section2: BlocProvider(
          create: (context) => SignupBloc(
            authRepo: context.read<ApiAuthRepository>(),
            sessionCubit: context.read<SessionCubit>(),
          ),
          child: BlocListener<SignupBloc, SignupState>(
            listenWhen: (_, state) => state.formStatus is SubmissionFailed,
            listener: (_, state) => _submissionFailed(state.formStatus as SubmissionFailed),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    labelText: 'Email Address',
                    controller: _emailController,
                    validator: (value) => EmailValidator(value!).validate,
                  ),
                  CustomSpaces.verticalSpace,
                  CustomPasswordTextFormField(controller: _passwordController),
                  CustomSpaces.verticalSpace,
                  CustomPasswordTextFormField(
                    labelText: 'Repeat password',
                    controller: _confirmPasswordController,
                  ),
                  CustomSpaces.verticalSpace,
                  CustomSpaces.verticalSpace,
                  BlocBuilder<SignupBloc, SignupState>(
                    builder: (ctx, state) => state.formStatus is FormSubmitting
                        ? CustomCircularProgressIndicator()
                        : FormButtonWithBackIconRow(
                            buttonText: 'Sign Up',
                            onPressed: () => _submit(ctx),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
