import 'package:bloc/bloc.dart';
import 'package:entrevista_ff/src/bloc/respuesta_rbc_bloc/bloc.dart';
import 'package:entrevista_ff/src/repository/db_repository.dart';
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
      final String idRespuesta =
          await _dataBaseRespository.addNewRespuesta(respuesta);
      final Map<String, bool> mapi =
          await _dataBaseRespository.getRespuestas(idPregunta);
      mapi[idRespuesta] = true;

      await _dataBaseRespository.addNewRespuestaToPregunta(idPregunta, mapi);
      String otherAnswer;
      yield RespuestaRBCDone(otherAnswer);
    } catch (_) {
      yield RespuestaRBCError();
    }
  }
}
