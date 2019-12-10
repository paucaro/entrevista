import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RespuestaRBCEvent extends Equatable {
  const RespuestaRBCEvent();

  @override
  List<Object> get props => [];
}

class LoadRespuesta extends RespuestaRBCEvent {
  const LoadRespuesta({
    @required this.respuesta, @required this.idPregunta});

  final String respuesta;
  final String idPregunta;

  @override
  List<Object> get props => [respuesta, idPregunta];

  @override
  String toString() => 'Cargar Respuesta: {respuesta: $respuesta, idPregunta: $idPregunta}';
}