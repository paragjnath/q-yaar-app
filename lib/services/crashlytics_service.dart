import 'package:flutter/material.dart';

class CrashlyticsService {
  static void recordError(
    dynamic exception,
    StackTrace? stack, {
    dynamic reason,
    Iterable<DiagnosticsNode> information = const [],
    bool? printDetails,
    bool fatal = false,
  }) async {}

  void log(String message) {}
}
