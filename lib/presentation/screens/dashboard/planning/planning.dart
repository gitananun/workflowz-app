import 'package:flutter/material.dart';
import 'package:workflowz/presentation/screens/dashboard/planning/scaffolds/planning_screen_scaffold.dart';

import '../../../../domain/data/mock/mock_plannings.dart';
import '../../../Styles/custom_spaces.dart';
import '../../../Utils/utils.dart';
import '../../../screens/shared/main_container.dart';
import '../../../widgets/buttons/custom_non_decorated_dropdown_button.dart';
import 'components/planning_list_view_single_item.dart';

class PlanningScreen extends StatefulWidget {
  const PlanningScreen({Key? key}) : super(key: key);

  @override
  _PlanningScreenState createState() => _PlanningScreenState();
}

class _PlanningScreenState extends State<PlanningScreen> {
  late List<dynamic> _planningList;
  late Map<String, dynamic> _sortedData;
  final List<String> _options = const ['This Week', 'This Month'];

  @override
  void initState() {
    super.initState();
    _sortedData = categorizeMapByKeys(_options, mockPlannings);

    _planningList = _sortedData[_sortedData.keys.first] as List<dynamic>;
  }

  @override
  Widget build(BuildContext context) {
    return PlanningScreenScaffold(
      body: MainContainer(
        child: Column(
          children: [
            IntrinsicWidth(
              child: CustomNonDecoratedDropdownButton(
                options: _options,
                onChanged: (String? v) => setState(() => _planningList = _sortedData[v] as List<dynamic>),
              ),
            ),
            CustomSpaces.verticalSpace,
            CustomSpaces.verticalSpace,
            ListView.builder(
              shrinkWrap: true,
              itemCount: _planningList.length,
              itemBuilder: (BuildContext context, int i) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: PlanningListViewSingleItem(
                    address: _planningList[i]['address'] as String,
                    title: _planningList[i]['title'] as String,
                    date: _planningList[i]['date'] as String,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
