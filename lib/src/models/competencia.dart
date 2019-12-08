import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meta/meta.dart';

@immutable
class Competencia {
  const Competencia(this.nombre, this.icon, this.id, this.descripcion, this.iconData, this.cantidad);

  final String nombre;
  final String icon;
  final String id;
  final String descripcion;
  final IconData iconData;
  final int cantidad;

  static Competencia fromSnapshot(DocumentSnapshot snap) {
    return Competencia(
      snap.data['name'],
      snap.data['icon'],
      snap.documentID,
      snap.data['descripcion'],
      getIconForName(snap.data['icon']),
      snap.data['cantidad']
    );
  }

  static IconData getIconForName(String iconName) {
    switch(iconName) {
      case 'bookReader': {
        return FontAwesomeIcons.bookReader;
      }
      break;
      case 'rocket': {
        return FontAwesomeIcons.rocket;
      }
      break;
      case 'solidComments': {
        return FontAwesomeIcons.solidComments;
      }
      break;
      case 'cogs': {
        return FontAwesomeIcons.cogs;
      }
      break;
      case 'solidLightbulb': {
        return FontAwesomeIcons.solidLightbulb;
      }
      break;
      case 'solidFlag': {
        return FontAwesomeIcons.solidFlag;
      }
      break;
      case 'solidCalendarTimes': {
        return FontAwesomeIcons.solidCalendarTimes;
      }
      break;
      case 'hands': {
        return FontAwesomeIcons.hands;
      }
      break; 
      case 'solidQuestionCircle': {
        return FontAwesomeIcons.solidQuestionCircle;
      }
      break;
      case 'solidHandshake': {
        return FontAwesomeIcons.solidHandshake;
      }
      break;
      case 'laptop': {
        return FontAwesomeIcons.laptop;
      }
      break;
      default: {
        return FontAwesomeIcons.puzzlePiece;
      }
    }
  }
}