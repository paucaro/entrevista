import 'package:auto_size_text/auto_size_text.dart';
import 'package:entrevista_ff/src/bloc/database_bloc/bloc.dart';
import 'package:entrevista_ff/src/models/competencia.dart';
import 'package:entrevista_ff/src/ui/aditionals/error.dart';
import 'package:entrevista_ff/src/ui/aditionals/loading.dart';
import 'package:entrevista_ff/src/ui/practica/questions-quiz/quiz_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class PracticaScreen extends StatefulWidget {
  @override
  _PracticaScreenState createState() => _PracticaScreenState();
}

class _PracticaScreenState extends State<PracticaScreen> {
  List<Competencia> listCompetencias = <Competencia>[];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatabaseBloc, DatabaseState>(
      builder: (context, state) {
        if (state is DatabaseLoaded) {
          listCompetencias = state.competencias;

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
                        'Selecciona una competencia y empieza a practicar',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(16.0),
                    sliver: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.2,
                              crossAxisSpacing: 20.0,
                              mainAxisSpacing: 20.0),
                      delegate: SliverChildBuilderDelegate(
                          _buildCompetenciaItem,
                          childCount: listCompetencias.length),
                    ),
                  )
                ],
              )
            ],
          );
        }
        if (state is DatabaseLoading) {
          //return Center(child: const CircularProgressIndicator());
          return Loading();
        }
        if (state is DatabaseNotLoaded) {
          return const ErrorPage(
            message:
                'No se puede cargar las competencias, \n Verifique su conexión a Internet.',
          );
        }
        return const ErrorPage();
      },
    );
  }

  Widget _buildCompetenciaItem(BuildContext context, int index) {
    final Competencia competencia = listCompetencias[index];
    return MaterialButton(
      elevation: 1.0,
      highlightElevation: 1.0,
      onPressed: () => _competenciaPressed(context, competencia),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: Colors.grey.shade800,
      textColor: Colors.white70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (competencia.iconData != null) Icon(competencia.iconData),
          if (competencia.iconData != null) const SizedBox(height: 5.0),
          AutoSizeText(
            competencia.nombre,
            minFontSize: 10.0,
            textAlign: TextAlign.center,
            maxLines: 3,
            wrapWords: false,
          )
        ],
      ),
    );
  }

  dynamic _competenciaPressed(BuildContext context, Competencia competencia) {
    showModalBottomSheet<Widget>(
        context: context,
        builder: (sheetContext) => BottomSheet(
              builder: (_) => QuizOptionsDialog(
                competencia: competencia,
              ),
              onClosing: () {},
            ));
  }
}
