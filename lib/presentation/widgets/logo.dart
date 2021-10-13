import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../infrastructure/Providers/AssetsPathProvider.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AssetsPathProvider().getCompany('logo.svg'));
  }
}
