import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:only_fans/core/architecture/failure.dart';
import 'package:only_fans/core/components/params/sign_up_params.dart';
import 'package:only_fans/features/register/data/datasources/register_datasources.dart';
import 'package:only_fans/features/register/domain/repositories/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  RegisterDataSources dataSources;

  RegisterRepositoryImpl({required this.dataSources});

  @override
  Future<Either<Failure, void>> signUpWithEmailAndPassword(
      SignUpParams params) async {
    try {
      return Right(await dataSources.signUpWithEmailAndPassword(params));
    } on RemoteFailure catch (ex) {
      return Left(RemoteFailure(message: ex.toString()));
    } on FirebaseAuthException catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    } catch (ex) {
      return Left(RemoteFailure(message: ex.toString()));
    }
  }
}
