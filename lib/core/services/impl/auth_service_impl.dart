import 'package:firebase_auth/firebase_auth.dart';
import 'package:only_fans/core/components/params/sign_up_params.dart';
import 'package:only_fans/core/services/auth_service.dart';
import 'package:only_fans/features/login/domain/usecases/sign_in_usecase_impl.dart';

class AuthServiceImpl implements AuthService {
  @override
  void initialize() {
    auth = FirebaseAuth.instance;
  }

  @override
  Future<UserCredential> signInWithEmailAndPassword(SignInParams params) async {
    return await auth.signInWithEmailAndPassword(
        email: params.email, password: params.password);
  }

  @override
  Future<UserCredential> signUp(SignUpParams params) async {
    return await auth.createUserWithEmailAndPassword(
        email: params.email, password: params.password);
  }

  @override
  late FirebaseAuth auth;
}
