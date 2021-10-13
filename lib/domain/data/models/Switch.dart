import 'dart:convert';

class Switching {
  final String key;
  final bool value;

  const Switching({required this.key, required this.value});

  Switching copyWith({String? key, bool? value}) => Switching(key: key ?? this.key, value: value ?? this.value);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'key': key, 'value': value};
  }

  factory Switching.fromMap(Map<String, dynamic> map) =>
      Switching(key: map['key'].toString(), value: map['value'] as bool);

  String toJson() => json.encode(toMap());

  factory Switching.fromJson(String source) => Switching.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Switch(key: $key, value: $value)';
}
