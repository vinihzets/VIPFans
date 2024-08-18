import 'package:flutter/material.dart';
import 'package:only_fans/core/core.dart';
import 'package:only_fans/core/components/layout/full_size_layout_button.dart';
import 'package:only_fans/core/components/layout/persistent_button.dart';
import 'package:only_fans/core/components/layout/responsive_center_widget.dart';
import 'package:only_fans/core/components/layout/vertical_spacer.dart';
import 'package:only_fans/features/login/domain/usecases/sign_in_usecase_impl.dart';
import 'package:only_fans/features/login/presentation/bloc/login_bloc.dart';
import 'package:only_fans/features/login/presentation/bloc/login_event.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginBloc bloc;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    bloc = ContainerInjectorImpl().find<LoginBloc>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: ResponsiveCenterWidget(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Image.asset(
                        //   ImageAsset.login.path,
                        //   width: 200.0,
                        //   height: 100.0,
                        // ),
                        const VSpacer(),
                        const Text(
                          'Faça seu login!',
                          textAlign: TextAlign.center,
                        ),

                        const VSpacer(),
                        TextField(
                          controller: emailController,
                          // keyboardType: loginType.isEmail
                          //     ? TextInputType.emailAddress
                          //     : TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Insira seu E-mail',
                          ),
                          // inputFormatters: [maskInputFormatter],
                        ),
                        Column(
                          children: [
                            const VSpacer(),
                            TextField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: 'Insira sua Senha',
                              ),
                            ),
                          ],
                        ),
                        const VSpacer(),
                        _buildEnterButton(context),
                        // _RecoverPasswordSection(
                        //   bloc: widget.bloc,
                        //   data: data,
                        // ),
                        const VSpacer(),
                        // Text(
                        //   'Clicando em ${data.isRegistered ? 'ENTRAR' : 'PRÓXIMO'}, você declara que leu e aceita os Termos de Uso e Política de Privacidade do Colabora.',
                        //   textAlign: TextAlign.center,
                        // ).label(context),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () =>
                                  bloc.navigatorService.toNamed('register'),
                              child: const Text('Inscreva-se'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEnterButton(BuildContext context) {
    return FullSizeLayoutButton(
      child: FilledPersistentButton(
        bloc: bloc,
        onPressed: () => bloc.dispatchEvent(SignInWithEmailAndPasswordEvent(
            params: SignInParams(
                email: emailController.text,
                password: passwordController.text,
                context: context))),
        onPersisting: const Center(
          child: CircularProgressIndicator.adaptive(
            backgroundColor: Colors.white,
          ),
        ),
        onIdle: const Text('Entrar'),
      ),
    );
  }
}
