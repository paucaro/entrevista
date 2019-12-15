import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:entrevista_ff/src/models/subtopic.dart';
import 'package:entrevista_ff/src/models/topic.dart';

class TeoriaRepository {
  final topicCollection = Firestore.instance.collection('topic');
  final subtopicCollection = Firestore.instance.collection('subtopic-body');
  final topicSubtopicCollection =
      Firestore.instance.collection('topic-subtopic');

  Stream<List<Topic>> getTopics() {
    return topicCollection.orderBy('order').snapshots().map((snapshot) {
      return snapshot.documents.map((doc) => Topic.fromSnapshot(doc)).toList();
    });
  }

  Future<Map<String, bool>> getSubTopic(String idTopic) {
    return topicSubtopicCollection.document(idTopic).get().then((snapshot) {
      return snapshot.data.cast<String, bool>();
    });
  }

  Stream<SubTopicList> getSubTopicBodyById(String idSubTopic) {
    return subtopicCollection.document(idSubTopic).snapshots().map((snapshot) {
      return SubTopicList.fromSnapshot(snapshot);
    });
  }
}
