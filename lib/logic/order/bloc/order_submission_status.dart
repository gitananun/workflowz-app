abstract class OrderSubmissionStatus {
  const OrderSubmissionStatus();
}

class OrderSubmissionStatusInitial extends OrderSubmissionStatus {}

class OrderSubmissionStatusInProgress extends OrderSubmissionStatus {}

class OrderSubmissionStatusSuccess extends OrderSubmissionStatus {}

class OrderSubmissionStatusShown extends OrderSubmissionStatus {}

class OrderSubmissionStatusAccepted extends OrderSubmissionStatus {}

class OrderSubmissionStatusDeclined extends OrderSubmissionStatus {}

class OrderSubmissionStatusFailed extends OrderSubmissionStatus {
  final dynamic e;
  const OrderSubmissionStatusFailed(this.e);
}
