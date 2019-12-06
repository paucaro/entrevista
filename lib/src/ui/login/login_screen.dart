import 'package:entrevista_ff/src/bloc/login_bloc/login_bloc.dart';
import 'package:entrevista_ff/src/repository/user_repository.dart';
import 'package:entrevista_ff/src/ui/login/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  final UserRepository _userRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(
      builder: (BuildContext context) {
        return OfflineBuilder(
            connectivityBuilder: (BuildContext context,
                ConnectivityResult connectivity, Widget child) {
              final bool connected = connectivity != ConnectivityResult.none;
              return Stack(
                fit: StackFit.expand,
                children: [
                  child,
                  Positioned(
                    left: 0.0,
                    right: 0.0,
                    height: 32.0,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      color: connected ? null : const Color(0xFFEE4400),
                      child: connected
                          ? null
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'OFFLINE',
                                  style: TextStyle(color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                SizedBox(
                                  width: 12.0,
                                  height: 12.0,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2.0,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                ],
              );
            },
            child: BlocProvider<LoginBloc>(
              create: (BuildContext context) =>
                  LoginBloc(userRepository: _userRepository),
              child: LoginForm(userRepository: _userRepository),
            ));
      },
    ));
  }
}
