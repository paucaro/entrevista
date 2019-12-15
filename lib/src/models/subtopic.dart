import 'package:cloud_firestore/cloud_firestore.dart';

class SubTopicList{
  const SubTopicList(
    this.title, this.concepto, this.imageBool,
    this.image, this.videoBool, this.video);

  final String title;
  final String concepto;
  final bool imageBool;
  final String image;
  final bool videoBool;
  final String video;

  static SubTopicList fromSnapshot(DocumentSnapshot snap) {
    return SubTopicList(
      snap.data['title'],
      snap.data['concepto'],
      snap.data['imageBool'],
      snap.data['image'],
      snap.data['videoBool'],
      snap.data['video']
    );
  }
}