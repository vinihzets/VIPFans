import 'package:only_fans/core/architecture/navigator.dart';
import 'package:only_fans/core/global/mappers/user_mapper.dart';
import 'package:only_fans/core/inject/container_injector.dart';
import 'package:only_fans/core/inject/mixins/dependency_injector.dart';
import 'package:only_fans/core/services/auth_service.dart';
import 'package:only_fans/core/services/database_service.dart';
import 'package:only_fans/core/services/firebase_service.dart';
import 'package:only_fans/core/services/impl/auth_service_impl.dart';
import 'package:only_fans/core/services/impl/database_service_impl.dart';
import 'package:only_fans/core/services/impl/firebase_service_impl.dart';

class ServicesInjector extends ContainerInjectorImpl with DependencyInjector {
  @override
  void dependencies() async {
    injectFactory<FirebaseService>(() => FirebaseServiceImpl());
    injectLazySingleton<AuthService>(() => AuthServiceImpl());
    injectLazySingleton<NavigatorService>(() => NavigatorServiceImpl());
    injectLazySingleton(() => UserMapper());
    injectLazySingleton<DatabaseService>(
        () => DatabaseServiceImpl(userMapper: find()));
  }
}
