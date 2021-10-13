import 'dart:convert';

import 'package:equatable/equatable.dart';
import '../../../infrastructure/exceptions/data/AvailabilityModelDataException.dart';

class Availability extends Equatable {
  final String date;
  final bool morning;
  final bool noon;
  final bool evening;

  const Availability({
    required this.date,
    required this.morning,
    required this.noon,
    required this.evening,
  });

  Availability copyWith({
    String? date,
    bool? morning,
    bool? noon,
    bool? evening,
  }) {
    return Availability(
      date: date ?? this.date,
      morning: morning ?? this.morning,
      noon: noon ?? this.noon,
      evening: evening ?? this.evening,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'morning': morning,
      'noon': noon,
      'evening': evening,
    };
  }

  factory Availability.fromMap(Map<String, dynamic> map) {
    try {
      return Availability(
        date: map['date'].toString(),
        morning: map['morning'] as bool,
        noon: map['noon'] as bool,
        evening: map['evening'] as bool,
      );
    } catch (e) {
      throw AvailabilityModelDataException(e);
    }
  }

  String toJson() => json.encode(toMap());

  factory Availability.fromJson(String source) => Availability.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [date, morning, noon, evening];
}
