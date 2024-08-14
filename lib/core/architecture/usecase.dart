import 'package:dartz/dartz.dart';
import 'package:only_fans/core/architecture/failure.dart';

abstract class UseCase<Input, Output> {
  Future<Either<Failure, Output>> call(Input params);
}

class NoParams {}
