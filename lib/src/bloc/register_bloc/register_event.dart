import 'package:entrevista_ff/src/util/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends RegisterEvent {
  const EmailChanged({@required this.email});

  final String email;

  @override
  List<Object> get props => [email];

  @override
  String toString() => EMAIL_CHANGED + '$email}';
}

class PasswordChanged extends RegisterEvent {
  const PasswordChanged({@required this.password});

  final String password;

  @override
  List<Object> get props => [password];

  @override
  String toString() => PASSWORD_CHANGED + '$password}';
}

class Submitted extends RegisterEvent {
  const Submitted({@required this.email, @required this.password});
  
  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
  
  @override
  String toString() {
    return SUBMITTED + '$email, password: $password }';
  }
}