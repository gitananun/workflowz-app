import 'package:flutter/material.dart';

import '../../../../infrastructure/Validations/validators/PasswordValidator.dart';
import '../../../Styles/custom_text_form_field_style.dart';
import '../form_password_text_field_suffix_icon.dart';

class CustomPasswordTextFormField extends StatefulWidget {
  const CustomPasswordTextFormField({
    Key? key,
    this.onSaved,
    this.controller,
    this.labelText = 'Password',
  }) : super(key: key);
  final String? labelText;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;

  @override
  _CustomPasswordTextFormFieldState createState() => _CustomPasswordTextFormFieldState();
}

class _CustomPasswordTextFormFieldState extends State<CustomPasswordTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: widget.onSaved,
      obscureText: _obscureText,
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => PasswordValidator(value!).validate,
      style: CustomTextFormFieldStyle.mainTextStyle(context),
      decoration: CustomTextFormFieldStyle.inputDecoration(context).copyWith(
        labelText: widget.labelText,
        suffixIcon: GestureDetector(
          onTap: () => setState(() => _obscureText = !_obscureText),
          child: FormPasswordTextFieldSuffixIcon(obscure: _obscureText),
        ),
      ),
    );
  }
}
