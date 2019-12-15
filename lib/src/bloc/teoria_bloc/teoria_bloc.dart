import 'package:bloc/bloc.dart';
import 'package:entrevista_ff/src/bloc/teoria_bloc/bloc.dart';
import 'package:entrevista_ff/src/models/topic.dart';
import 'package:entrevista_ff/src/repository/teoria_repository.dart';
import 'package:meta/meta.dart';

class TeoriaBloc extends Bloc<TeoriaEvent, TeoriaState> {
  TeoriaBloc({@required TeoriaRepository teoriaRepository})
    : assert(teoriaRepository != null),
      _teoriaRepository = teoriaRepository;

  final TeoriaRepository _teoriaRepository;

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
      yield TeoriaLoaded(topicos);
    } catch (_) {
      yield TeoriaNotLoaded();
    }
  }
}