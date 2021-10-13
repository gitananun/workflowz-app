import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../widgets/buttons/custom_rect_icon_button.dart';
import '../../../../../widgets/form/suffixes/custom_suffix_button_row_divider_with_text.dart';
import '../../../../../widgets/form/text_fields/custom_text_form_field.dart';

class AssignmentCommentFormWithFileAttach extends StatelessWidget {
  const AssignmentCommentFormWithFileAttach({Key? key, required this.controller, this.onPressed}) : super(key: key);
  final TextEditingController controller;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomRectIconButton(icon: FontAwesomeIcons.link, onPressed: onPressed),
        SizedBox(width: 10),
        Expanded(
          child: CustomTextFormField(
            validator: null,
            controller: controller,
            labelText: 'Write Comment',
            suffix: CustomSuffixButtonRowDividerWithText(text: 'Add Comment'),
          ),
        )
      ],
    );
  }
}
