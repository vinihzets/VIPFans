import 'package:flutter/material.dart';

class SignUpParams {
  final String email;
  final String profileName;
  final BuildContext context;
  final String password;

  SignUpParams(
      {required this.email,
      required this.profileName,
      required this.context,
      required this.password});
}
