import 'package:entrevista_ff/src/util/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


abstract class RegisterEvent extends Equatable {
  RegisterEvent([List props = const[]]) : super(props);
}

class EmailChanged extends RegisterEvent {
  final String email;

  EmailChanged({@required this.email}) : super([email]);

  @override
  String toString() => EMAIL_CHANGED + '$email}';
}

class PasswordChanged extends RegisterEvent {
  final String password;

  PasswordChanged({@required this.password}) : super([password]);

  @override
  String toString() => PASSWORD_CHANGED + '$password}';
}

class Submitted extends RegisterEvent {
  final String email;
  final String password;

  Submitted({@required this.email, @required this.password})
    : super([email, password]);

  @override
  String toString() {
    return SUBMITTED + '$email, password: $password }';
  }
}