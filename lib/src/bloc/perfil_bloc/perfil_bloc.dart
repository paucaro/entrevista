import 'package:bloc/bloc.dart';
import 'package:entrevista_ff/src/bloc/perfil_bloc/bloc.dart';
import 'package:entrevista_ff/src/repository/perfil_repository.dart';
import 'package:meta/meta.dart';

class PerfilBloc extends Bloc<PerfilEvent, PerfilState> {
  PerfilBloc({@required PerfilRepository perfilRepository})
    : assert(perfilRepository != null),
    _perfilRepository = perfilRepository;

  final PerfilRepository _perfilRepository;
  
  @override
  PerfilState get initialState => PerfilLoading();

  @override
  Stream<PerfilState> mapEventToState(
    PerfilEvent event,
  ) async* {
    if (event is LoadPerfil) {
      yield* _mapLoadPerfilToState();
    }
  }

  Stream<PerfilState> _mapLoadPerfilToState() async*{
    yield PerfilLoading();
    try {
      await _perfilRepository.existUserPerfil();
      final Stream<int> userLevel = await _perfilRepository.getLevelUser();
      final int level = await userLevel.first;
      yield PerfilLoaded(level);
    } catch (_) {
      yield PerfilNotLoaded();
    }
  }
}