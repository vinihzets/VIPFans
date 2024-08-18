import 'package:only_fans/core/core.dart';
import 'package:only_fans/features/login/domain/usecases/sign_in_usecase_impl.dart';

abstract class LoginEvent extends IEvent {}

class SignInWithEmailAndPasswordEvent implements LoginEvent {
  final SignInParams params;

  SignInWithEmailAndPasswordEvent({required this.params});
}
