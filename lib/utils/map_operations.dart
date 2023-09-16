List<String> compareMaps(Map<String, dynamic> map1, Map<String, dynamic> map2) {
  final List<String> differences = [];

  // Iterate through the keys in map1
  map1.forEach((key, value1) {
    // Check if map2 contains the same key
    if (map2.containsKey(key)) {
      final value2 = map2[key];
      // Compare the values of the two maps
      if (value1 != value2) {
        differences.add('$key: ${value1 == "" ? "added" : "changed from $value1 to"} $value2');
      }
    } else {
      differences.add('$key: $value1 was added');
    }
  });

  // Check for keys in map2 that are not in map1
  map2.forEach((key, value2) {
    if (!map1.containsKey(key)) {
      differences.add('$key: $value2 was deleted');
    }
  });

  return differences;
}

Map<String, dynamic> replaceKeys(Map<String, dynamic> sourceMap, Map<String, String> keyMapping) {
  final Map<String, dynamic> resultMap = {};

  sourceMap.forEach((key, value) {
    if (keyMapping.containsKey(key)) {
      final String newKey = keyMapping[key]!;
      resultMap[newKey] = value;
    } else {
      resultMap[key] = value;
    }
  });

  return resultMap;
}

Map<String, String> invertMap(Map<String, String> inputMap) {
  return Map.fromEntries(inputMap.entries.map((entry) => MapEntry(entry.value, entry.key)));
}
