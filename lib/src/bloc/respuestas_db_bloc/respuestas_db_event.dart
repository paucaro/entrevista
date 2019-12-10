import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RespuestaDBEvent extends Equatable {
  const RespuestaDBEvent();

  @override
  List<Object> get props => [];
}

class RespuestaChanged extends RespuestaDBEvent {
  const RespuestaChanged({@required this.respuesta});

  final String respuesta;

  @override
  List<Object> get props => [respuesta];

  @override
  String toString() => 'Respuesta changed: {$respuesta}';
}

class Submitted extends RespuestaDBEvent {
  @override
  String toString() => 'Respuesta submitted';
}
