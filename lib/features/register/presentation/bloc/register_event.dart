import 'package:only_fans/core/components/params/sign_up_params.dart';
import 'package:only_fans/core/core.dart';

abstract class RegisterEvent extends IEvent {}

class SignUpWithEmailAndPasswordEvent implements RegisterEvent {
  final SignUpParams params;

  SignUpWithEmailAndPasswordEvent({required this.params});
}
