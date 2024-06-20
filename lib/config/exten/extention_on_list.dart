extension ListToMapExtension on List<String> {
  Map<String, String> toMap(String prefix) {
    final map = <String, String>{};
    for (var i = 0; i < this.length; i++) {
      map['$prefix${i + 1}'] = this[i];
    }
    return map;
  }
}
