import 'package:only_fans/core/inject/container_injector.dart';
import 'package:only_fans/core/inject/mixins/dependency_injector.dart';
import 'package:only_fans/core/services/firebase_service.dart';
import 'package:only_fans/core/services/impl/firebase_service_impl.dart';

class ServicesInjector extends ContainerInjectorImpl with DependencyInjector {
  @override
  void dependencies() async {
    injectFactory<FirebaseService>(() => FirebaseServiceImpl());
  }
}
