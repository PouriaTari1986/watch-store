class HttpResponseValidator {
  static bool isValidStatusCode(int statusCode) {
    if (statusCode >= 200 && statusCode < 300) {
      return true;
    } else {
      throw HttpExeption(statusCode);
    }
  }
}

class HttpExeption implements Exception {
  final int statusCode;
  HttpExeption(this.statusCode);
  @override
  String toString() {
    String message;

    switch (statusCode) {
      case 400:
        message = 'Bad Request';

        break;
      case 401:
        message = 'Unauthorized';

        break;
      case 403:
        message = 'Forbiden';

        break;
      case 409:
        message = 'Conflict';

        break;

      case 500:
        message = 'Internal Server Error';

        break;
      default:
        message = 'Unkown Error';
    }
    return 'HttpExeption : Status Code $statusCode,msg: $message';
  }
}
