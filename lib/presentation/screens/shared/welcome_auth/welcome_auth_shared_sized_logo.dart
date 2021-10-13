import 'package:flutter/material.dart';

import '../../../widgets/logo.dart';

class WelcomeAuthSharedSizedLogo extends StatelessWidget {
  const WelcomeAuthSharedSizedLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 120,
      child: Logo(),
    );
  }
}
