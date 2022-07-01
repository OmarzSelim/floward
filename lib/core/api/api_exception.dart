class ExceptionApi implements Exception {
  final int? code;
  final String? message;

  ExceptionApi({this.code, this.message});
  @override
  String toString() {
    return '$code: $message';
  }
}