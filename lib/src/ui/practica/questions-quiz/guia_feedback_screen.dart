import 'package:entrevista_ff/src/bloc/guias_db_bloc/bloc.dart';
import 'package:entrevista_ff/src/ui/aditionals/error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GuiaFeedbackScreen extends StatelessWidget {
  const GuiaFeedbackScreen({Key key, this.preguntaId}) : super(key: key);

  final String preguntaId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GuiaDBBLOC, GuiaDBState>(
      builder: (context, state) {
        if (state is GuiaLoaded) {
          return SingleChildScrollView(
            child: Column(children: <Widget>[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                color: Colors.grey.shade200,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.lightbulb_outline),
                    Text(
                      'Guía',
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
                    state.guia,
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
        if (state is GuiaLoading) {
          return Center(child: const CircularProgressIndicator());
        }
        if (state is GuiaNotLoaded) {
          return const ErrorWidgetPage(
              message: 'No se puede cargar la guia, \n Verifique su conexión a Internet.');
        }
        return const ErrorWidgetPage(message: 'Se ha producido un error de red desconocido');
      },
    );
  }
}
