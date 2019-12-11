import 'package:bloc/bloc.dart';
import 'package:entrevista_ff/src/bloc/teoria_bloc/bloc.dart';

class TeoriaBloc extends Bloc<TeoriaEvent, TeoriaState> {
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
      
      yield TeoriaLoaded();
    } catch (_) {
      yield TeoriaNotLoaded();
    }
  }
}