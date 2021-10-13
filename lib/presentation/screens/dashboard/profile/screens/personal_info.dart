import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workflowz/domain/data/models/Address.dart';
import 'package:workflowz/domain/data/models/SelfInfo.dart';
import 'package:workflowz/domain/data/models/User.dart';
import 'package:workflowz/infrastructure/actions/profile_actions.dart';
import 'package:workflowz/infrastructure/validations/validators/EmailValidator.dart';
import 'package:workflowz/logic/profile/bloc/profile_bloc.dart';
import 'package:workflowz/logic/profile/bloc/profile_state.dart';
import 'package:workflowz/presentation/screens/dashboard/profile/components/profile_circle_avatar.dart';
import 'package:workflowz/presentation/screens/dashboard/profile/scaffolds/profile_screen_scaffold.dart';
import 'package:workflowz/presentation/screens/shared/main_container.dart';
import 'package:workflowz/presentation/styles/custom_spaces.dart';
import 'package:workflowz/presentation/widgets/buttons/custom_small_centered_primary_button.dart';
import 'package:workflowz/presentation/widgets/form/text_fields/custom_text_form_field.dart';
import 'package:workflowz/presentation/widgets/snackbar/custom_snackbars.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({Key? key, required this.profileBloc}) : super(key: key);
  final ProfileBloc profileBloc;
  @override
  _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _emailController;
  late TextEditingController _regionController;
  late TextEditingController _addressController;
  late TextEditingController _postCodeController;
  late TextEditingController _fullNameController;
  late TextEditingController _phoneNumberController;

  @override
  void initState() {
    super.initState();
    _resolveFormControllers();
    _formKey = GlobalKey<FormState>();
  }

  void _resolveFormControllers() {
    User profile = widget.profileBloc.profile;

    if (widget.profileBloc.state is UpdatedProfile) profile = (widget.profileBloc.state as UpdatedProfile).user;

    _emailController = TextEditingController(text: profile.email);
    _regionController = TextEditingController(text: profile.address?.region);
    _addressController = TextEditingController(text: profile.address?.street);
    _phoneNumberController = TextEditingController(text: profile.mobileNumber);
    _postCodeController = TextEditingController(text: profile.address?.postcode);
    _fullNameController = TextEditingController(text: '${profile.firstName} ${profile.lastName}');
  }

  void _onSubmit(BuildContext context) {
    HapticFeedback.mediumImpact();
    final ProfileActions profileActions = ProfileActions();
    profileActions.update(
      bloc: context.read<ProfileBloc>(),
      selfInfo: SelfInfo(
        email: _emailController.text,
        mobileNumber: _phoneNumberController.text,
        lastName: _fullNameController.text.split(' ').last,
        firstName: _fullNameController.text.split(' ').first,
        address: Address(
          region: _regionController.text,
          street: _addressController.text,
          postcode: _postCodeController.text,
        ),
      ),
    );
  }

  void _resolveListener(BuildContext context, ProfileState state) {
    final CustomSnackbars _snackbars = CustomSnackbars(context);
    _snackbars.showMessageSnackbar('Profile updated successfully');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.profileBloc,
      child: ProfileScreenScaffold(
        body: BlocConsumer<ProfileBloc, ProfileState>(
          listener: _resolveListener,
          listenWhen: (_, state) => state is UpdatedProfile,
          buildWhen: (_, state) => state is UpdatedProfile,
          builder: (context, state) {
            return MainContainer(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      ProfileCircleAvatar(),
                      CustomSpaces.verticalSpace,
                      CustomSpaces.verticalSpace,
                      CustomTextFormField(
                        validator: null,
                        labelText: 'Name Surname',
                        controller: _fullNameController,
                      ),
                      CustomSpaces.verticalSpace,
                      // PersonalInfoBirthdayFormSection(),
                      CustomSpaces.verticalSpace,
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              validator: null,
                              labelText: 'Region',
                              controller: _regionController,
                            ),
                          ),
                          CustomSpaces.horizontalSpace,
                          Expanded(
                            child: CustomTextFormField(
                              validator: null,
                              labelText: 'Post Code',
                              controller: _postCodeController,
                            ),
                          ),
                        ],
                      ),
                      CustomSpaces.verticalSpace,
                      CustomTextFormField(
                        validator: null,
                        labelText: 'Address',
                        controller: _addressController,
                      ),
                      CustomSpaces.verticalSpace,
                      CustomTextFormField(
                        labelText: 'Email Address',
                        controller: _emailController,
                        validator: (v) => EmailValidator(v!).validate,
                      ),
                      CustomSpaces.verticalSpace,
                      CustomTextFormField(
                        validator: null,
                        labelText: 'Phone Number',
                        controller: _phoneNumberController,
                      ),
                      CustomSpaces.verticalSpace,
                      BlocBuilder<ProfileBloc, ProfileState>(
                        builder: (context, state) => CustomSmallCenteredPrimaryButton(
                          withBackground: true,
                          onPressed: () => _onSubmit(context),
                          text: state is ProfileInProgress ? 'Saving...' : 'Save',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
