import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workflowz/constants/enums.dart';
import 'package:workflowz/domain/data/models/OrderFull.dart';
import 'package:workflowz/domain/extensions/order/order_parsing_extension.dart';
import 'package:workflowz/infrastructure/actions/report_actions.dart';
import 'package:workflowz/infrastructure/validations/validators/BaseValidator.dart';
import 'package:workflowz/logic/order/bloc/order_bloc.dart';
import 'package:workflowz/logic/order/bloc/order_state.dart';
import 'package:workflowz/logic/report/bloc/report_bloc.dart';
import 'package:workflowz/logic/report/bloc/report_state.dart';
import 'package:workflowz/presentation/screens/dashboard/assignments/components/assignment/assignment_title_section.dart';
import 'package:workflowz/presentation/screens/dashboard/assignments/reports/assignment_second_report.dart';
import 'package:workflowz/presentation/screens/dashboard/assignments/scaffolds/assignment_report_screen_bootstrap_container.dart';
import 'package:workflowz/presentation/screens/dashboard/assignments/scaffolds/assignment_screen_scaffold.dart';
import 'package:workflowz/presentation/screens/shared/main_container.dart';
import 'package:workflowz/presentation/styles/custom_spaces.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workflowz/presentation/widgets/form/text_fields/custom_text_form_field.dart';

class AssignmentFirstReportScreen extends StatefulWidget {
  const AssignmentFirstReportScreen({
    Key? key,
    required this.orderBloc,
    required this.reportBloc,
    required this.reportType,
  }) : super(key: key);
  final OrderBloc orderBloc;
  final ReportBloc reportBloc;
  final ReportType reportType;

  @override
  _AssignmentFirstReportScreenState createState() => _AssignmentFirstReportScreenState();
}

class _AssignmentFirstReportScreenState extends State<AssignmentFirstReportScreen> {
  late GlobalKey<FormState> _formKey;

  final ReportActions _reportActions = ReportActions();
  final TextEditingController _clientNameController = TextEditingController();
  final TextEditingController _kitchenNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _reportActions.startReport(
      bloc: widget.reportBloc,
      reportType: widget.reportType,
      order: widget.orderBloc.state.order!,
    );
    _kitchenNumberController.text = widget.orderBloc.state.order?.kitchenNumber ?? '';
    _clientNameController.text = widget.orderBloc.state.order?.customer?.name ?? '';
  }

  void _onNext(ReportBloc bloc) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      final FullReportState _state = bloc.state as FullReportState;

      final _updated = _state.fullReport!.copyWith(
        clientName: _clientNameController.text,
        kitchenNumber: int.tryParse(_kitchenNumberController.text),
      );

      _reportActions.nextReport(bloc: bloc, fullReport: _updated, order: _state.order!);

      Navigator.push(
        context,
        MaterialPageRoute<Widget>(
          builder: (BuildContext context) => AssignmentSecondReportScreen(
            orderBloc: widget.orderBloc,
            reportBloc: widget.reportBloc,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AssignmentReportScreenBootstrapContainer(
      orderBloc: widget.orderBloc,
      reportBloc: widget.reportBloc,
      child: AssignmentScreenScaffold(
        onNext: () => _onNext(widget.reportBloc),
        body: MainContainer(
          child: SingleChildScrollView(
            child: BlocBuilder<OrderBloc, OrderState>(
              builder: (context, state) {
                final OrderFull order = state.order!;
                final _address = order.getFinishAddress;
                final _time = order.getFinishDate;

                return Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AssignmentTitleSection(order: order, address: _address),
                      CustomSpaces.verticalSpace,
                      CustomSpaces.verticalSpace,
                      CustomSpaces.verticalSpace,
                      Text('Time: ${_time.hour}:${_time.minute}'),
                      CustomSpaces.verticalSpace,
                      CustomTextFormField(
                        readOnly: true,
                        labelText: 'Kitchen Number',
                        textInputType: TextInputType.number,
                        controller: _kitchenNumberController,
                        validator: (value) => BaseValidator(value!).validate,
                      ),
                      CustomSpaces.verticalSpace,
                      CustomTextFormField(
                        readOnly: true,
                        labelText: "Client's Name",
                        controller: _clientNameController,
                        validator: (value) => BaseValidator(value!).validate,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
