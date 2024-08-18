import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:only_fans/core/core.dart';
import 'package:only_fans/core/global/entities/user_entity.dart';
import 'package:only_fans/features/login/domain/repositories/login_repository.dart';

class SignInUseCaseImpl implements UseCase<SignInParams, UserEntity> {
  LoginRepository repository;

  SignInUseCaseImpl({required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call(SignInParams params) {
    return repository.signIn(params);
  }
}

class SignInParams {
  final String email;
  final String password;
  final BuildContext context;

  SignInParams({
    required this.email,
    required this.password,
    required this.context,
  });
}
