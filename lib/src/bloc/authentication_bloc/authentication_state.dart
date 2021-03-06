import 'package:entrevista_ff/src/util/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

/// AuthenticationState: User's authentication state:
/// Unintialized - waiting to see if the user is authenticated or not on app start 
///   (user might be seeing a splash screen)
/// Authenticated - successfully autenticated
///   (user might see a home screen)
/// Unauthenticated - not authenticated
///   (user might see a login form)

class Uninitialized extends AuthenticationState {
  @override
  String toString() => UNINITIALIZED;
}

class Authenticated extends AuthenticationState {
  const Authenticated(this.user);

  final FirebaseUser user;

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'Authenticated { displayName: $user.email}';
}

class Unauthenticated extends AuthenticationState {
  @override
  String toString() => UNAUTHENTICATED;
}