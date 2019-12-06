import 'package:entrevista_ff/src/bloc/authentication_bloc/bloc.dart';
import 'package:entrevista_ff/src/bloc/navigation_bloc/bloc.dart';
import 'package:entrevista_ff/src/ui/home/home_welcome.dart';
import 'package:entrevista_ff/src/ui/practica/practica_screen.dart';
import 'package:entrevista_ff/src/ui/teoria/teoria_screen.dart';
import 'package:entrevista_ff/src/util/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key, @required this.user}) : super(key: key);

  final FirebaseUser user;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(ENTREVISTA_TITLE), elevation: 0),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundImage: widget.user.photoUrl != null
                      ? NetworkImage(widget.user.photoUrl)
                      : const AssetImage('assets/default-user.png'),
                )
              ],
              accountName: widget.user.displayName != null
                  ? Text(widget.user.displayName)
                  : Text(widget.user.email
                      .substring(0, widget.user.email.indexOf('@'))),
              accountEmail: Text(widget.user.email),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(INICIO_BUTTON),
              onTap: () {
                Navigator.pop(context);
                BlocProvider.of<NavigationBloc>(context)
                    .add(NavigationEvent.eventWelcome);
              },
            ),
            ListTile(
                leading: Icon(Icons.local_library),
                title: Text(TEORIA_BUTTON),
                onTap: () {
                  Navigator.pop(context);
                  BlocProvider.of<NavigationBloc>(context)
                      .add(NavigationEvent.eventTeoria);
                }),
            ListTile(
              leading: Icon(Icons.border_color),
              title: Text(PRACTICA_BUTTON),
              onTap: () {
                Navigator.pop(context);
                BlocProvider.of<NavigationBloc>(context)
                    .add(NavigationEvent.eventPractica);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text(LOGOUT_BUTTON),
              onTap: () {
                Navigator.pop(context);
                BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
              },
            ),
          ],
        ),
      ),
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          if (state is StateWelcome) {
            return HomeWelcome();
          }
          if (state is StateTeoria) {
            return TeoriaScreen();
          }
          if (state is StatePractica) {
            return PracticaScreen();
          }
          return Container();
        }
    ));
  }
}
