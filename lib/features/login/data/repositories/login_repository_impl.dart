import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:only_fans/core/architecture/failure.dart';
import 'package:only_fans/core/components/params/sign_up_params.dart';
import 'package:only_fans/core/global/entities/user_entity.dart';
import 'package:only_fans/features/login/data/datasources/login_datasources.dart';
import 'package:only_fans/features/login/domain/repositories/login_repository.dart';
import 'package:only_fans/features/login/domain/usecases/sign_in_usecase_impl.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginDataSources dataSources;

  LoginRepositoryImpl({required this.dataSources});

  @override
  Future<Either<Failure, UserEntity>> signIn(SignInParams params) async {
    try {
      return Right(await dataSources.signIn(params));
    } on RemoteFailure catch (ex) {
      return Left(RemoteFailure(message: ex.toString()));
    } on FirebaseAuthException catch (_) {
      return Left(RemoteFailure(message: 'Credenciais incorretas!'));
    } catch (ex) {
      return Left(RemoteFailure(message: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signUp(SignUpParams params) async {
    try {
      return Right(await dataSources.signUp(params));
    } on RemoteFailure catch (ex) {
      return Left(RemoteFailure(message: ex.toString()));
    } on FirebaseAuthException catch (_) {
      return Left(RemoteFailure(message: 'Credenciais incorretas!'));
    } catch (ex) {
      return Left(RemoteFailure(message: ex.toString()));
    }
  }
}
