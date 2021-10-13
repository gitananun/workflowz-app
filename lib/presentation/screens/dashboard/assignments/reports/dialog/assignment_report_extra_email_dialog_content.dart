import 'package:flutter/material.dart';
import 'package:workflowz/infrastructure/validations/validators/EmailValidator.dart';
import 'package:workflowz/presentation/widgets/form/text_fields/custom_text_form_field.dart';

class AssignmentReportExtraEmailDialogContent extends StatelessWidget {
  const AssignmentReportExtraEmailDialogContent({Key? key, required this.emailController}) : super(key: key);
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: 'Email',
      controller: emailController,
      validator: (v) => EmailValidator(v!).validate,
    );
  }
}
