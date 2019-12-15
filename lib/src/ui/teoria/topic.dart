import 'package:entrevista_ff/src/bloc/topic_bloc/bloc.dart';
import 'package:entrevista_ff/src/repository/teoria_repository.dart';
import 'package:entrevista_ff/src/ui/teoria/topic_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Topics extends StatelessWidget {
  const Topics({Key key, @required this.idTopic, this.topicName})
    : super(key: key);

  final String idTopic;
  final String topicName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TopicBloc>(
      create: (context) {
        return TopicBloc(teoriaRepository: TeoriaRepository())
          ..add(LoadTopic(idTopic));
      },
      child: TopicScreen(idTopic: idTopic, topicName: topicName,),
    );
  }
}