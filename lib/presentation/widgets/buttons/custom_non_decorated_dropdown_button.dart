import 'package:flutter/material.dart';

import '../../Styles/custom_text_form_field_style.dart';

class CustomNonDecoratedDropdownButton extends StatefulWidget {
  const CustomNonDecoratedDropdownButton({Key? key, required this.options, required this.onChanged}) : super(key: key);
  final List<String> options;
  final void Function(String?)? onChanged;

  @override
  _CustomNonDecoratedDropdownButtonState createState() => _CustomNonDecoratedDropdownButtonState();
}

class _CustomNonDecoratedDropdownButtonState extends State<CustomNonDecoratedDropdownButton> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.options[0];
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      elevation: 0,
      value: dropdownValue,
      onChanged: widget.onChanged,
      dropdownColor: Theme.of(context).cardColor,
      icon: const Icon(Icons.keyboard_arrow_down),
      decoration: InputDecoration(border: InputBorder.none),
      style: CustomTextFormFieldStyle.mainTextStyle(context),
      items: widget.options.map((String value) => DropdownMenuItem(value: value, child: Text(value))).toList(),
    );
  }
}
