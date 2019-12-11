import 'package:entrevista_ff/src/bloc/respuesta_rbc_bloc/bloc.dart';
import 'package:entrevista_ff/src/repository/db_repository.dart';
import 'package:entrevista_ff/src/ui/practica/questions-quiz/respuesta_feedback_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RespuestaFeedback extends StatelessWidget {
  const RespuestaFeedback({Key key, @required this.respuesta,
    @required this.idPregunta})
    : super(key: key);

  final String respuesta;
  final String idPregunta;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RespuestaRBCBloc>(
      create: (context) {
        return RespuestaRBCBloc(dataBaseRespository: DataBaseRespository())
          ..add(LoadRespuesta(respuesta: respuesta, idPregunta: idPregunta));
      },
      child: RespuestaFeedbackScreen(respuesta: respuesta,),
    );
  }
}