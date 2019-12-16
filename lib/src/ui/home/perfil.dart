import 'package:entrevista_ff/src/bloc/perfil_bloc/bloc.dart';
import 'package:entrevista_ff/src/repository/perfil_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Perfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PerfilBloc>(
      create: (context) => PerfilBloc(perfilRepository: PerfilRepository())
        ..add(LoadPerfil()),
      child: PerfilScreen(),
    );
  }
}

class PerfilScreen extends StatefulWidget {
  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PerfilBloc, PerfilState>(
      builder: (context, state) {
        if (state is PerfilLoaded) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(getLevel(state.level)),
            ),
          );
        }
        if (state is PerfilLoading){
          return Center(child: const CircularProgressIndicator(),);
        }
        if (state is PerfilNotLoaded) {
          return Center(child: Column(
            children: <Widget>[
              Icon(Icons.error),
              const Text('Error al cargar datos del perfil')
            ],
          ),);
        }
        return Container();
      },
    );
  }

  String getLevel(int level) {
    switch (level) {
      case 1:
        return 'Bronce';
        break;
      case 2:
        return 'Plata';
        break;
      case 3:
        return 'Oro';
        break;
      case 4:
        return 'Platino';
        break;
      case 5:
        return 'Diamante';
        break;
      case 6:
        return 'Heroico';
        break;
      case 7:
        return 'Gran Maestro';
        break;
      default:
        return '';
        break;
    }
  }
}