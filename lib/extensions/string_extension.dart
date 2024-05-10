import 'dart:convert';

extension StringExtension on String {
  void prettyPrintJson() {
    var object = const JsonDecoder().convert(this);
    var prettyString = const JsonEncoder.withIndent('  ').convert(object);
    // ignore: avoid_print
    prettyString.split('\n').forEach((element) => print(element));
  }
}
