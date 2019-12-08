import 'package:entrevista_ff/src/bloc/authentication_bloc/bloc.dart';
import 'package:entrevista_ff/src/repository/user_repository.dart';
import 'package:entrevista_ff/src/ui/home/home.dart';
import 'package:entrevista_ff/src/ui/login/login_screen.dart';
import 'package:entrevista_ff/src/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
class App extends StatelessWidget {
  final UserRepository _userRepository = UserRepository();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) {
            return AuthenticationBloc(userRepository: _userRepository)
              ..add(AppStarted());
          },
        ),
      ],
      child: MaterialApp(
        title: 'Mi Entrevista',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          accentColor: Colors.purpleAccent,
          fontFamily: 'Montserrat',
          buttonColor: Colors.orange,
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            textTheme: ButtonTextTheme.primary
          )
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) {
            return BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
                if (state is Uninitialized) {
                  return SplashScreen();
                }
                if (state is Unauthenticated) {
                  return LoginScreen(userRepository: _userRepository,);
                }
                if (state is Authenticated) {
                  return  Home(user: state.user);
                }
                return Center(child: const CircularProgressIndicator());
              },
            );
          },
          '/addDatabase': (context) {
            return;
          }
        },
      ),
    );
  }
}
