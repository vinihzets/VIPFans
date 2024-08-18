import 'package:dartz/dartz.dart';
import 'package:only_fans/core/components/params/sign_up_params.dart';
import 'package:only_fans/core/core.dart';
import 'package:only_fans/core/global/entities/user_entity.dart';
import 'package:only_fans/features/login/domain/usecases/sign_in_usecase_impl.dart';

abstract class LoginRepository {
  Future<Either<Failure, UserEntity>> signIn(SignInParams params);
  Future<Either<Failure, void>> signUp(SignUpParams params);
}
