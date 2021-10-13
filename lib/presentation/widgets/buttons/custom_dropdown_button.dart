import 'package:flutter/material.dart';

import '../../Styles/custom_text_form_field_style.dart';

class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton({Key? key, required this.options, required this.onChanged}) : super(key: key);
  final List<String> options;
  final void Function(String?)? onChanged;

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      value: widget.options[0],
      onChanged: widget.onChanged,
      dropdownColor: Theme.of(context).cardColor,
      icon: const Icon(Icons.keyboard_arrow_down),
      style: CustomTextFormFieldStyle.mainTextStyle(context),
      decoration: CustomTextFormFieldStyle.inputDecoration(context),
      items: widget.options.map((String value) => DropdownMenuItem(value: value, child: Text(value))).toList(),
    );
  }
}
