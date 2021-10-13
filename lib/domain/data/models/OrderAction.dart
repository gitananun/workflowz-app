import 'dart:convert';

import 'package:equatable/equatable.dart';
import '../../../infrastructure/exceptions/data/OrderActionModelDataException.dart';

class OrderAction extends Equatable {
  final String action;
  final String altName;
  final bool clientSignatureRequired;
  final bool filesAllowed;
  final bool geoRequired;
  final bool fillReportRequired;

  const OrderAction({
    required this.action,
    required this.altName,
    required this.clientSignatureRequired,
    required this.filesAllowed,
    required this.geoRequired,
    required this.fillReportRequired,
  });

  OrderAction copyWith({
    String? action,
    String? altName,
    bool? clientSignatureRequired,
    bool? filesAllowed,
    bool? geoRequired,
    bool? fillReportRequired,
  }) {
    return OrderAction(
      action: action ?? this.action,
      altName: altName ?? this.altName,
      clientSignatureRequired: clientSignatureRequired ?? this.clientSignatureRequired,
      filesAllowed: filesAllowed ?? this.filesAllowed,
      geoRequired: geoRequired ?? this.geoRequired,
      fillReportRequired: fillReportRequired ?? this.fillReportRequired,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'action': action,
      'altName': altName,
      'clientSignatureRequired': clientSignatureRequired,
      'filesAllowed': filesAllowed,
      'geoRequired': geoRequired,
      'fillReportRequired': fillReportRequired,
    };
  }

  factory OrderAction.fromMap(Map<String, dynamic> map) {
    try {
      return OrderAction(
        action: map['action'].toString(),
        altName: map['altName'].toString(),
        clientSignatureRequired: map['clientSignatureRequired'] as bool,
        filesAllowed: map['filesAllowed'] as bool,
        geoRequired: map['geoRequired'] as bool,
        fillReportRequired: map['fillReportRequired'] as bool,
      );
    } catch (e) {
      throw OrderActionModelDataException(e);
    }
  }

  String toJson() => json.encode(toMap());

  factory OrderAction.fromJson(String source) => OrderAction.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      action,
      altName,
      clientSignatureRequired,
      filesAllowed,
      geoRequired,
      fillReportRequired,
    ];
  }
}
