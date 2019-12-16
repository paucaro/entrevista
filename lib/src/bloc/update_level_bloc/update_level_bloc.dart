import 'package:bloc/bloc.dart';
import 'package:entrevista_ff/src/bloc/update_level_bloc/bloc.dart';
import 'package:entrevista_ff/src/repository/perfil_repository.dart';
import 'package:meta/meta.dart';

class UpdateLevelBloc extends Bloc<UpdateLevelEvent, UpdateLevelState> {
  UpdateLevelBloc({@required PerfilRepository perfilRepository})
    : assert(perfilRepository != null),
    _perfilRepository = perfilRepository;

  final PerfilRepository _perfilRepository;
  
  @override
  UpdateLevelState get initialState => LevelUpdating();

  @override
  Stream<UpdateLevelState> mapEventToState(
    UpdateLevelEvent event,
  ) async* {
    if (event is UpdateLevel) {
      yield* _mapUpdateLevelToState(event.idTopic);
    }
  }

  Stream<UpdateLevelState> _mapUpdateLevelToState( String idTopic) async* {
    yield LevelUpdating();
    try {
      _perfilRepository.updateLevelUser(idTopic);
      yield LevelUpdated();
    } catch (_) {
      yield LevelNotUpdated();
    }
  }
}