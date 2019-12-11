import 'package:bubble/bubble.dart';
import 'package:entrevista_ff/src/bloc/respuesta_rbc_bloc/bloc.dart';
import 'package:entrevista_ff/src/ui/aditionals/error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RespuestaFeedbackScreen extends StatelessWidget {
  const RespuestaFeedbackScreen({Key key, @required this.respuesta}) 
    :super(key: key);

  final String respuesta;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RespuestaRBCBloc, RespuestaRBCState>(
      builder: (context, state) {
        if (state is RespuestaRBCDone) {
          return SingleChildScrollView(
            child: Column(children: <Widget>[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                color: Colors.grey.shade200,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.question_answer),
                    Text(
                      'Respuesta',
                      style: Theme.of(context).textTheme.title.copyWith(),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              if (respuesta != null)
              Container(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Bubble(
                    margin: const BubbleEdges.only(top: 10),
                    alignment: Alignment.topRight,
                    color: const Color.fromRGBO(225, 255, 199, 1.0),
                    nip: BubbleNip.rightTop,
                    shadowColor: Colors.purpleAccent,
                    elevation: 2,
                    child: Text(
                      respuesta,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              if (state.respuestaOther != null)
              Container(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Bubble(
                    margin: const BubbleEdges.only(top: 10),
                    alignment: Alignment.topRight,
                    nip: BubbleNip.leftTop,
                    shadowColor: Colors.purpleAccent,
                    elevation: 2,
                    child: Text(
                      state.respuestaOther,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
            ]),
          );
        }
        if (state is RespuestaRBCLoading) {
          return Center(child: const CircularProgressIndicator());
        }
        if (state is RespuestaRBCError) {
          return const ErrorWidgetPage(message: 'Verifique su conexión a Internet.');
        }
        return const ErrorWidgetPage(message: 'Se ha producido un error de red desconocido');
      },
    );
  }
}