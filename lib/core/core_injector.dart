import 'package:only_fans/core/inject/container_injector.dart';
import 'package:only_fans/core/inject/mixins/dependency_injector.dart';

class CoreInjector extends ContainerInjectorImpl with DependencyInjector {
  final List<DependencyInjector> injectors = [];

  void inject(DependencyInjector injector) {
    injector.dependencies();
  }

  @override
  void dependencies() {
    for (DependencyInjector dependency in injectors) {
      inject(dependency);
    }
  }
}
