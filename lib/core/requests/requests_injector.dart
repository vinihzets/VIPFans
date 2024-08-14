import 'package:only_fans/core/inject/container_injector.dart';
import 'package:only_fans/core/inject/mixins/dependency_injector.dart';
import 'package:only_fans/core/requests/base_paths.dart';
import 'package:only_fans/core/requests/custom_http.dart';

class RequestsInjector extends ContainerInjectorImpl with DependencyInjector {
  @override
  void dependencies() {
    injectLazySingleton(() => BasePaths());
    injectLazySingleton<CustomHttp>(() => CustomHttpImpl(find()));
  }
}
