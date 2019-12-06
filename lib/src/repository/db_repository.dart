import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:entrevista_ff/src/models/competencia.dart';

class DataBaseRespository {
  final competenciaCollection = Firestore.instance.collection('competencias');

  Stream<List<Competencia>> competencias() {
     return competenciaCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Competencia.fromSnapshot(doc))
          .toList();
    });
  }


}

/*
 IconData getIconForName(String iconName) {
      switch(iconName) {
        case 'facebook': {
        return FontAwesomeIcons.facebook;
        }
        break;

        case 'twitter': {
          return FontAwesomeIcons.twitter;
        }
        break;

        default: {
          return FontAwesomeIcons.home;
        }
      }
    }

Build Function

@override
Widget build(BuildContext context) {
  return Icon(getIconForName(icon), color: HexColor(color));
}
 */