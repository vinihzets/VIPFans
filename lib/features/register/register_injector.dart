import 'package:morphling/morphling.dart';
import 'package:vip_fans_instance_core/vip_fans_instance_core.dart';

class RegisterInjector extends ContainerInjectorImpl with DependencyInjector {
  @override
  void dependencies() {
    put<RegisterDataSources>(() =>
        RegisterDataSourcesImpl(authService: find(), databaseService: find()));

    put<RegisterRepository>(() => RegisterRepositoryImpl(dataSources: find()));

    put(() => SignUpWithEmailAndPasswordUseCaseImpl(repository: find()));

    putFactory(
        () => RegisterBloc(signUpWithEmailAndPasswordUseCaseImpl: find()));
  }
}
