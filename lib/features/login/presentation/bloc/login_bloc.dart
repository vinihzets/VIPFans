import 'package:only_fans/core/core.dart';
import 'package:only_fans/features/login/domain/usecases/sign_in_usecase_impl.dart';
import 'package:only_fans/features/login/domain/usecases/sign_up_usecase_impl.dart';
import 'package:only_fans/features/login/presentation/bloc/login_event.dart';

class LoginBloc extends BloC {
  SignInUseCaseImpl signInUseCaseImpl;
  SignUpUseCaseImpl signUpUseCaseImpl;

  LoginBloc({
    required this.signInUseCaseImpl,
    required this.signUpUseCaseImpl,
  });

  @override
  mapListenEvent(IEvent event) {
    if (event is SignInWithEmailAndPasswordEvent) {
      _handleSignInWithEmailAndPassword(event);
    }
  }

  _handleSignInWithEmailAndPassword(
      SignInWithEmailAndPasswordEvent event) async {
    dispatchState(Loading(data: null));

    final request = await signInUseCaseImpl.call(SignInParams(
        email: event.params.email,
        password: event.params.password,
        context: event.params.context));

    request.fold((l) {
      dispatchState(Stable(data: null));
      showFailure(event.params.context, content: l.message);
    }, (r) {
      dispatchState(Stable(data: null));
      print('logado com sucesso');
    });
  }
}
