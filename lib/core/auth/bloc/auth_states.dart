import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingState extends AuthState {}

class AuthenticatedState extends AuthState {}

class UnAuthenticatedState extends AuthState {}

class AuthError extends AuthState {
  final String error;

  AuthError(this.error);
}
