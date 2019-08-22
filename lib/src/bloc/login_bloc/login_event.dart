import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:entrevista_ff/src/util/constants.dart';

abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]) : super(props);
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
  final String email;

  EmailChanged({@required this.email}) : super([email]);

  @override
  String toString() => EMAIL_CHANGED + '$email }';
}

class PasswordChanged extends LoginEvent {
  final String password;

  PasswordChanged({@required this.password}) : super([password]);

  @override
  String toString() => PASSWORD_CHANGED + '$password }';
}

class Submitted extends LoginEvent {
  final String email;
  final String password;

  Submitted({@required this.email, @required this.password})
    : super ([email, password]);

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
  final String email;
  final String password;

  LoginWithCredentialsPressed({@required this.email, @required this.password})
    : super([email, password]);
  
  @override
  String toString() {
    return 'LoginWithCredentialsPressed { email: $email, password: $password}';
  }
}