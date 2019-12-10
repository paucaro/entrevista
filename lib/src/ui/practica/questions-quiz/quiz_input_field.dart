import 'package:entrevista_ff/src/bloc/respuestas_db_bloc/bloc.dart';
import 'package:entrevista_ff/src/ui/practica/questions-quiz/quiz_input_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizInputField extends StatelessWidget {
  const QuizInputField({Key key, @required this.idPregunta})
    : super(key: key);

  final String idPregunta;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RespuestasBDBloc>(
      create: (context) {
        return RespuestasBDBloc();
      },
      child: QuizInputFieldWidget(idPregunta: idPregunta,),
    );
  }
}