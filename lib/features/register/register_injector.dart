import 'package:only_fans/core/inject/inject.dart';
import 'package:only_fans/features/register/data/datasources/impl/register_datasources_impl.dart';
import 'package:only_fans/features/register/data/datasources/register_datasources.dart';
import 'package:only_fans/features/register/data/repositories/register_repository_impl.dart';
import 'package:only_fans/features/register/domain/repositories/register_repository.dart';
import 'package:only_fans/features/register/domain/usecases/sign_up_with_email_and_password_usecase_impl.dart';
import 'package:only_fans/features/register/presentation/bloc/register_bloc.dart';

class RegisterInjector extends ContainerInjectorImpl with DependencyInjector {
  @override
  void dependencies() {
    injectLazySingleton<RegisterDataSources>(() =>
        RegisterDataSourcesImpl(authService: find(), databaseService: find()));

    injectLazySingleton<RegisterRepository>(
        () => RegisterRepositoryImpl(dataSources: find()));

    injectLazySingleton(
        () => SignUpWithEmailAndPasswordUseCaseImpl(repository: find()));

    injectFactory(
        () => RegisterBloc(signUpWithEmailAndPasswordUseCaseImpl: find()));
  }
}
