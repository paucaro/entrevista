import 'dart:io';

import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:entrevista_ff/src/ui/aditionals/error.dart';
import 'package:entrevista_ff/src/ui/teoria/topic.dart';
import 'package:entrevista_ff/src/util/constants.dart';
import 'package:flutter/material.dart';

class TopicDialog extends StatefulWidget {
  const TopicDialog({Key key, this.idTopic, this.topicName}) : super(key: key);

  final String idTopic;
  final String topicName;
  @override
  _TopicDialogState createState() => _TopicDialogState();
}

class _TopicDialogState extends State<TopicDialog> {
  bool processing;

  @override
  void initState() {
    super.initState();
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
              widget.topicName,
              style: Theme.of(context).textTheme.headline6
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                randomChoice<String>(LIST_FRASES_INTERVIEW),
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          if (processing)
            const CircularProgressIndicator()
          else
            RaisedButton(
              child: const Text('Vamos a aprender!'),
              onPressed: () => _startLearning(widget.idTopic, widget.topicName),
            ),
          const SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }

  void _startLearning(String idTopic, String topicName) {
    setState(() {
      processing = true;
    });
    try {
      Navigator.pop(context);
      Navigator.of(context).push(MaterialPageRoute<void>(
          builder: (_) => Topics(
                idTopic: idTopic,
                topicName: topicName,
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
