import 'package:only_fans/core/components/params/sign_up_params.dart';

abstract class RegisterDataSources {
  Future<void> signUpWithEmailAndPassword(SignUpParams params);
}
