import 'package:firebase_auth/firebase_auth.dart';
import 'package:only_fans/core/components/params/sign_up_params.dart';
import 'package:only_fans/features/login/domain/usecases/sign_in_usecase_impl.dart';

abstract class AuthService {
  late FirebaseAuth auth;

  void initialize();

  Future<UserCredential> signInWithEmailAndPassword(SignInParams params);

  Future<UserCredential> signUp(SignUpParams params);
}
