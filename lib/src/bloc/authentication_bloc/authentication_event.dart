import 'package:entrevista_ff/src/util/constants.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const []]) : super(props);
}

/// AppStarted event notify the bloc it needs to check if 
///   user is authenticated or not
/// LoggedIn event notify the bloc the user has successfully
///   logged in
/// LoggedOut event notify the bloc the user has 
///   succesfully logged out

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => APPSTARTED;
}

class LoggedIn extends AuthenticationEvent {
  @override
  String toString() => LOGGEDIN;
}

class LoggedOut extends AuthenticationEvent {
  @override
  String toString() => LOGGEDOUT;
}