import 'package:entrevista_ff/src/bloc/teoria_bloc/bloc.dart';
import 'package:entrevista_ff/src/repository/teoria_repository.dart';
import 'package:entrevista_ff/src/ui/teoria/teoria_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Teoria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TeoriaBloc>(
      create: (context) { 
        return TeoriaBloc(teoriaRepository: TeoriaRepository())
          ..add(LoadTeoria());
      },
      child: TeoriaScreen(),
    );
  }
}