import 'package:entrevista_ff/src/bloc/preguntas_db_bloc/bloc.dart';
import 'package:entrevista_ff/src/repository/db_repository.dart';
import 'package:entrevista_ff/src/ui/practica/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Quiz extends StatelessWidget {
  const Quiz(
      {Key key, this.idCompetencia, this.nombreCompetencia, this.noOfQuestions})
      : super(key: key);

  final String idCompetencia;
  final String nombreCompetencia;
  final int noOfQuestions;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PreguntaDBBloc>(
      create: (context) {
        return PreguntaDBBloc(dataBaseRespository: DataBaseRespository())
          ..add(LoadPregunta(idCompetencia, noOfQuestions));
      },
      child: QuizPage(
        idCompetencia: idCompetencia,
        nombreCompetencia: nombreCompetencia,
        noOfQuestions: noOfQuestions,
      ),
    );
  }
}
