class CustomException implements Exception {
  final String errorMessage;

  const CustomException(this.errorMessage);

  @override
  String toString() {
    return errorMessage;
  }
}
