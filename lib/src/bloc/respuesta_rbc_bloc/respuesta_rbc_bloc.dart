import 'package:bloc/bloc.dart';
import 'package:entrevista_ff/src/bloc/respuesta_rbc_bloc/bloc.dart';
import 'package:entrevista_ff/src/repository/db_repository.dart';
import 'package:entrevista_ff/src/repository/textmining/mining_text.dart';
import 'package:meta/meta.dart';

class RespuestaRBCBloc extends Bloc<RespuestaRBCEvent, RespuestaRBCState> {
  RespuestaRBCBloc({@required DataBaseRespository dataBaseRespository})
      : assert(dataBaseRespository != null),
        _dataBaseRespository = dataBaseRespository;

  final DataBaseRespository _dataBaseRespository;

  @override
  RespuestaRBCState get initialState => RespuestaRBCLoading();

  @override
  Stream<RespuestaRBCState> mapEventToState(
    RespuestaRBCEvent event,
  ) async* {
    if (event is LoadRespuesta) {
      yield* _mapLoadRespuestaToState(event.idPregunta, event.respuesta);
    }
  }

  Stream<RespuestaRBCState> _mapLoadRespuestaToState(
      String idPregunta, String respuesta) async* {
    yield RespuestaRBCLoading();
    try {
      // Get map of answers - ids answers
      final Map<String, bool> mapi =
          await _dataBaseRespository.getRespuestas(idPregunta); 
      final List<String> idRespuestas = mapi.keys.toList(); // Get list of answers

      final List<String> respuestas = [];
      for (var idRespuesta in idRespuestas) {
        final String descripcionRespuesta = 
          await _dataBaseRespository.getRespuestaById(idRespuesta).first;
        respuestas.add(descripcionRespuesta);
      }

      

      // TextMining of answer and list of answers
      final String otherAnswer = MiningText(respuesta, respuestas).miningText();

      final String idRespuesta =
          await _dataBaseRespository.addNewRespuesta(respuesta); // Add answer and get id
      
       mapi[idRespuesta] = true; // Adding new answer

      // Add to collection preguntas_respuestas
      await _dataBaseRespository.addNewRespuestaToPregunta(idPregunta, mapi);

      yield RespuestaRBCDone(otherAnswer);
    } catch (_) {
      yield RespuestaRBCError();
    }
  }
}
