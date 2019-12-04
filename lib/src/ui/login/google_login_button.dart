import 'package:entrevista_ff/src/bloc/login_bloc/bloc.dart';
import 'package:entrevista_ff/src/bloc/login_bloc/login_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:entrevista_ff/src/util/constants.dart';

class GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GoogleSignInButton(
      text: GOOGLE_BUTTON ,
      onPressed: () {
        BlocProvider.of<LoginBloc>(context).add(
          LoginWithGooglePressed(),
        );
      },
    );
  }
}