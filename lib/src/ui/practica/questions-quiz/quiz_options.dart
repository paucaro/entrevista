import 'dart:io';

import 'package:entrevista_ff/src/models/competencia.dart';
import 'package:entrevista_ff/src/ui/aditionals/error.dart';
import 'package:entrevista_ff/src/ui/practica/quiz.dart';
import 'package:flutter/material.dart';

class QuizOptionsDialog extends StatefulWidget {
  const QuizOptionsDialog({Key key, this.competencia}) : super(key: key);

  final Competencia competencia;

  @override
  _QuizOptionsDialogState createState() => _QuizOptionsDialogState();
}

class _QuizOptionsDialogState extends State<QuizOptionsDialog> {
  int _noOfQuestions;
  bool processing;

  @override
  void initState() {
    super.initState();
    if (widget.competencia.cantidad < 10) {
      _noOfQuestions = widget.competencia.cantidad;
    } else {
      _noOfQuestions = 10;
    }
    processing = false;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey.shade200,
            child: Text(
              widget.competencia.nombre,
              style: Theme.of(context).textTheme.headline6.copyWith(),
            ),
          ),
          const SizedBox(height: 10.0),
          SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Text(
                    widget.competencia.descripcion,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
              )),
          const SizedBox(
            height: 20.0,
          ),
          const Text('Seleccione número de preguntas'),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              runSpacing: 16.0,
              spacing: 16.0,
              children: <Widget>[
                const SizedBox(
                  width: 0.0,
                ),
                if (widget.competencia.cantidad < 10)
                  ActionChip(
                    label: Text(widget.competencia.cantidad.toString()),
                    labelStyle: TextStyle(color: Colors.white),
                    backgroundColor:
                        _noOfQuestions == widget.competencia.cantidad
                            ? Colors.purpleAccent
                            : Colors.grey.shade600,
                    onPressed: () => _selectNumberOfQuestions(widget.competencia.cantidad),
                  ),
                if (widget.competencia.cantidad > 10)
                  ActionChip(
                    label: const Text('10'),
                    labelStyle: TextStyle(color: Colors.white),
                    backgroundColor: _noOfQuestions == 10
                            ? Colors.purpleAccent
                            : Colors.grey.shade600,
                    onPressed: () => _selectNumberOfQuestions(10),
                  ),
                if (widget.competencia.cantidad > 10 &&
                    widget.competencia.cantidad < 20)
                  ActionChip(
                    label: Text(widget.competencia.cantidad.toString()),
                    labelStyle: TextStyle(color: Colors.white),
                    backgroundColor: _noOfQuestions == widget.competencia.cantidad
                            ? Colors.purpleAccent
                            : Colors.grey.shade600,
                    onPressed: () => _selectNumberOfQuestions(widget.competencia.cantidad),
                  ),
                if (widget.competencia.cantidad > 20)
                  ActionChip(
                    label: const Text('20'),
                    labelStyle: TextStyle(color: Colors.white),
                    backgroundColor: _noOfQuestions == 20
                            ? Colors.purpleAccent
                            : Colors.grey.shade600,
                    onPressed: () => _selectNumberOfQuestions(20),
                  ),
                if (widget.competencia.cantidad > 20 &&
                    widget.competencia.cantidad < 30)
                  ActionChip(
                    label: Text(widget.competencia.cantidad.toString()),
                    labelStyle: TextStyle(color: Colors.white),
                    backgroundColor: _noOfQuestions == widget.competencia.cantidad
                            ? Colors.purpleAccent
                            : Colors.grey.shade600,
                    onPressed: () => _selectNumberOfQuestions(widget.competencia.cantidad),
                  ),
                if (widget.competencia.cantidad > 30)
                  ActionChip(
                    label: const Text('30'),
                    labelStyle: TextStyle(color: Colors.white),
                    backgroundColor: _noOfQuestions == 30
                            ? Colors.purpleAccent
                            : Colors.grey.shade600,
                    onPressed: () => _selectNumberOfQuestions(30),
                  ),
                if (widget.competencia.cantidad > 30 &&
                    widget.competencia.cantidad < 40)
                  ActionChip(
                    label: Text(widget.competencia.cantidad.toString()),
                    labelStyle: TextStyle(color: Colors.white),
                    backgroundColor: _noOfQuestions == widget.competencia.cantidad
                            ? Colors.purpleAccent
                            : Colors.grey.shade600,
                    onPressed: () => _selectNumberOfQuestions(widget.competencia.cantidad),
                  ),
                if (widget.competencia.cantidad > 40)
                  ActionChip(
                    label: const Text('40'),
                    labelStyle: TextStyle(color: Colors.white),
                    backgroundColor: _noOfQuestions == 40
                            ? Colors.purpleAccent
                            : Colors.grey.shade600,
                    onPressed: () => _selectNumberOfQuestions(40),
                  ),
                if (widget.competencia.cantidad > 40 &&
                    widget.competencia.cantidad < 50)
                  ActionChip(
                    label: Text(widget.competencia.cantidad.toString()),
                    labelStyle: TextStyle(color: Colors.white),
                    backgroundColor: _noOfQuestions == widget.competencia.cantidad
                            ? Colors.purpleAccent
                            : Colors.grey.shade600,
                    onPressed: () => _selectNumberOfQuestions(widget.competencia.cantidad),
                  ),
                if (widget.competencia.cantidad > 50)
                  ActionChip(
                    label: const Text('50'),
                    labelStyle: TextStyle(color: Colors.white),
                    backgroundColor: _noOfQuestions == 50
                            ? Colors.purpleAccent
                            : Colors.grey.shade600,
                    onPressed: () => _selectNumberOfQuestions(50),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          if (processing)
            const CircularProgressIndicator()
          else
            RaisedButton(
              child: const Text('Iniciar'),
              onPressed: () => _startQuiz(widget.competencia.id, widget.competencia.nombre),
            ),
          const SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }

  void _selectNumberOfQuestions(int i) {
    setState(() {
      _noOfQuestions = i;
    });
  }

  void _startQuiz(String id, String nombre) {
    setState(() {
      processing = true;
    });
    try {
      Navigator.pop(context);
      Navigator.of(context).push(MaterialPageRoute<void>(
          builder: (_) => Quiz(
                idCompetencia: id,
                nombreCompetencia: nombre,
                noOfQuestions: _noOfQuestions,
              )));
    } on SocketException catch (_) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute<void>(
              builder: (_) => const ErrorPage(
                    message:
                        'No se puede acceder a los servidores, \n Verifique su conexión a Internet.',
                  )));
    } catch (e) {
      print(e.message);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute<void>(
              builder: (_) => const ErrorPage(
                    message: 'Error inesperado al intentar conectarse a la API',
                  )));
    }
  }
}
