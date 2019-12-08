import 'package:equatable/equatable.dart';

abstract class PreguntaDBEvent extends Equatable {
  const PreguntaDBEvent();

  @override
  List<Object> get props => [];
}

class LoadPregunta extends PreguntaDBEvent {
  const LoadPregunta([this.competenciaId, this.noOfQuestions]);

  final String competenciaId;
  final int noOfQuestions;

  @override
  List<Object> get props => [competenciaId, noOfQuestions];

  @override
  String toString() => 'LoadPregunta { CompetenciaId: $competenciaId}';
}