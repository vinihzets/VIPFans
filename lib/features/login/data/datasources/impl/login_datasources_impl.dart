import 'package:firebase_auth/firebase_auth.dart';
import 'package:only_fans/core/components/params/sign_up_params.dart';
import 'package:only_fans/core/global/entities/user_entity.dart';
import 'package:only_fans/core/services/auth_service.dart';
import 'package:only_fans/core/services/database_service.dart';
import 'package:only_fans/features/login/data/datasources/login_datasources.dart';
import 'package:only_fans/features/login/domain/usecases/sign_in_usecase_impl.dart';

class LoginDataSourcesImpl implements LoginDataSources {
  AuthService authInstance;
  DatabaseService databaseInstance;
  LoginDataSourcesImpl({
    required this.authInstance,
    required this.databaseInstance,
  });

  @override
  Future<UserEntity> signIn(SignInParams params) async {
    UserCredential credential =
        await authInstance.signInWithEmailAndPassword(params);

    return await databaseInstance.fetchUser(credential.user?.uid ?? '');
  }

  @override
  Future<void> signUp(SignUpParams params) async {
    UserCredential credential = await authInstance.signUp(params);

    final user = UserEntity(
        email: params.email,
        name: params.profileName,
        id: credential.user?.uid ?? '');

    return await databaseInstance.createUser(user);
  }
}
