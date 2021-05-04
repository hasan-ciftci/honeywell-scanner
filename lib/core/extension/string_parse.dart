extension ParseStringToInt on String {
  int parseInt({int defaultValue}) {
    try {
      return int.parse(this);
    } catch (e) {
      return defaultValue ?? 0;
    }
  }
}

extension ParseStringToDouble on String {
  double parseDouble({double defaultValue}) {
    try {
      return double.parse(this);
    } catch (e) {
      return defaultValue ?? 0.0;
    }
  }
}
