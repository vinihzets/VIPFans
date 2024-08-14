abstract class Failure {
  final String message;

  Failure({required this.message});
}

class RemoteFailure extends Failure {
  RemoteFailure({required super.message});

  @override
  String toString() {
    return message;
  }
}

class SearchFailure extends Failure {
  SearchFailure({required super.message});

  @override
  String toString() {
    return message;
  }
}

class UnauthorizedFailure extends Failure {
  UnauthorizedFailure({required super.message});
}
