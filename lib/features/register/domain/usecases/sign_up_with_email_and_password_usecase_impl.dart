import 'package:dartz/dartz.dart';
import 'package:only_fans/core/components/params/sign_up_params.dart';
import 'package:only_fans/core/core.dart';
import 'package:only_fans/features/register/domain/repositories/register_repository.dart';

class SignUpWithEmailAndPasswordUseCaseImpl
    implements UseCase<SignUpParams, void> {
  final RegisterRepository repository;

  SignUpWithEmailAndPasswordUseCaseImpl({required this.repository});

  @override
  Future<Either<Failure, dynamic>> call(params) {
    return repository.signUpWithEmailAndPassword(params);
  }
}
