// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class LogError {
  Object exception;
  StackTrace stackTrace;
  LogError(
    this.exception,
    this.stackTrace,
  ) {
    String result = '''
      ------- LOG ERROR ------
      --------- MUVVER -------
      DATE: ${DateTime.now()}
      EXCEPTION: $exception
      STACKTRACE: $stackTrace
      ''';

    print(result);
    debugPrint(result);
  }
}
