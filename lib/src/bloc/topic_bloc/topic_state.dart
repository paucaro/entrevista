import 'package:entrevista_ff/src/models/subtopic.dart';
import 'package:equatable/equatable.dart';

abstract class TopicState extends Equatable {
  const TopicState();

  @override
  List<Object> get props => [];
}

// topic loading
// topic loaded
// topic not loaded
class TopicLoading extends TopicState {
  @override
  String toString() => 'Loading topic';
}

class TopicLoaded extends TopicState {
  const TopicLoaded([this.subTopicList]);

  final List<SubTopicList> subTopicList;

  @override
  List<Object> get props => [subTopicList];

  @override
  String toString() => 'Topic Loaded';
}

class TopicNotLoaded extends TopicState {
  @override
  String toString() => 'Topic Not Loaded';
}