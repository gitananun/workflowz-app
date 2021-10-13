import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../Styles/custom_text_form_field_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.onTap,
    this.suffix,
    this.onSaved,
    this.onChanged,
    this.controller,
    this.textInputType,
    this.readOnly = false,
    required this.labelText,
    required this.validator,
    this.textInputAction = TextInputAction.next,
  }) : super(key: key);

  final bool readOnly;
  final Widget? suffix;
  final String labelText;
  final GestureTapCallback? onTap;
  final TextInputType? textInputType;
  final ValueChanged<String>? onChanged;
  final void Function(String?)? onSaved;
  final TextInputAction textInputAction;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      onSaved: onSaved,
      readOnly: readOnly,
      autocorrect: false,
      onChanged: onChanged,
      validator: validator,
      controller: controller,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: CustomTextFormFieldStyle.mainTextStyle(context),
      decoration: CustomTextFormFieldStyle.inputDecoration(context).copyWith(
        labelText: labelText,
        suffix: suffix,
      ),
    );
  }
}
