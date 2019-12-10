import 'package:bloc/bloc.dart';
import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:entrevista_ff/src/bloc/guias_db_bloc/bloc.dart';
import 'package:entrevista_ff/src/repository/db_repository.dart';
import 'package:meta/meta.dart';

class GuiaDBBLOC extends Bloc<GuiaDBEvent, GuiaDBState> {
  GuiaDBBLOC({@required DataBaseRespository dataBaseRespository})
    : assert(dataBaseRespository != null),
    _dataBaseRespository = dataBaseRespository;

  final DataBaseRespository _dataBaseRespository;

  @override
  GuiaDBState get initialState => GuiaLoading();

  @override
  Stream<GuiaDBState> mapEventToState(
    GuiaDBEvent event,
  ) async* {
    if (event is LoadGuia) {
      yield* _mapLoadGuiaToState(event.preguntaId);
    }
  }

  Stream<GuiaDBState> _mapLoadGuiaToState(String idPregunta) async* {
    yield GuiaLoading();
    try {
      final Map<String, bool> mapPreguntaGuias = 
        await _dataBaseRespository.getGuias(idPregunta);

      final List<String> keys = mapPreguntaGuias.keys.toList();
      final String idGuiaSelected = randomChoice<String>(keys);
      final String guia = await _dataBaseRespository.getGuiaById(idGuiaSelected).first;      

      yield GuiaLoaded(guia);
    } catch (_) {
      yield GuiaNotLoaded();
    }
  }
}