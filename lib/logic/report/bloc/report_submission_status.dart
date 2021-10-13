abstract class ReportSubmissionStatus {
  const ReportSubmissionStatus();
}

class ReportSubmissionStatusInitial extends ReportSubmissionStatus {}

class ReportSubmissionStatusInProgress extends ReportSubmissionStatus {}

class ReportSubmissionStatusSuccess extends ReportSubmissionStatus {}

class ReportSubmissionStatusFullReport extends ReportSubmissionStatus {}

class ReportSubmissionStatusFailed extends ReportSubmissionStatus {
  final dynamic e;
  const ReportSubmissionStatusFailed(this.e);
}
