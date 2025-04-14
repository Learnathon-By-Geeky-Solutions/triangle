

class AppExceptions implements Exception {

  final String? _message;
  final String _prefix ;

  AppExceptions([this._message, this._prefix = '']) ;

  String toStrings(){
    return '$_prefix$_message';
  }

}


class InternetException extends AppExceptions {
  InternetException([String? message]) : super(message, 'No internet connection') ;
}


class RequestTimeOut extends AppExceptions {

  RequestTimeOut([String? message]) : super(message, 'Request timed out') ;

}

class ServerException extends AppExceptions {

  ServerException([String? message]) : super(message, 'Internal server error occurred') ;

}

class InvalidUrlException extends AppExceptions {

  InvalidUrlException([String? message]) : super(message, 'Invalid URL') ;

}

class FetchDataException extends AppExceptions {

  FetchDataException([String? message]) : super(message, 'Error during data fetch') ;

}