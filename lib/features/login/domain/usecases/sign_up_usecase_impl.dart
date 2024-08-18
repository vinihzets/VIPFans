import 'package:dartz/dartz.dart';
import 'package:only_fans/core/components/params/sign_up_params.dart';
import 'package:only_fans/core/core.dart';
import 'package:only_fans/features/login/domain/repositories/login_repository.dart';

class SignUpUseCaseImpl implements UseCase<SignUpParams, void> {
  LoginRepository repository;

  SignUpUseCaseImpl({required this.repository});

  @override
  Future<Either<Failure, void>> call(SignUpParams params) {
    return repository.signUp(params);
  }
}
