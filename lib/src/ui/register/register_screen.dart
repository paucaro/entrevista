import 'package:entrevista_ff/src/bloc/register_bloc/register_bloc.dart';
import 'package:entrevista_ff/src/repository/user_repository.dart';
import 'package:entrevista_ff/src/ui/register/register_form.dart';
import 'package:entrevista_ff/src/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key key, @required UserRepository userRepository}) 
    : assert(userRepository != null),
      _userRepository = userRepository,
      super(key: key);

  final UserRepository _userRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(REGISTER_TITLE)),
      body: Center(
        child: BlocProvider<RegisterBloc>(
          create: (BuildContext context) => RegisterBloc(userRepository: _userRepository),
          child: RegisterForm(),
        ),
      ),
    );
  }
}