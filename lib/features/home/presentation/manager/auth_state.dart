import 'package:flutter/foundation.dart';

@immutable
abstract class AuthState {}

class InitialAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class SuccessAuthState extends AuthState {}

class FailedAuthState extends AuthState {
  final String errorMessage;

  FailedAuthState({
    required this.errorMessage,
  });
}