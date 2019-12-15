import 'package:cloud_firestore/cloud_firestore.dart';

class Topic {
  const Topic(this.name, this.order,this.id);

  final String name;
  final int order;
  final String id;

  static Topic fromSnapshot(DocumentSnapshot snap) {
    return Topic(
      snap.data['name'],
      snap.data['order'],
      snap.documentID
    );
  }
}