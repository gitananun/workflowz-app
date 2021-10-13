import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../infrastructure/Providers/AssetsPathProvider.dart';

class ProfileCircleAvatar extends StatelessWidget {
  const ProfileCircleAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: 80,
      backgroundColor: Colors.transparent,
      foregroundImage: AssetImage(AssetsPathProvider().getHome('profile.png')),
    );
  }
}
