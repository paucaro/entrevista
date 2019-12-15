import 'package:bloc/bloc.dart';
import 'package:entrevista_ff/src/bloc/topic_bloc/bloc.dart';
import 'package:entrevista_ff/src/models/subtopic.dart';
import 'package:entrevista_ff/src/repository/teoria_repository.dart';
import 'package:meta/meta.dart';

class TopicBloc extends Bloc<TopicEvent, TopicState> {
  TopicBloc({@required TeoriaRepository teoriaRepository})
    : assert(teoriaRepository != null),
      _teoriaRepository = teoriaRepository;

  final TeoriaRepository _teoriaRepository;

  @override
  TopicState get initialState => TopicLoading();

  @override
  Stream<TopicState> mapEventToState(
    TopicEvent event,
  ) async* {
    if (event is LoadTopic) {
      yield* _mapLoadTopicToState(event.idTopicTeoria);
      
    }
  }

  Stream<TopicState> _mapLoadTopicToState(String idTopicTeoria) 
    async* {
      yield TopicLoading();
      try {
        final Map<String, bool> mapSubTopics = 
          await _teoriaRepository.getSubTopic(idTopicTeoria);
        
        final List<String> listSubTopics = mapSubTopics.keys.toList();

        final List<SubTopicList> listTopicBody = [];
        for (var subTopicId in listSubTopics) {
          final SubTopicList subTopicList = 
            await _teoriaRepository.getSubTopicBodyById(subTopicId).first;
          listTopicBody.add(subTopicList);
        }
        yield TopicLoaded(listTopicBody);
      } catch (_) {
        yield TopicNotLoaded();
      }
    }
}