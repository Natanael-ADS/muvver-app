class LogError {
  Object exception;
  StackTrace stackTrace;
  LogError(
    this.exception,
    this.stackTrace,
  ) {
    print('''
      ------- LOG ERROR ------
      --------- MUVVER -------
      DATE: ${DateTime.now()}
      EXCEPTION: $exception
      STACKTRACE: $stackTrace
      ''');
  }
}
