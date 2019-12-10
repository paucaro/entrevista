import 'package:bloc/bloc.dart';
import 'package:entrevista_ff/src/bloc/respuestas_db_bloc/bloc.dart';
import 'package:entrevista_ff/src/repository/validators.dart';
import 'package:rxdart/rxdart.dart';

class RespuestasBDBloc extends Bloc<RespuestaDBEvent, RespuestasDBState> {
  RespuestasBDBloc();

  @override
  RespuestasDBState get initialState => RespuestasDBState.empty();

  @override
  Stream<RespuestasDBState> transformEvents(Stream<RespuestaDBEvent> events,
      Stream<RespuestasDBState> Function(RespuestaDBEvent event) next) {
    final observableStream = events as Observable<RespuestaDBEvent>;
    final nonDebounceStream = observableStream.where((event) {
      return event is! RespuestaChanged;
    });
    final debounceStream = observableStream.where((event) {
      return event is RespuestaChanged;
    }).debounceTime(Duration(milliseconds: 300));
    return super
        .transformEvents(nonDebounceStream.mergeWith([debounceStream]), next);
  }

  @override
  Stream<RespuestasDBState> mapEventToState(
    RespuestaDBEvent event,
  ) async* {
    if (event is RespuestaChanged) {
      yield* _mapRespuestaChangedToState(event.respuesta);
    } else if (event is Submitted) {
      yield* _mapSubmittedToState();
    }
  }

  Stream<RespuestasDBState> _mapRespuestaChangedToState(String respuesta) async* {
    yield state.update(
      isRespuestaValid: Validators.isValidRespuesta(respuesta)
    );
  }

  Stream<RespuestasDBState> _mapSubmittedToState() async*{
    yield RespuestasDBState.loading();
  }
}


