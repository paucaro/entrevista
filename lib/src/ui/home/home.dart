import 'package:entrevista_ff/src/bloc/navigation_bloc/bloc.dart';
import 'package:entrevista_ff/src/ui/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  final FirebaseUser user;

  const Home({Key key, this.user}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationBloc>(
      builder: (context) => NavigationBloc(),
      child: HomeScreen(user: user),
    );
  }
}