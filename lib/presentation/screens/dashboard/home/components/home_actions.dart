import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeActions extends StatelessWidget {
  const HomeActions({Key? key, required this.onNotifications}) : super(key: key);
  final VoidCallback? onNotifications;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        children: [
          IconButton(
            onPressed: onNotifications,
            highlightColor: Colors.transparent,
            icon: FaIcon(FontAwesomeIcons.bell),
          ),
        ],
      ),
    );
  }
}
