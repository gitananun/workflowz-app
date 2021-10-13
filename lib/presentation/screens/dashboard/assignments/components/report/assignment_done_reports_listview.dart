import 'package:flutter/material.dart';

import '../../../../../widgets/containers/custom_main_decorated_container.dart';
import 'assignment_report_download_row.dart';

class AssignmentDoneReportsListView extends StatelessWidget {
  AssignmentDoneReportsListView({Key? key}) : super(key: key);
  final _doneReports = ['1234download.pdf', '1234Administration.pdf'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _doneReports.length,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemBuilder: (BuildContext context, int i) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: CustomMainDecoratedContainer(
            child: AssignmentReportDownloadRow(fileName: _doneReports[i]),
          ),
        );
      },
    );
  }
}
