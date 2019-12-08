import 'package:entrevista_ff/src/bloc/preguntas_db_bloc/bloc.dart';
import 'package:entrevista_ff/src/models/pregunta.dart';
import 'package:entrevista_ff/src/ui/practica/error.dart';
import 'package:entrevista_ff/src/ui/practica/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class QuizPage extends StatefulWidget {
  const QuizPage(
      {Key key,
      @required this.idCompetencia,
      @required this.nombreCompetencia,
      @required this.noOfQuestions})
      : super(key: key);

  final String idCompetencia;
  final String nombreCompetencia;
  final int noOfQuestions;

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Pregunta> listPreguntas = <Pregunta>[];

  int _currentIndex = 0;

  final TextStyle _questionStyle = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.white);

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreguntaDBBloc, PreguntaDBState>(
      builder: (context, state) {
        if (state is PreguntaDBLoaded) {
          listPreguntas = state.preguntas;

          return WillPopScope(
            onWillPop: _onWillPop,
            child: Scaffold(
              key: _key,
              appBar: AppBar(
                title: Text(widget.nombreCompetencia),
                elevation: 0,
              ),
              body: Stack(
                children: <Widget>[
                  ClipPath(
                    clipper: WaveClipperTwo(),
                    child: Container(
                      decoration:
                          BoxDecoration(color: Theme.of(context).primaryColor),
                      height: 200,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Colors.white70,
                              child: Text('${_currentIndex + 1}'),
                            ),
                            const SizedBox(
                              width: 16.0,
                            ),
                            Expanded(
                                child: Text(
                              listPreguntas[_currentIndex].pregunta,
                              softWrap: true,
                              style: _questionStyle,
                            ))
                          ],
                        ),
                        // TODO Implement part
                        Expanded(
                          child: Container(
                              alignment: Alignment.bottomCenter,
                              child: RaisedButton(
                                child: Text(
                                    _currentIndex == (listPreguntas.length - 1)
                                        ? 'Volver'
                                        : 'Siguiente'),
                                onPressed: _nextSubmit,
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
        if (state is PreguntaDBLoading) {
          return Loading();
        }
        if (state is PreguntaDBNotLoaded) {
          return const ErrorPage(
            message:
                'No se puede cargar las preguntas, \n Verifique su conexión a Internet.',
          );
        }
        return const ErrorPage();
      },
    );
  }

  void _nextSubmit() {
    if(_currentIndex < (listPreguntas.length - 1)) {
      setState(() {
        _currentIndex++;
      });
    } else {
      Navigator.pop(context, true);
    }
  }

  Future<bool> _onWillPop() async {
    return showDialog<bool>(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: const Text('¿Seguro que quieres salir de la práctica?'),
            title: const Text('Warning!'),
            actions: <Widget>[
              FlatButton(
                child: const Text('Si'),
                onPressed: () => Navigator.pop(context, true),
              ),
              FlatButton(
                child: const Text('No'),
                onPressed: () => Navigator.pop(context, false),
              )
            ],
          );
        });
  }
}
