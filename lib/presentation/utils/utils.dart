Map<String, dynamic> categorizeMapByKeys(List<String> keys, List values) {
  final Map<String, dynamic> result = <String, dynamic>{};

  for (int i = 0; i < values.length; i++) {
    result.putIfAbsent(keys[i], () => values[i]);
  }

  return result;
}
