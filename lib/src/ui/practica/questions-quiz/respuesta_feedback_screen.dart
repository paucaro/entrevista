import 'package:entrevista_ff/src/bloc/respuesta_rbc_bloc/bloc.dart';
import 'package:entrevista_ff/src/ui/aditionals/error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RespuestaFeedbackScreen extends StatelessWidget {
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
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    state.respuestaOther,
                    style: TextStyle(fontSize: 16.0),
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