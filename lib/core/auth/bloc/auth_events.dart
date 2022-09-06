import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInRequestEvent extends AuthEvent {
  final String email;
  final String password;

  SignInRequestEvent(this.email, this.password);
}

class SignUpRequestEvent extends AuthEvent {
  final String email;
  final String password;

  SignUpRequestEvent(this.email, this.password);
}

class GoogleSignInRequestEvent extends AuthEvent {}

class SignOutRequestEvent extends AuthEvent {}
