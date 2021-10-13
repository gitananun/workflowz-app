import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workflowz/presentation/extensions/date_time_extension.dart';
import '../suffixes/custom_suffix_button_row_divider_with_text.dart';
import 'custom_text_form_field.dart';

class CustomTimeTextFormField extends StatefulWidget {
  const CustomTimeTextFormField({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;

  @override
  _CustomTimeTextFormFieldState createState() => _CustomTimeTextFormFieldState();
}

class _CustomTimeTextFormFieldState extends State<CustomTimeTextFormField> {
  late TimeOfDay? _picked;
  TimeOfDay _time = TimeOfDay.now();
  String _period = TimeOfDay.now().getPeriod;

  /// Select Time
  Future<void> _selectTime(BuildContext context) async {
    await HapticFeedback.mediumImpact();
    FocusScope.of(context).requestFocus(FocusNode());
    _picked = await showTimePicker(
      context: context,
      initialTime: _time,
      builder: (BuildContext context, Widget? child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: child!,
      ),
    );

    if (_picked != null && _picked != _time) {
      setState(() {
        _time = _picked!;
        _period = _time.getPeriod;
        widget.controller.text = _time.format(context).split(' ').first;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: '',
      validator: null,
      controller: widget.controller,
      onTap: () => _selectTime(context),
      suffix: CustomSuffixButtonRowDividerWithText(text: _period),
    );
  }
}
