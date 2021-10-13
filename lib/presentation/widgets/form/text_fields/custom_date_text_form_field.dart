import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workflowz/presentation/extensions/date_time_extension.dart';
import 'package:workflowz/presentation/utils/dialog.dart';
import 'custom_text_form_field.dart';

class CustomDateTextFormField extends StatefulWidget {
  const CustomDateTextFormField({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;

  @override
  _CustomDateTextFormFieldState createState() => _CustomDateTextFormFieldState();
}

class _CustomDateTextFormFieldState extends State<CustomDateTextFormField> {
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    await HapticFeedback.mediumImpact();
    final DateTime? picked = await showCustomDatePicker(
      context: context,
      lastDate: DateTime(2101),
      initialDate: _selectedDate,
      firstDate: DateTime(_selectedDate.year, _selectedDate.month),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
        widget.controller.text = picked.getDate;
      });
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: '',
      validator: null,
      controller: widget.controller,
      onTap: () => _selectDate(context),
    );
  }
}
