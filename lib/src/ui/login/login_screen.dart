import 'package:entrevista_ff/src/bloc/login_bloc/login_bloc.dart';
import 'package:entrevista_ff/src/repository/user_repository.dart';
import 'package:entrevista_ff/src/ui/login/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository _userRepository;

  LoginScreen({Key key, @required UserRepository userRepository})
    : assert(userRepository != null),
      _userRepository = userRepository,
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginBloc>(
        builder: (context) => LoginBloc(userRepository: _userRepository),
        child: LoginForm(userRepository: _userRepository),
      ),
    );
  }
}