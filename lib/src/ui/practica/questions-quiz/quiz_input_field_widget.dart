import 'package:entrevista_ff/src/bloc/respuestas_db_bloc/bloc.dart';
import 'package:entrevista_ff/src/ui/practica/questions-quiz/respuesta_feedback.dart';
import 'package:entrevista_ff/src/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizInputFieldWidget extends StatefulWidget {
  const QuizInputFieldWidget({Key key, @required this.idPregunta})
      : super(key: key);

  final String idPregunta;

  @override
  _QuizInputFieldWidgetState createState() => _QuizInputFieldWidgetState();
}

class _QuizInputFieldWidgetState extends State<QuizInputFieldWidget> {
  final TextEditingController _respuestaController = TextEditingController();

  RespuestasBDBloc _respuestasBDBloc;
  String respuesta;

  bool get isPopulated => _respuestaController.text.isNotEmpty;

  bool isSendButtonEnabled(RespuestasDBState state) {
    return state.isFieldValid && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();
    _respuestasBDBloc = BlocProvider.of<RespuestasBDBloc>(context);
    _respuestaController.addListener(_onRespuestaChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RespuestasBDBloc, RespuestasDBState>(
        listener: (context, state) {
      if (state.isSubmitting) {
        showModalBottomSheet<Widget>(
            context: context,
            builder: (sheetContext) => BottomSheet(
                  builder: (_) => RespuestaFeedback(
                    respuesta: respuesta,
                    idPregunta: widget.idPregunta,
                  ),
                  onClosing: () {},
                ));
      }
    }, child: BlocBuilder<RespuestasBDBloc, RespuestasDBState>(
      builder: (context, state) {
        return Container(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        child: TextFormField(
                          style: TextStyle(
                              color: const Color(0xff203152), fontSize: 15.0),
                          controller: _respuestaController,
                          decoration: InputDecoration.collapsed(
                            hintText: 'Escribe tu respuesta...',
                            hintStyle:
                                TextStyle(color: const Color(0xffaeaeae)),
                          ),
                          keyboardType: TextInputType.multiline,
                          maxLines: 7,
                          autocorrect: false,
                          autovalidate: true,
                          validator: (_) {
                            return !state.isRespuestaValid
                                ? INVALID_ANSWER
                                : null;
                          },
                        ),
                      ),
                    ),

                    // Button send response
                    Material(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: IconButton(
                          icon: Icon(Icons.send),
                          onPressed: isSendButtonEnabled(state)
                              ? _onFormSubmitted
                              : null, // -- Respuesta --
                          color: const Color(0xff203152),
                        ),
                      ),
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ));
  }

  @override
  void dispose() {
    _respuestaController.dispose();
    super.dispose();
  }

  void _onRespuestaChanged() {
    _respuestasBDBloc.add(
      RespuestaChanged(respuesta: _respuestaController.text),
    );
  }

  void _onFormSubmitted() {
    _respuestasBDBloc.add(Submitted());
    setState(() {
      respuesta = _respuestaController.text;
    });
    _respuestaController.clear();
  }
}


