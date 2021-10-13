import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class AssignmentReportSignature extends StatelessWidget {
  const AssignmentReportSignature({Key? key, required this.controller, required this.person}) : super(key: key);
  final SignatureController controller;
  final String person;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$person's Signature",
          style: _themeData.textTheme.caption?.apply(fontSizeDelta: -3, color: _themeData.primaryColor),
        ),
        SizedBox(height: 5),
        Stack(
          alignment: Alignment.topRight,
          children: [
            Signature(
              height: 200,
              controller: controller,
              width: double.infinity,
              backgroundColor: Colors.white,
            ),
            GestureDetector(
              onTap: controller.clear,
              child: Padding(padding: const EdgeInsets.all(5), child: Icon(Icons.clear)),
            ),
          ],
        ),
      ],
    );
  }
}
