import 'package:entrevista_ff/src/bloc/navigation_bloc/bloc.dart';
import 'package:entrevista_ff/src/bloc/topic_bloc/bloc.dart';
import 'package:entrevista_ff/src/models/subtopic.dart';
import 'package:entrevista_ff/src/ui/aditionals/error.dart';
import 'package:entrevista_ff/src/ui/aditionals/loading.dart';
import 'package:firebase_storage_image/firebase_storage_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:youtube_player/youtube_player.dart';
import 'package:entrevista_ff/src/bloc/update_level_bloc/bloc.dart';

class TopicScreen extends StatefulWidget {
  const TopicScreen({Key key, @required this.idTopic, @required this.topicName})
      : super(key: key);

  final String idTopic;
  final String topicName;

  @override
  _TopicScreenState createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  List<SubTopicList> listSubTopic = <SubTopicList>[];

  int _currentIndex = 0;

  final TextStyle _questionStyle = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.white);

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopicBloc, TopicState>(
      builder: (context, state) {
        if (state is TopicLoaded) {
          listSubTopic = state.subTopicList;

          return WillPopScope(
            onWillPop: _onWillPop,
            child: Scaffold(
              key: _key,
              appBar: AppBar(
                title: Text(widget.topicName),
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
                  CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: <Widget>[
                      SliverList(
                        delegate: SliverChildListDelegate([
                          Container(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
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
                                      listSubTopic[_currentIndex].title,
                                      softWrap: true,
                                      style: _questionStyle,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                Container(
                                    color: const Color.fromRGBO(
                                        255, 255, 255, 0.2),
                                    child: Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: Text(
                                        listSubTopic[_currentIndex].concepto,
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    )),
                                if (listSubTopic[_currentIndex].imageBool)
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                if (listSubTopic[_currentIndex].imageBool)
                                  Container(
                                      child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image(
                                      image: FirebaseStorageImage(
                                        listSubTopic[_currentIndex].image,
                                      ),
                                    ),
                                  )),
                                if (listSubTopic[_currentIndex].videoBool)
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                if (listSubTopic[_currentIndex].videoBool)
                                  Container(
                                    child: YoutubePlayer(
                                      context: context,
                                      source: listSubTopic[_currentIndex].video,
                                      quality: YoutubeQuality.HD,
                                      autoPlay: false,
                                      controlsTimeOut: Duration(seconds: 4),
                                      playerMode: YoutubePlayerMode.DEFAULT,
                                      onError: (error) {
                                        print(error);
                                      },
                                    ),
                                  )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: RaisedButton(
                              child: Text(
                                  _currentIndex == (listSubTopic.length - 1)
                                      ? 'Volver'
                                      : 'Siguiente'),
                              onPressed: _nextSubmit,
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          )
                        ]),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        }
        if (state is TopicLoading) {
          return Loading();
        }
        if (state is TopicNotLoaded) {
          return const ErrorPage(
            message:
                'No se puede cargar el tópico, \n Verifique su conexión a Internet.',
          );
        }
        return const ErrorPage();
      },
    );
  }

  Future _nextSubmit() async {
    if (_currentIndex < (listSubTopic.length - 1)) {
      setState(() {
        _currentIndex++;
      });
    } else {
      BlocProvider.of<UpdateLevelBloc>(context)
          .add(UpdateLevel(widget.idTopic));
      Navigator.pop(context, true);
      BlocProvider.of<NavigationBloc>(context).add(NavigationEvent.eventTeoria);
      //Navigator.pop(context, true);
    }
  }

  Future<bool> _onWillPop() async {
    return showDialog<bool>(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: const Text(
                '¿Seguro que quieres salir? Tu avance no será guardado'),
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
