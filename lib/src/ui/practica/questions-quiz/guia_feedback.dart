import 'package:entrevista_ff/src/bloc/guias_db_bloc/bloc.dart';
import 'package:entrevista_ff/src/repository/db_repository.dart';
import 'package:entrevista_ff/src/ui/practica/questions-quiz/guia_feedback_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GuiaFeedback extends StatelessWidget {
  const GuiaFeedback({Key key, @required this.idPregunta})
    : super(key: key);

  final String idPregunta;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GuiaDBBLOC>(
      create: (context) {
        return GuiaDBBLOC(dataBaseRespository: DataBaseRespository())
          ..add(LoadGuia(idPregunta));
      },
      child: GuiaFeedbackScreen(preguntaId: idPregunta,),
    );
  }
}