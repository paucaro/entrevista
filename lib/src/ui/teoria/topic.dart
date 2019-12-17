import 'package:entrevista_ff/src/bloc/navigation_bloc/bloc.dart';
import 'package:entrevista_ff/src/bloc/topic_bloc/bloc.dart';
import 'package:entrevista_ff/src/bloc/update_level_bloc/bloc.dart';
import 'package:entrevista_ff/src/repository/perfil_repository.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<TopicBloc>(
          create: (context) {
            return TopicBloc(teoriaRepository: TeoriaRepository())
              ..add(LoadTopic(idTopic));
          },
        ),
        BlocProvider<UpdateLevelBloc>(
          create: (context) {
            return UpdateLevelBloc(perfilRepository: PerfilRepository());
          },
        ),
        BlocProvider<NavigationBloc>(
          create: (context) {
            return NavigationBloc();
          },
        )
      ],
      child: TopicScreen(
        idTopic: idTopic,
        topicName: topicName,
      ),
    );
  }
}
