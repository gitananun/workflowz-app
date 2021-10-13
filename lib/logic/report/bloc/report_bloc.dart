import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:workflowz/domain/data/constants/enums/OrderActionEnums.dart';
import 'package:workflowz/domain/data/models/FullReport.dart';
import 'package:workflowz/domain/data/models/OrderFull.dart';
import 'package:workflowz/logic/order/bloc/order_bloc.dart';
import 'package:workflowz/logic/order/bloc/order_event.dart';
import 'package:workflowz/logic/report/api_report_repository.dart';
import 'package:workflowz/logic/report/bloc/report_event.dart';
import 'package:workflowz/logic/report/bloc/report_state.dart';
import 'package:workflowz/logic/report/bloc/report_submission_status.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final OrderBloc orderBloc;
  final FlutterSecureStorage storage;
  final ApiReportRepository reportRepo;
  ReportBloc({
    required this.storage,
    required this.orderBloc,
    required this.reportRepo,
  }) : super(ReportInitial(reportSubmissionStatus: ReportSubmissionStatusInitial()));

  @override
  Stream<ReportState> mapEventToState(ReportEvent event) async* {
    /// Reporting Acted
    if (event is ReportActed) {
      yield ActedReport(reportSubmissionStatus: ReportSubmissionStatusInProgress());
      final ActedReport _actedState = state as ActedReport;

      try {
        final String? _token = await storage.read(key: 'token');
        final OrderFull orderFull = await reportRepo.act(_token ?? '', event.orderId, event.action);

        orderBloc.add(OrderChangedEvent(order: orderFull));

        yield _actedState.copyWith(
          order: orderFull,
          reportSubmissionStatus: ReportSubmissionStatusSuccess(),
        );
      } catch (e) {
        yield _actedState.copyWith(reportSubmissionStatus: ReportSubmissionStatusFailed(e));
      }
    }

    /// Started Reporting
    else if (event is ReportStarted) {
      yield FullReportState(
        order: event.order,
        fullReport: FullReport(),
        reportType: event.reportType,
        reportSubmissionStatus: ReportSubmissionStatusInProgress(),
      );
    }

    /// One of the report screens passed (next)
    else if (event is ReportPassed) {
      yield FullReportState(
        order: event.order,
        fullReport: event.fullReport,
        reportType: event.reportType,
        reportSubmissionStatus: ReportSubmissionStatusFullReport(),
      );
    }

    /// Finish report
    else if (event is ReportFinished) {
      yield FinishedReport(
        order: event.order,
        fullReport: event.fullReport,
        reportSubmissionStatus: ReportSubmissionStatusInProgress(),
      );

      final FinishedReport _finishedState = state as FinishedReport;

      try {
        final String? _token = await storage.read(key: 'token');

        if (event.fullReport.damages!.isNotEmpty) {
          for (final file in event.fullReport.damages!) {
            await reportRepo.attachFile(_token ?? '', event.orderId, file as File);
          }
        }

        await reportRepo.save(_token ?? '', event.orderId, event.fullReport, []);

        final OrderFull orderFull = await reportRepo.act(_token ?? '', event.orderId, OrderActionEnums.FINISH);

        orderBloc.add(OrderChangedEvent(order: orderFull));

        yield _finishedState.copyWith(reportSubmissionStatus: ReportSubmissionStatusSuccess());
      } catch (e) {
        print(e);
        if (e is DioError) {
          print(e.response);
          yield _finishedState.copyWith(reportSubmissionStatus: ReportSubmissionStatusFailed(e));
        } else {
          yield _finishedState.copyWith(reportSubmissionStatus: ReportSubmissionStatusFailed(e));
        }
      }
    }
  }
}
