import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/data/models/OrderFull.dart';
import '../../../../../infrastructure/actions/order_actions.dart';
import '../../../../../logic/order/bloc/order_bloc.dart';
import '../../../../../logic/order/bloc/order_state.dart';
import '../../../../Styles/custom_spaces.dart';
import '../../../../screens/shared/main_container.dart';
import '../components/assignment/assignment_title_section.dart';
import '../components/report/assignment_done_reports_listview.dart';
import '../scaffolds/assignment_screen_scaffold.dart';

class AssignmentDoneReportScreen extends StatelessWidget {
  const AssignmentDoneReportScreen({Key? key, required this.orderActions, required this.orderBloc}) : super(key: key);
  final OrderBloc orderBloc;
  final OrderActions orderActions;

  void _resolveListener(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: orderBloc,
      child: BlocListener<OrderBloc, OrderState>(
        // listenWhen: (_, state) => state.orderReportStatus is OrderReportStatusDone,
        listener: (context, _) => _resolveListener(context),
        child: AssignmentScreenScaffold(
          body: MainContainer(
            child: SingleChildScrollView(
              child: BlocBuilder<OrderBloc, OrderState>(
                // buildWhen: (_, state) => state.orderReportStatus is OrderReportStatusFirstSubmitted,
                builder: (context, state) {
                  final OrderFull order = state.order!;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AssignmentTitleSection(order: order),
                      CustomSpaces.verticalSpace,
                      CustomSpaces.verticalSpace,
                      AssignmentDoneReportsListView(),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
