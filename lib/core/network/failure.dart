class Failure {
  int code;
  String status;
  String message;
  dynamic data;

  Failure({required this.code, required this.status, required this.message, this.data});
}