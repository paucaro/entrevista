import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:entrevista_ff/src/util/constants.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

/// Events of login are:
/// EmailChanged, notifies the bloc, user has changed the email
/// PasswordChanges, notifies the bloc, user has changed the password
/// Submitted, notifies the bloc that the user has submitted the form
/// LoginWithGooglePressed, notifies the bloc, user has pressed
///   GoogleSignIn button
/// LoginWithCredentialsPressed, notifies the bloc, user has pressed
///   regular signIn button

class EmailChanged extends LoginEvent {
  const EmailChanged({@required this.email});

  final String email;

  @override
  List<Object> get props => [email];

  @override
  String toString() => EMAIL_CHANGED + '$email }';
}

class PasswordChanged extends LoginEvent {
  const PasswordChanged({@required this.password});

  final String password;

  @override
  List<Object> get props => [password];

  @override
  String toString() => PASSWORD_CHANGED + '$password }';
}

class Submitted extends LoginEvent {
  const Submitted({@required this.email, @required this.password});

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];

  @override
  String toString() {
    return SUBMITTED + '$email, password: $password}';
  }
}

class LoginWithGooglePressed extends LoginEvent {
  @override
  String toString() => 'LoginWithGooglePressed';
}

class LoginWithCredentialsPressed extends LoginEvent {
  const LoginWithCredentialsPressed(
      {@required this.email, @required this.password});

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];

  @override
  String toString() {
    return 'LoginWithCredentialsPressed { email: $email, password: $password}';
  }
}
