import 'package:equatable/equatable.dart';

abstract class UpdateLevelState extends Equatable {
  const UpdateLevelState();

  @override
  List<Object> get props => [];
}

// level updating
// level updated
// level not updated
class LevelUpdating extends UpdateLevelState {
  @override
  String toString() => 'Level updating';
}

class LevelUpdated extends UpdateLevelState {
  @override
  String toString() => 'Level updated';
}

class LevelNotUpdated extends UpdateLevelState {
  @override
  String toString() => 'Level Not updated';
}