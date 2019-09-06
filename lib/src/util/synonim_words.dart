import 'package:entrevista_ff/src/repository/algorithm/btree.dart';
import 'package:entrevista_ff/src/util/synonim.dart';

const Map synonimGroup = {
  '01': 'trabajo',
  '02': 'situacion',
};

class SynonimWord {
  BTree tree = BTree(3);
  
  List<Synonim> synonims = [
    Synonim('trabajo',      '01'),
    Synonim('trabajar',     '01'),
    Synonim('laborar',      '01'),
    Synonim('ocupacion',    '01'),
    Synonim('labor',        '01'),
    Synonim('situacion',    '02'),
    Synonim('etapa',        '02'),
    Synonim('estado',       '02'),
  ];

  BTree sinonimos() {
    for (Synonim synonim_word in synonims) {
      tree.insert(tree, synonim_word);
    }
    return tree;
  }

  BTree returnBTreeSynonim() {
    this.sinonimos();
    return this.tree;
  }
}
