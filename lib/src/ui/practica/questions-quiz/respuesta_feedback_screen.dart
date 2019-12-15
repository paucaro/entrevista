import 'package:bubble/bubble.dart';
import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:entrevista_ff/src/bloc/respuesta_rbc_bloc/bloc.dart';
import 'package:entrevista_ff/src/ui/aditionals/error.dart';
import 'package:entrevista_ff/src/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flare_flutter/flare_actor.dart';

class RespuestaFeedbackScreen extends StatelessWidget {
  const RespuestaFeedbackScreen({Key key, @required this.respuesta})
      : super(key: key);

  final String respuesta;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RespuestaRBCBloc, RespuestaRBCState>(
      builder: (context, state) {
        if (state is RespuestaRBCDone) {
          return CustomScrollView(slivers: <Widget>[
            SliverList(
          delegate: SliverChildListDelegate(
            [
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
              Container(
                color: Colors.orange,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text('Bien hecho, ahora desliza hacia abajo para ver tu respuesta y una similar obtenida de otros usuarios', 
                        style: TextStyle(color: Colors.white),),
                      ),
                      Icon(Icons.arrow_downward, color: Colors.white, size: 40,)
                    ],
                  ),
                )
                ),
              Container(
                color: Colors.pink, height: 350.0,
                child: FlareActor('assets/menCool.flr',
              alignment:Alignment.center, fit:BoxFit.contain, animation:'Celebrate Duplicate'),
                ),
              const SizedBox(height: 20.0),
              if (respuesta != null)
              Container(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          child: const Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Text('Tu respuesta', 
                            style: TextStyle(fontStyle: FontStyle.italic),),
                          ),
                        ),
                      ),
                      Bubble(
                        margin: const BubbleEdges.only(top: 10),
                        alignment: Alignment.topRight,
                        //color: const Color.fromRGBO(225, 255, 199, 1.0),
                        color: Colors.orange,
                        nip: BubbleNip.rightTop,
                        shadowColor: Colors.purpleAccent,
                        elevation: 2,
                        child: Text(
                          respuesta,
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              if (state.respuestaOther != null)
              Container(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text('Respuesta similar de otros usuarios', 
                            style: TextStyle(fontStyle: FontStyle.italic),),
                          ),
                        ),
                      ),
                      Bubble(
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
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              
                Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                color: Colors.grey.shade200,
                child: Text(
                  randomChoice<String>(LIST_FRASES_WELLDONE),
                  style: Theme.of(context).textTheme.title.copyWith(),
                ),
              ),
              
            ],
          ),
        ),
          ]);
        }
        if (state is RespuestaRBCLoading) {
          return Center(child: const CircularProgressIndicator());
        }
        if (state is RespuestaRBCError) {
          return const ErrorWidgetPage(
              message: 'Verifique su conexión a Internet.');
        }
        return const ErrorWidgetPage(
            message: 'Se ha producido un error de red desconocido');
      },
    );
  }
}
