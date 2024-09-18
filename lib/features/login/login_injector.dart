import 'package:morphling/morphling.dart';
import 'package:vip_fans_instance_core/vip_fans_instance_core.dart';

class LoginInjector extends ContainerInjectorImpl with DependencyInjector {
  @override
  void dependencies() {
    put<LoginDataSources>(() =>
        LoginDataSourcesImpl(authInstance: find(), databaseInstance: find()));

    put<LoginRepository>(() => LoginRepositoryImpl(dataSources: find()));

    put(() => SignInUseCaseImpl(repository: find()));
    put(() => SignUpUseCaseImpl(repository: find()));

    putFactory(
        () => LoginBloc(signInUseCaseImpl: find(), signUpUseCaseImpl: find()));
  }
}
