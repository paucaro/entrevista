import 'package:auto_size_text/auto_size_text.dart';
import 'package:entrevista_ff/src/bloc/teoria_bloc/bloc.dart';
import 'package:entrevista_ff/src/models/topic.dart';
import 'package:entrevista_ff/src/ui/aditionals/error.dart';
import 'package:entrevista_ff/src/ui/aditionals/loading.dart';
import 'package:entrevista_ff/src/ui/teoria/topic_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TeoriaScreen extends StatefulWidget {
  @override
  _TeoriaScreenState createState() => _TeoriaScreenState();
}

class _TeoriaScreenState extends State<TeoriaScreen> {
  List<Topic> topicos = <Topic>[];
  Map<String, bool> mapProgress = {};
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeoriaBloc, TeoriaState>(
      builder: (context, state) {
        if (state is TeoriaLoaded) {
          topicos = state.topicos;
          mapProgress = state.progress;
          return Stack(
            children: <Widget>[
              ClipPath(
                clipper: WaveClipperTwo(),
                child: Container(
                  decoration:
                      BoxDecoration(color: Theme.of(context).primaryColor),
                  height: 200,
                ),
              ),
              CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: <Widget>[
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Text(
                          'Selecciona un tópico y empieza a aprender.',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0),
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.all(16.0),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate(
                            _buildTopicList(context, topicos, mapProgress)),
                      ),
                    )
                  ])
            ],
          );
        }
        if (state is TeoriaLoading) {
          return Loading();
        }
        if (state is TeoriaNotLoaded) {
          return const ErrorPageReturn(
            message:
                'No se puede cargas los topicos. \n Verifique su conexión a internet.',
          );
        }
        return const ErrorPageReturn();
      },
    );
  }

  List _buildTopicList(BuildContext context, List<Topic> topicos,
      Map<String, bool> mapProgress) {
    final List<Widget> listItems = [];

    for (int j = 0; j < topicos.length; j++) {
      final item = topicos[j];
      listItems.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: MaterialButton(
          elevation: 1.0,
          highlightElevation: 1.0,
          onPressed: () => _showTopic(context, item.id, item.name),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          color: Colors.white,
          textColor: Colors.black87,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                showProgress(item.id, item.order.toString()),
                Expanded(
                  child: AutoSizeText(
                    item.name,
                    minFontSize: 12.0,
                    textAlign: TextAlign.right,
                  ),
                )
              ],
            ),
          ),
        ),
      ));
    }

    return listItems;
  }

  Widget showProgress(String idTopic, String order) {
    return CircularPercentIndicator(
      radius: 60.0,
      lineWidth: 5.0,
      percent: (mapProgress[idTopic]) ? 1.0 : 0.0,
      center: CircleAvatar(
        backgroundColor: Colors.orange,
        child: Column(
          children: <Widget>[
            Text(
              order,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              (mapProgress[idTopic]) ? '100%' : '0%',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 9.0,
                  fontStyle: FontStyle.italic),
            )
          ],
        ),
      ),
      progressColor: Colors.green,
    );
  }

  void _showTopic(BuildContext context, String idTopic, String topicName) {
    showModalBottomSheet<Widget>(
        context: context,
        builder: (sheetContext) => BottomSheet(
              builder: (_) =>
                  TopicDialog(idTopic: idTopic, topicName: topicName),
              onClosing: () {},
            ));
  }
}
