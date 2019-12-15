import 'package:equatable/equatable.dart';

abstract class TopicEvent extends Equatable {
  const TopicEvent();

  @override
  List<Object> get props => [];
}

class LoadTopic extends TopicEvent {
  const LoadTopic(this.idTopicTeoria);

  final String idTopicTeoria;

  @override
  List<Object> get props => [idTopicTeoria];

  @override
  String toString() => 'Topic Loaded with idTopicTeoria: $idTopicTeoria';
}