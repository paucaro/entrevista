import 'package:bloc/bloc.dart';
import 'package:entrevista_ff/src/bloc/preguntas_db_bloc/bloc.dart';
import 'package:entrevista_ff/src/models/pregunta.dart';
import 'package:entrevista_ff/src/repository/db_repository.dart';
import 'package:meta/meta.dart';

class PreguntaDBBloc extends Bloc<PreguntaDBEvent, PreguntaDBState> {
  PreguntaDBBloc({@required DataBaseRespository dataBaseRespository})
    : assert(dataBaseRespository != null),
    _dataBaseRespository = dataBaseRespository;

  final DataBaseRespository _dataBaseRespository;

  @override
  PreguntaDBState get initialState => PreguntaDBLoading();

  @override
  Stream<PreguntaDBState> mapEventToState(
    PreguntaDBEvent event,
  ) async* {
    if(event is LoadPregunta) {
      yield* _mapLoadPreguntaToState(event.competenciaId, event.noOfQuestions);
    }
  }

  Stream<PreguntaDBState> _mapLoadPreguntaToState(
    String competenciaId, int noOfQuestions) async* {
    final List<Pregunta> listPreguntas = [];
    try {
      final Map<String, bool> mapCompetenciaPreguntas =
         await _dataBaseRespository.getPreguntas(competenciaId);

      final List<String> idPreguntas = [];
      mapCompetenciaPreguntas.forEach((k,bool v) => idPreguntas.add(k));
      idPreguntas..shuffle();

      for(int i = 0; i < noOfQuestions; i ++) {
        final Pregunta pregunta = await _dataBaseRespository.getPreguntaById(idPreguntas[i]).first; 
        listPreguntas.add(pregunta);
      }

      yield PreguntaDBLoaded(listPreguntas);
    } catch (_) {
      yield PreguntaDBNotLoaded();
    }
  }
}