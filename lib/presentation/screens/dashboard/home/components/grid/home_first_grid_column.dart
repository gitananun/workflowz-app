import 'package:flutter/material.dart';

import '../../../../../Styles/custom_spaces.dart';
import 'home_first_grid_container.dart';
import 'home_second_row_container.dart';

class HomeFirstGridColumn extends StatelessWidget {
  const HomeFirstGridColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        HomeFirstGridContainer(),
        CustomSpaces.verticalSpace,
        HomeGridSecondRowContainer(),
      ],
    );
  }
}
