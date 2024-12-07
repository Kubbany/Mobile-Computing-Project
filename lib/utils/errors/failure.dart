abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure("Request Not Found");
    } else if (statusCode == 500) {
      return ServerFailure("Server Failure");
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['message'].toString());
    } else {
      return ServerFailure("Unkown Error Occured");
    }
  }
}
