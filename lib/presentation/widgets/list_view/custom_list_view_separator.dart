import 'package:flutter/material.dart';

class CustomListViewSeparator extends StatelessWidget {
  const CustomListViewSeparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 0,
      thickness: 0.2,
      color: Theme.of(context).accentColor,
    );
  }
}
