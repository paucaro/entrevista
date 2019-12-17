import 'package:entrevista_ff/src/bloc/perfil_bloc/bloc.dart';
import 'package:entrevista_ff/src/repository/perfil_repository.dart';
import 'package:entrevista_ff/src/util/constants.dart';
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
              child: Column(
                children: <Widget>[
                  Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(getPathImageLevel(state.level)),
                      )),
                ),
              ),
                   Container(
                     color: const Color.fromRGBO(0, 0, 0, 0.2),
                     child: Padding(
                       padding: const EdgeInsets.all(18.0),
                       child: Text('Rango: ' + getLevel(state.level),
                style: TextStyle(fontSize: 20.0),),
                     ),
                   ),
                ]
              ),
            ),
          );
        }
        if (state is PerfilLoading){
          return Center(child: const CircularProgressIndicator(),);
        }
        if (state is PerfilNotLoaded) {
          return Container();
        }
        return Container();
      },
    );
  }

  String getPathImageLevel(int level) {
    switch (level) {
      case 1:
        return ASSETS_PRINCIPIANTE;
        break;
      case 2:
        return ASSETS_BRONCE;
        break;
      case 3:
        return ASSETS_PLATA;
        break;
      case 4:
        return ASSETS_ORO;
        break;
      case 5:
        return ASSETS_PLATINO;
        break;
      case 6:
        return ASSETS_DIAMANTE;
        break;
      case 7:
        return ASSETS_HEROICO;
        break;
      case 8:
        return ASSETS_GRAN_MAESTRO;
        break;
      default:
        return ASSETS_GRAN_MAESTRO;
        break;
    }
  }

  String getLevel(int level) {
    switch (level) {
      case 1:
        return 'Novato';
        break;
      case 2:
        return 'Bronce';
        break;
      case 3:
        return 'Plata';
        break;
      case 4:
        return 'Oro';
        break;
      case 5:
        return 'Platino';
        break;
      case 6:
        return 'Diamante';
        break;
      case 7:
        return 'Heroico';
        break;
      case 8:
        return 'Gran Maestro';
        break;
      default:
        return 'Gran Maestro';
        break;
    }
  }
}