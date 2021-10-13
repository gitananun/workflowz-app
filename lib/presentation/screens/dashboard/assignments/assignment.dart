import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:workflowz/constants/enums.dart';
import 'package:workflowz/domain/data/constants/enums/OrderActionEnums.dart';
import 'package:workflowz/domain/data/models/OrderFull.dart';
import 'package:workflowz/domain/extensions/order/order_reporting_extension.dart';
import 'package:workflowz/infrastructure/actions/report_actions.dart';
import 'package:workflowz/logic/order/bloc/order_bloc.dart';
import 'package:workflowz/logic/order/bloc/order_state.dart';
import 'package:workflowz/logic/report/api_report_repository.dart';
import 'package:workflowz/logic/report/bloc/report_bloc.dart';
import 'package:workflowz/logic/report/bloc/report_state.dart';
import 'package:workflowz/logic/report/bloc/report_submission_status.dart';
import 'package:workflowz/presentation/screens/dashboard/assignments/reports/assignment_first_report.dart';
import 'package:workflowz/presentation/screens/dashboard/assignments/scaffolds/assignment_screen_scaffold.dart';
import 'package:workflowz/presentation/screens/shared/main_container.dart';
import 'package:workflowz/presentation/styles/custom_spaces.dart';
import 'package:workflowz/presentation/widgets/buttons/custom_small_centered_primary_button.dart';
import 'package:workflowz/presentation/widgets/progress_indicators/custom_circular_progress_indicator.dart';
import 'package:workflowz/presentation/widgets/snackbar/custom_snackbars.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/assignment/assignment_about_main_decorated_container.dart';
import 'components/assignment/assignment_addresses_column.dart';
import 'components/assignment/assignment_title_section.dart';

class AssignmentScreen extends StatefulWidget {
  const AssignmentScreen({Key? key, required this.orderBloc}) : super(key: key);
  final OrderBloc orderBloc;

  @override
  _AssignmentScreenState createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen> {
  ReportType _reportType = ReportType.Start;
  final ReportActions reportActions = ReportActions();
  final FlutterSecureStorage _storage = FlutterSecureStorage();
  final ApiReportRepository _reportRepository = ApiReportRepository();

  void _resolveListener(BuildContext context, ReportState state) {
    final CustomSnackbars _customSnackbars = CustomSnackbars(context);

    if (state.reportSubmissionStatus is ReportSubmissionStatusSuccess &&
        state.order?.orderStatus?.actions?.first.action == OrderActionEnums.FINISH.parseToString()) {
      Navigator.push(
        context,
        MaterialPageRoute<AssignmentScreen>(
          builder: (_) => AssignmentFirstReportScreen(
            reportType: _reportType,
            orderBloc: context.read<OrderBloc>(),
            reportBloc: context.read<ReportBloc>(),
          ),
        ),
      );
    }

    ///
    else if (state.reportSubmissionStatus is ReportSubmissionStatusFailed) {
      final _failedStatus = state.reportSubmissionStatus as ReportSubmissionStatusFailed;
      _customSnackbars.showMessageSnackbar(_failedStatus.e.toString());
    }
  }

  void _act(BuildContext context, OrderFull order, {ReportType? reportType}) {
    if (context.read<ReportBloc>().state.reportSubmissionStatus is ReportSubmissionStatusInProgress) {
      HapticFeedback.mediumImpact();
    } else {
      HapticFeedback.mediumImpact();
      setState(() => _reportType = reportType ?? ReportType.Start);
      if (_reportType == ReportType.Start) {
        reportActions.act(
          id: order.id,
          bloc: context.read<ReportBloc>(),
          action: order.orderStatus!.actions!.first.action.toOrderAction(),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute<AssignmentScreen>(
            builder: (_) => AssignmentFirstReportScreen(
              reportType: _reportType,
              orderBloc: context.read<OrderBloc>(),
              reportBloc: context.read<ReportBloc>(),
            ),
          ),
        );
      }
    }
  }

  Future<bool> _onWillPop(BuildContext context) =>
      Navigator.pushReplacementNamed(context, '/dashboard').then((value) => true);

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: widget.orderBloc),
        BlocProvider(
          create: (context) => ReportBloc(
            storage: _storage,
            orderBloc: widget.orderBloc,
            reportRepo: _reportRepository,
          ),
        ),
      ],
      child: BlocConsumer<ReportBloc, ReportState>(
        listenWhen: (context, state) => state is ActedReport,
        listener: _resolveListener,
        builder: (context, state) => WillPopScope(
          onWillPop: () async => _onWillPop(context),
          child: AssignmentScreenScaffold(
            isAssignmentInfoPage: true,
            body: MainContainer(
              child: SingleChildScrollView(
                child: context.read<ReportBloc>().state is FinishedReport
                    ? CustomCircularProgressIndicator()
                    : BlocBuilder<OrderBloc, OrderState>(
                        builder: (context, state) {
                          final OrderFull? order = state.order;

                          if (order != null) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                AssignmentTitleSection(order: order),
                                CustomSpaces.verticalSpace,
                                AssignmentAddressesColumn(
                                  order: order,
                                  onStartAddress: () => _act(context, order, reportType: ReportType.Start),
                                  onFinishAddress: () => _act(context, order, reportType: ReportType.End),
                                ),
                                CustomSpaces.verticalSpace,
                                AssignmentAboutMainDecoratedContainer(
                                  title: 'Manager: ${order.contact!.firstName} ${order.contact!.lastName}',
                                  subtitle: 'Instructions',
                                  body: order.instructions,
                                ),
                                CustomSpaces.verticalSpace,
                                CustomSpaces.verticalSpace,
                                if (order.orderStatus!.actions!.isNotEmpty && !order.isStarted)
                                  CustomSmallCenteredPrimaryButton(
                                    text: 'Start',
                                    withBackground: true,
                                    onPressed: () => _act(context, order),
                                  )
                                else
                                  Icon(
                                    FontAwesomeIcons.userCheck,
                                    color: _themeData.accentColor,
                                    size: _themeData.textTheme.headline5?.fontSize,
                                  ),
                              ],
                            );
                          }

                          return CustomCircularProgressIndicator();
                        },
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
