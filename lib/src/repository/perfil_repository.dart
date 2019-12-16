import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:entrevista_ff/src/models/topic.dart';
import 'package:entrevista_ff/src/repository/teoria_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PerfilRepository {
  PerfilRepository({FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;
  final userPerfilCollection = Firestore.instance.collection('user-perfil');
  final topicCollection = Firestore.instance.collection('topic');

  Future<Stream<int>> getLevelUser() async {
    final FirebaseUser user = await _firebaseAuth.currentUser();
    return userPerfilCollection.document(user.uid).snapshots().map((snap) {
      return snap.data['level'];
    });
  }

  Future<Stream<bool>> getStateTopicUser(String idTopic) async {
    final FirebaseUser user = await _firebaseAuth.currentUser();
    return userPerfilCollection.document(user.uid).snapshots().map((snap) {
      return snap.data[idTopic];
    });
  }

  Future existUserPerfil() async {
    final FirebaseUser user = await _firebaseAuth.currentUser();
    final snapShot = userPerfilCollection.document(user.uid).get();
    final TeoriaRepository teoriaRepository = TeoriaRepository();
    List<Topic> topics = [];

    snapShot.then((snap) async {
      if (snap.data == null) {
        topics = await teoriaRepository.getTopics().first;

        final Map<String, dynamic> data = <String, dynamic>{'level': 1};

        for (var top in topics) {
          data[top.id] = false;
        }
        userPerfilCollection.document(user.uid).setData(data, merge: true);
      }
    });
  }

  Stream<List<Topic>> getListIdsTopics() {
    return topicCollection.orderBy('order').snapshots().map((snapshot) {
      return snapshot.documents.map((doc) => Topic.fromSnapshot(doc)).toList();
    });
  }

  Future updateLevelUser(String idTopic) async {
    final FirebaseUser user = await _firebaseAuth.currentUser();
    final Stream<bool> stateTopic = await getStateTopicUser(idTopic);
    final bool topic = await stateTopic.first;

    if (!topic) {
      final Stream<int> levelStream = await getLevelUser();
      int level = await levelStream.first;

      level += 1;

      final Map<String, dynamic> map = <String, dynamic>{'level': level, idTopic: true};
      userPerfilCollection.document(user.uid).updateData(map);

    }
  }
}
