import 'package:equatable/equatable.dart';

abstract class DatabaseEvent extends Equatable {
  const DatabaseEvent();

  @override
  List<Object> get props => [];
}

class LoadDatabase extends DatabaseEvent {}