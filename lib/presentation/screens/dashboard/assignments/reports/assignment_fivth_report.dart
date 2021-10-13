import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:signature/signature.dart';
import 'package:workflowz/constants/enums.dart';
import 'package:workflowz/domain/data/models/Employee.dart';
import 'package:workflowz/domain/data/models/FullReport.dart';
import 'package:workflowz/infrastructure/actions/report_actions.dart';
import 'package:workflowz/logic/order/bloc/order_bloc.dart';
import 'package:workflowz/logic/report/bloc/report_state.dart';

import 'package:workflowz/logic/report/bloc/report_bloc.dart';
import 'package:workflowz/logic/report/bloc/report_submission_status.dart';
import 'package:workflowz/presentation/screens/dashboard/assignments/assignment.dart';
import 'package:workflowz/presentation/screens/dashboard/assignments/components/report/assignment_report_signature.dart';
import 'package:workflowz/presentation/screens/dashboard/assignments/components/report/assignment_report_simple_title.dart';
import 'package:workflowz/presentation/screens/dashboard/assignments/components/report/assignment_report_text_with_time_column.dart';
import 'package:workflowz/presentation/screens/dashboard/assignments/reports/dialog/assignment_report_extra_email_dialog_content.dart';
import 'package:workflowz/presentation/screens/dashboard/assignments/scaffolds/assignment_report_screen_bootstrap_container.dart';
import 'package:workflowz/presentation/screens/dashboard/assignments/scaffolds/assignment_screen_scaffold.dart';
import 'package:workflowz/presentation/screens/shared/main_container.dart';
import 'package:workflowz/presentation/styles/custom_spaces.dart';
import 'package:workflowz/presentation/theme/mts_theme.dart';
import 'package:workflowz/presentation/widgets/buttons/custom_small_centered_primary_button.dart';
import 'package:workflowz/presentation/widgets/form/text_fields/custom_text_form_field.dart';
import 'package:workflowz/presentation/widgets/snackbar/custom_snackbars.dart';

class AssignmentFivthReportScreen extends StatefulWidget {
  const AssignmentFivthReportScreen({Key? key, required this.orderBloc, required this.reportBloc}) : super(key: key);
  final OrderBloc orderBloc;
  final ReportBloc reportBloc;

  @override
  _AssignmentFivthReportScreenState createState() => _AssignmentFivthReportScreenState();
}

class _AssignmentFivthReportScreenState extends State<AssignmentFivthReportScreen> {
  late TextEditingController _monteurNameController;
  final ReportActions _reportActions = ReportActions();
  final TextEditingController _remarksController = TextEditingController();
  final TextEditingController _extraEmailController = TextEditingController();
  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 2,
    exportBackgroundColor: Colors.white,
    penColor: MTStheme.getPrimaryColor,
  );

  final SignatureController _clientSignatureController = SignatureController(
    penStrokeWidth: 2,
    exportBackgroundColor: Colors.white,
    penColor: MTStheme.getPrimaryColor,
  );

  @override
  void initState() {
    super.initState();
    final Employee? worker = widget.orderBloc.state.order?.worker;
    _monteurNameController = TextEditingController(text: '${worker?.firstName} ${worker?.lastName}');
  }

  void _onExtraEmail(BuildContext context) {
    HapticFeedback.mediumImpact();

    final ThemeData _themeData = Theme.of(context);
    showDialog<String>(
      context: context,
      builder: (_) => AlertDialog(
        scrollable: true,
        backgroundColor: _themeData.cardColor,
        titleTextStyle: _themeData.textTheme.caption,
        titlePadding: const EdgeInsets.symmetric(vertical: 20),
        title: Text('Extra Email Address', textAlign: TextAlign.center),
        content: AssignmentReportExtraEmailDialogContent(emailController: _extraEmailController),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: Text('Cancel', style: _themeData.textTheme.caption),
          ),
          TextButton(
            onPressed: () => _onSaveExtraEmail(context),
            child: Text('Save', style: _themeData.textTheme.caption?.copyWith(color: _themeData.primaryColor)),
          ),
        ],
      ),
    );
  }

  void _onSaveExtraEmail(BuildContext context) {
    Navigator.maybePop(context, 'Saved');
    _showSnackbar(context, 'Extra email saved!');
  }

  void _showSnackbar(BuildContext context, String message) =>
      CustomSnackbars(context).showSuccessMessageSnackbar(message);

  void _finish(FullReport fullReport) {
    if (widget.reportBloc.state.reportSubmissionStatus is ReportSubmissionStatusFullReport) {
      HapticFeedback.mediumImpact();
      _reportActions.finishReport(
        fullReport: fullReport,
        bloc: widget.reportBloc,
        order: widget.orderBloc.state.order!,
      );
    } else {
      HapticFeedback.mediumImpact();
    }
  }

  Future<void> _onNext(ReportBloc bloc) async {
    if (bloc.state is FullReportState) {
      final _updated = bloc.state.fullReport!.copyWith(
        finished: true,
        remarks: _remarksController.text,
        extraEmail: _extraEmailController.text,
        monteurName: _monteurNameController.text,
        signature: await _signatureController.toPngBytes(),
        clientSignature: await _clientSignatureController.toPngBytes(),
      );

      _reportActions.nextReport(bloc: bloc, fullReport: _updated, order: bloc.state.order!);

      _finish(_updated);

      await Navigator.pushReplacement(
        context,
        MaterialPageRoute<Widget>(
          builder: (_) => AssignmentScreen(orderBloc: widget.orderBloc),
        ),
      );
    }
  }

  void _resolveListener(BuildContext contex, ReportState state) {
    final CustomSnackbars _snackbars = CustomSnackbars(context);

    if (state.reportSubmissionStatus is ReportSubmissionStatusFailed) {
      final ReportSubmissionStatusFailed _failedStatus = state.reportSubmissionStatus as ReportSubmissionStatusFailed;
      _snackbars.showMessageSnackbar('save report failed: ${_failedStatus.e}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.reportBloc,
      child: BlocListener<ReportBloc, ReportState>(
        listener: _resolveListener,
        listenWhen: (_, state) =>
            state is FinishedReport && state.reportSubmissionStatus is ReportSubmissionStatusFailed,
        child: AssignmentReportScreenBootstrapContainer(
          orderBloc: widget.orderBloc,
          reportBloc: widget.reportBloc,
          child: AssignmentScreenScaffold(
            nextIcon: FontAwesomeIcons.check,
            onNext: () => _onNext(widget.reportBloc),
            body: MainContainer(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomSpaces.verticalSpace,
                    AssignmentReportSimpleTitle('Start Administration'),
                    AssignmentReportTextWithTimeColumn(time: '14:00'),
                    CustomSpaces.verticalSpace,
                    CustomSpaces.verticalSpace,
                    CustomTextFormField(
                      validator: null,
                      labelText: 'Remarks',
                      controller: _remarksController,
                    ),
                    CustomSpaces.verticalSpace,
                    CustomTextFormField(
                      validator: null,
                      labelText: "Monteur's Name",
                      controller: _monteurNameController,
                    ),
                    CustomSpaces.verticalSpace,
                    CustomSpaces.verticalSpace,
                    AssignmentReportSignature(
                      person: 'Mechanic',
                      controller: _signatureController,
                    ),
                    if (widget.reportBloc.state is FullReportState)
                      if ((widget.reportBloc.state as FullReportState).reportType == ReportType.End)
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: AssignmentReportSignature(
                            person: 'Client',
                            controller: _clientSignatureController,
                          ),
                        ),
                    CustomSpaces.verticalSpace,
                    CustomSpaces.verticalSpace,
                    CustomSmallCenteredPrimaryButton(
                      text: 'Extra Email',
                      withBackground: true,
                      onPressed: () => _onExtraEmail(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
