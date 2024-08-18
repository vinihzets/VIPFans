import 'package:flutter/material.dart';
import 'package:only_fans/core/core.dart';
import 'package:only_fans/features/register/domain/usecases/sign_up_with_email_and_password_usecase_impl.dart';
import 'package:only_fans/features/register/presentation/bloc/register_event.dart';

class RegisterBloc extends BloC {
  SignUpWithEmailAndPasswordUseCaseImpl signUpWithEmailAndPasswordUseCaseImpl;

  RegisterBloc({required this.signUpWithEmailAndPasswordUseCaseImpl});

  @override
  mapListenEvent(IEvent event) {
    if (event is SignUpWithEmailAndPasswordEvent) {
      _handleSignUpWithEmailAndPassword(event);
    }
  }

  _handleSignUpWithEmailAndPassword(
      SignUpWithEmailAndPasswordEvent event) async {
    dispatchState(Loading(data: null));

    final request =
        await signUpWithEmailAndPasswordUseCaseImpl.call(event.params);

    request.fold((l) => showFailure(event.params.context), (r) {
      navigatorService.pop();

      dispatchState(Stable(data: null));

      _buildConcludePopUp(event.params.context);
    });
  }

  _buildConcludePopUp(final BuildContext context) {
    showCustomDialog(context,
        title: const Center(
          child: Text('Alerta'),
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check,
              color: Colors.green,
              size: 90,
            ),
            Text('Cadastro concluido com sucesso!'),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () => navigatorService.pop(),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: const Text(
              'OK',
              style: TextStyle(color: Colors.white),
            ),
          )
        ]);
  }
}
