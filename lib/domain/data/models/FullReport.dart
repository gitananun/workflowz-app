import 'dart:typed_data';

class FullReport {
  final bool finished;
  final String? remarks;
  final Uint8List? signature;
  final int? kitchenNumber;
  final String? clientName;
  final String? extraEmail;
  final String? monteurName;
  final String? damagedItems;
  final Uint8List? clientSignature;
  final List<dynamic>? damages;
  final List<String>? comments;
  final Map<int, bool>? questions;

  const FullReport({
    this.finished = false,
    this.kitchenNumber,
    this.clientName,
    this.questions,
    this.damages,
    this.comments,
    this.damagedItems,
    this.remarks,
    this.monteurName,
    this.signature,
    this.extraEmail,
    this.clientSignature,
  });

  FullReport copyWith({
    int? kitchenNumber,
    String? clientName,
    Map<int, bool>? questions,
    List<dynamic>? damages,
    String? damagedItems,
    List<String>? comments,
    String? remarks,
    String? monteurName,
    Uint8List? signature,
    String? extraEmail,
    bool? finished,
    Uint8List? clientSignature,
  }) {
    return FullReport(
      kitchenNumber: kitchenNumber ?? this.kitchenNumber,
      clientName: clientName ?? this.clientName,
      questions: questions ?? this.questions,
      damages: damages ?? this.damages,
      damagedItems: damagedItems ?? this.damagedItems,
      remarks: remarks ?? this.remarks,
      monteurName: monteurName ?? this.monteurName,
      signature: signature ?? this.signature,
      extraEmail: extraEmail ?? this.extraEmail,
      finished: finished ?? this.finished,
      comments: comments ?? this.comments,
      clientSignature: clientSignature ?? this.clientSignature,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'remarks': remarks,
      'damages': damages,
      'signature': signature,
      'clientName': clientName,
      'extraEmail': extraEmail,
      'monteurName': monteurName,
      'damagedItems': damagedItems,
      'kitchenNumber': kitchenNumber,
      'questions': questions,
      'finished': finished,
      'comments': comments,
      'clientSignature': clientSignature,
    };
  }

  @override
  String toString() {
    return 'FullReport(kitchenNumber: $kitchenNumber, clientName: $clientName, questions: $questions, damages: $damages, damagedItems: $damagedItems, remarks: $remarks, monteurName: $monteurName, signature: $signature, extraEmail: $extraEmail, finished: $finished, comments: $comments)';
  }
}
