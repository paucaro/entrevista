import 'package:entrevista_ff/src/repository/algorithm/btree.dart';
import 'package:entrevista_ff/src/util/synonim.dart';

const Map<String, String> synonimGroup = {
  '01': 'abundancia',
  '02': 'escaso',
  '03': 'respetar',
  '04': 'incumplir',
  '05': 'impulsar',
  '06': 'demorar',
  '07': 'rechazar',
  '08': 'acertar',
  '09': 'errar',
  '10': 'acostumbrar',
};

class SynonimWord {
  BTree tree = BTree(3);
  
  List<Synonim> synonims = [
    Synonim('abundancia', '01'),
    Synonim('exceso', '01'),
    Synonim('escaso', '02'),
    Synonim('escasez', '02'),
    Synonim('insuficiencia', '02'),
    Synonim('insuficiente', '02'),
    Synonim('respetar', '03'),
    Synonim('obedecer', '03'),
    Synonim('obedecer', '03'),
    Synonim('obedeci', '03'),
    Synonim('someterse', '03'),
    Synonim('acatar', '03'),
    Synonim('acato', '03'),
    Synonim('imcumplir', '04'),
    Synonim('desobedecer', '04'),
    Synonim('desobedeci', '04'),
    Synonim('resistirse', '04'),
    Synonim('resistir', '04'),
    Synonim('resistio', '04'),
    Synonim('resisti', '04'),
    Synonim('rebele', '04'),
    Synonim('rebelarse', '04'),
    Synonim('rebelar', '04'),
    Synonim('indisciplinado', '04'),
    Synonim('indisciplinada', '04'),
    Synonim('indisciplina', '04'),
    Synonim('impulsar', '05'),
    Synonim('active', '05'),
    Synonim('activar', '05'),
    Synonim('activo', '05'),
    Synonim('acelerar', '05'),
    Synonim('acelero', '05'),
    Synonim('demorar', '06'),
    Synonim('retardar', '06'),
    Synonim('retardamos', '06'),
    Synonim('retrasar', '06'),
    Synonim('retrase', '06'),
    Synonim('retrasamos', '06'),
    Synonim('atrasar', '06'),
    Synonim('atraso', '06'),
    Synonim('atrase', '06'),
    Synonim('aplazar', '06'),
    Synonim('aplaze', '06'),
    Synonim('rezagar', '06'),
    Synonim('rechazar', '07'),
    Synonim('declinar', '07'),
    Synonim('declino', '07'),
    Synonim('renunciar', '07'),
    Synonim('renuncio', '07'),
    Synonim('acertar', '08'),
    Synonim('atinar', '08'),
    Synonim('atine', '08'),
    Synonim('encontrar', '08'),
    Synonim('encontre', '08'),
    Synonim('hallar', '08'),
    Synonim('halle', '08'),
    Synonim('errar', '09'),
    Synonim('equivocarse', '09'),
    Synonim('equivocar', '09'),
    Synonim('equivoque', '09'),
    Synonim('confundirse', '09'),
    Synonim('confuso', '09'),
    Synonim('confundi', '09'),
    Synonim('fallar', '09'),
    Synonim('falle', '09'),
    Synonim('acostumbrar', '10'),
    Synonim('habituado', '10'),
    Synonim('habituada', '10'),
    Synonim('familiarizado', '10'),
    Synonim('familiarizada', '10'),
    Synonim('entrenado', '10'),
    Synonim('entrenada', '10'),
    Synonim('experimentado', '10'),
    Synonim('experimentada', '10'),
  ];

  BTree sinonimos() {
    for (Synonim synonim_word in synonims) {
      tree.insert(tree, synonim_word);
    }
    return tree;
  }

  BTree returnBTreeSynonim() {
    sinonimos();
    return tree;
  }
}
