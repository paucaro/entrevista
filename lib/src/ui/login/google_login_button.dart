import 'dart:async';

import 'package:entrevista_ff/src/bloc/login_bloc/bloc.dart';
import 'package:entrevista_ff/src/bloc/login_bloc/login_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:entrevista_ff/src/util/constants.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

class GoogleLoginButton extends StatefulWidget {
  @override
  _GoogleLoginButtonState createState() => _GoogleLoginButtonState();
}

class _GoogleLoginButtonState extends State<GoogleLoginButton> {
  StreamSubscription<DataConnectionStatus> listener;

  @override
  void dispose() {
    listener.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleSignInButton(
        text: GOOGLE_BUTTON,
        onPressed: () async {
          final DataConnectionStatus status = await checkInternetConectivity();
          if (status == DataConnectionStatus.disconnected) {
            showDialog<void>(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text('No internet'),
                      content: const Text("You're not connected to a network"),
                      actions: <Widget>[
                        FlatButton(
                          child: const Text('Ok'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    ));
          } else {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(LOGGING_IN),
                    const CircularProgressIndicator(),
                  ],
                ),
              ),
            );
            BlocProvider.of<LoginBloc>(context).add(
              LoginWithGooglePressed(),
            );
          }
        });
  }

  Future<DataConnectionStatus> checkInternetConectivity() async {
    listener = DataConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case DataConnectionStatus.connected:
          print('Data connection is available.');
          break;
        case DataConnectionStatus.disconnected:
          print('You are disconnected from the internet.');
          break;
      }
    });
    return await DataConnectionChecker().connectionStatus;
  }
}
