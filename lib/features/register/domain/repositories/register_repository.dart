import 'package:dartz/dartz.dart';
import 'package:only_fans/core/components/params/sign_up_params.dart';
import 'package:only_fans/core/core.dart';

abstract class RegisterRepository {
  Future<Either<Failure, void>> signUpWithEmailAndPassword(SignUpParams params);
}
