import 'package:entrevista_ff/src/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:entrevista_ff/src/bloc/authentication_bloc/authentication_event.dart';
import 'package:entrevista_ff/src/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final String name;

  HomeScreen({Key key, @required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ENTREVISTA_TITLE),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).dispatch(
                LoggedOut(),
              );
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(child: Text('Welcome $name!')),
        ],
      ),
    );
  }
}