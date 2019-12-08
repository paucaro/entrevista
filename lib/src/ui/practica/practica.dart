import 'package:entrevista_ff/src/bloc/database_bloc/bloc.dart';
import 'package:entrevista_ff/src/repository/db_repository.dart';
import 'package:entrevista_ff/src/ui/practica/practica_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Practica extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DatabaseBloc>(
      create: (context) {
        return DatabaseBloc(dataBaseRespository: DataBaseRespository())
          ..add(LoadDatabase());
      },
      child: PracticaScreen(),
    );
  }
}
