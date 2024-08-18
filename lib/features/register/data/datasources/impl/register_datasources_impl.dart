import 'package:only_fans/core/components/params/sign_up_params.dart';
import 'package:only_fans/core/core.dart';
import 'package:only_fans/core/global/entities/user_entity.dart';
import 'package:only_fans/core/services/auth_service.dart';
import 'package:only_fans/core/services/database_service.dart';
import 'package:only_fans/features/register/data/datasources/register_datasources.dart';

class RegisterDataSourcesImpl implements RegisterDataSources {
  final AuthService authService;
  final DatabaseService databaseService;

  RegisterDataSourcesImpl(
      {required this.authService, required this.databaseService});

  @override
  Future<void> signUpWithEmailAndPassword(SignUpParams params) async {
    final credential = await authService.signUp(params);

    if (credential.user == null) {
      throw RemoteFailure(
          message: 'Oops, algo errado aconteceu tente novamente!');
    }

    final UserEntity user = UserEntity(
        email: params.email,
        name: params.profileName,
        id: credential.user?.uid ?? '');

    return await databaseService.createUser(user);
  }
}
