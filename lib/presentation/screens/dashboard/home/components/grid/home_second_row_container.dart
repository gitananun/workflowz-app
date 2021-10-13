import 'package:flutter/material.dart';

import '../../../../../Styles/custom_spaces.dart';
import 'components/home_grid_second_row_container_left_container.dart';
import 'components/home_grid_second_row_container_right_container.dart';

class HomeGridSecondRowContainer extends StatelessWidget {
  const HomeGridSecondRowContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Expanded(child: HomeGridSecondRowContainerLeftContainer()),
          CustomSpaces.horizontalSpace,
          Expanded(child: HomeGridSecondRowContainerRightContainer()),
        ],
      ),
    );
  }
}
