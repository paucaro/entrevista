import 'package:auto_size_text/auto_size_text.dart';
import 'package:entrevista_ff/src/bloc/teoria_bloc/bloc.dart';
import 'package:entrevista_ff/src/models/topic.dart';
import 'package:entrevista_ff/src/ui/aditionals/error.dart';
import 'package:entrevista_ff/src/ui/aditionals/loading.dart';
import 'package:entrevista_ff/src/ui/teoria/topic_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class TeoriaScreen extends StatefulWidget {
  @override
  _TeoriaScreenState createState() => _TeoriaScreenState();
}

class _TeoriaScreenState extends State<TeoriaScreen> {
  List<Topic> topicos = <Topic>[];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeoriaBloc, TeoriaState>(
      builder: (context, state) {
        if (state is TeoriaLoaded) {
          topicos = state.topicos;
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
                        delegate:
                            SliverChildListDelegate(_buildTopicList(context, topicos)),
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
          return const ErrorPage(
            message:
                'No se puede cargas los topicos. \n Verifique su conexión a internet.',
          );
        }
        return const ErrorPage();
      },
    );
  }

  List _buildTopicList(BuildContext context, List<Topic> topicos) {
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
                CircleAvatar(
                  backgroundColor: Colors.purpleAccent,
                  child: Text(
                    item.order.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
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

  void _showTopic(BuildContext context, String idTopic, String topicName) {
    showModalBottomSheet<Widget>(
      context: context,
      builder: (sheetContext) => BottomSheet(
        builder: (_) => TopicDialog(
          idTopic: idTopic,
          topicName: topicName
        ),
        onClosing: () {},
      )
    );
  }
}
