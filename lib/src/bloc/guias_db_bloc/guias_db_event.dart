import 'package:equatable/equatable.dart';

abstract class GuiaDBEvent extends Equatable {
  const GuiaDBEvent();

  @override
  List<Object> get props => [];
}

class LoadGuia extends GuiaDBEvent {
  const LoadGuia([this.preguntaId]);

  final String preguntaId;

  @override
  List<Object> get props => [preguntaId];

  @override
  String toString() => 'LoadGuia';
}