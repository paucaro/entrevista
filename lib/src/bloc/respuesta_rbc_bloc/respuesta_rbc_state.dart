import 'package:equatable/equatable.dart';

abstract class RespuestaRBCState extends Equatable {
  const RespuestaRBCState();

  @override
  List<Object> get props => [];
}

// respuestaRBC loading
// respuestaRBC done
// respuestaRBC error
class RespuestaRBCLoading extends RespuestaRBCState {
  @override
  String toString() => 'Loading respuestas';
}

class RespuestaRBCDone extends RespuestaRBCState {
  const RespuestaRBCDone([this.respuestaOther]);

  final String respuestaOther;

  @override
  List<Object> get props => [respuestaOther];

  @override
  String toString() => 'Respuesta done {respuestaOther: $respuestaOther}';
}

class RespuestaRBCError extends RespuestaRBCState {
  @override
  String toString() => 'Respuesta RBC error';
}