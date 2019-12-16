import 'package:equatable/equatable.dart';

abstract class UpdateLevelEvent extends Equatable {
  const UpdateLevelEvent();

  @override
  List<Object> get props => [];
}

class UpdateLevel extends UpdateLevelEvent {
  const UpdateLevel(this.idTopic);

  final String idTopic;

  @override
  List<Object> get props => [idTopic];
  
  @override
  String toString() => 'Update level with level';
}