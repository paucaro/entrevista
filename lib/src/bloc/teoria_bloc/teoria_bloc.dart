import 'package:bloc/bloc.dart';
import 'package:entrevista_ff/src/bloc/teoria_bloc/bloc.dart';
import 'package:entrevista_ff/src/models/topic.dart';
import 'package:entrevista_ff/src/repository/perfil_repository.dart';
import 'package:entrevista_ff/src/repository/teoria_repository.dart';
import 'package:meta/meta.dart';

class TeoriaBloc extends Bloc<TeoriaEvent, TeoriaState> {
  TeoriaBloc({@required TeoriaRepository teoriaRepository, 
  @required PerfilRepository perfilRepository})
    : assert(teoriaRepository != null && perfilRepository!= null),
      _teoriaRepository = teoriaRepository, _perfilRepository=perfilRepository;

  final TeoriaRepository _teoriaRepository;
  final PerfilRepository _perfilRepository;

  @override
  TeoriaState get initialState => TeoriaLoading();

  @override
  Stream<TeoriaState> mapEventToState(
    TeoriaEvent event,
  ) async* {
    if (event is LoadTeoria) {
      yield* _mapLoadTeoriaToState();
    }
  }

  Stream<TeoriaState> _mapLoadTeoriaToState() async* {
    yield TeoriaLoading();
    try {
      final List<Topic> topicos = await _teoriaRepository.getTopics().first;
      final Map<String, bool> progressTopicUser = {};

      for (var top in topicos) {
        final Stream<bool> state = await _perfilRepository.getStateTopicUser(top.id);
        progressTopicUser[top.id] = await state.first;
      }
      
      yield TeoriaLoaded(topicos, progressTopicUser);
    } catch (_) {
      yield TeoriaNotLoaded();
    }
  }
}