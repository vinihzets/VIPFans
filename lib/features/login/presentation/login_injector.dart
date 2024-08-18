import 'package:only_fans/core/inject/inject.dart';
import 'package:only_fans/features/login/data/datasources/impl/login_datasources_impl.dart';
import 'package:only_fans/features/login/data/datasources/login_datasources.dart';
import 'package:only_fans/features/login/data/repositories/login_repository_impl.dart';
import 'package:only_fans/features/login/domain/repositories/login_repository.dart';
import 'package:only_fans/features/login/domain/usecases/sign_in_usecase_impl.dart';
import 'package:only_fans/features/login/domain/usecases/sign_up_usecase_impl.dart';
import 'package:only_fans/features/login/presentation/bloc/login_bloc.dart';

class LoginInjector extends ContainerInjectorImpl with DependencyInjector {
  @override
  void dependencies() {
    injectLazySingleton<LoginDataSources>(() =>
        LoginDataSourcesImpl(authInstance: find(), databaseInstance: find()));

    injectLazySingleton<LoginRepository>(
        () => LoginRepositoryImpl(dataSources: find()));

    injectLazySingleton(() => SignInUseCaseImpl(repository: find()));
    injectLazySingleton(() => SignUpUseCaseImpl(repository: find()));

    injectFactory(
        () => LoginBloc(signInUseCaseImpl: find(), signUpUseCaseImpl: find()));
  }
}
