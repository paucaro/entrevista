class BNode {
  int t; // variable to determine order of tree
  int count; // number keys in node
  List<dynamic> key; //array of key values
  List<BNode> child; // array of references
  bool leaf;
  BNode parent;

  /// Initial constructor BNode
  BNode(int t, BNode parent) {
    this.t = t; // assign size
    this.parent = parent; // assign parent
    this.key = List<dynamic>(2 * t - 1); // array of proper size
    this.child = List<BNode>(2 * t); // array of refs proper size
    this.leaf = true; // everynode is leaf at first;
    this.count = 0; // until we add keys later
  }

  /// Return key value at index position
  dynamic getValue(int index) {
    return key[index];
  }

  /// get ith child of node
  BNode getChild(int index) {
    return child[index];
  }
}

class BTree {
  int order; // order of tree
  BNode root; // every tree has at least a root node

  /// Constructor for tree
  BTree(int order) {
    this.order = order;
    this.root = BNode(order, null);
  }

  /// Search for given node where we want to insert a key value
  BNode search(BNode root, dynamic key) {
    int i = 0; // start searching the 0th index of node
    while (i < root.count && key > root.key[i])
      i++; // incrementing in node while key < current value
    if (i <= root.count && key == root.key[i])
      return root; // if key is node, return node
    if (root.leaf)
      return null; //  since checked root if it is leaf, it's over
    else
      return search(root.getChild(i),
          key); //if it's not leave recurse down through ith child
  }

  /// Search key for given node where we want to insert a key value
  dynamic searchKey(BNode root, dynamic key) {
    int i = 0; // start searching the 0th index of node
    while (i < root.count && key > root.key[i])
      i++; // incrementing in node while key < current value
    if (i <= root.count && key == root.key[i])
      return root.key[i]; // if key is node, return key
    if (root.leaf)
      return null; //  since checked root if it is leaf, it's over
    else
      return searchKey(root.getChild(i),
          key); //if it's not leave recurse down through ith child
  }

  /// Split node to insert into if it's full
  void split(BNode x, int i, BNode y) {
    BNode z = BNode(order, null); // extra node to split
    z.leaf = y.leaf; // set boolean to same as y
    z.count = order - 1; //updated size
    for (int j = 0; j < order - 1; j++) {
      z.key[j] = y.key[j + order]; //copy end of y into front of z
    }
    if (!y.leaf) {
      // if not leaf, to reassign child nodes
      for (int k = 0; k < order; k++) {
        z.child[k] = y.child[k + order]; // reassing child of y
      }
    }
    y.count = order - 1; // size of y
    for (int j = x.count; j > i; j--) {
      // push key into x to rearrange child nodes
      x.child[j + 1] = x.child[j]; // shift children of x
    }
    x.child[i + 1] = z; // reassign i+1 child of x
    for (int j = x.count; j > i; j--) {
      x.key[j + 1] = x.key[j]; // shift keys
    }
    x.key[i] = y.key[order - 1]; // push value up into root
    y.key[order - 1] = 0; // erase value where pushed from
    for (int j = 0; j < order - 1; j++) {
      y.key[j + order] = 0; // delete old values
    }

    x.count++; // increase count of keys in x
  }

  /// Insert when node is not full
  void nonfullInsert(BNode x, dynamic key) {
    int i = x.count; // i is number of keys in node x
    if (x.leaf) {
      while (i >= 1 && key < x.key[i - 1]) {
        // find spot to put key
        x.key[i] = x.key[i - 1]; // shift values to make room
        i--;
      }
      x.key[i] = key; //finally assign value to node
      x.count++; // increment count of keys in the node
    } else {
      int j = 0;
      while (j < x.count && key > x.key[j]) {
        // find spot to recurse on correct child
        j++;
      }
      if (x.child[j].count == order * 2 - 1) {
        split(x, j, x.child[j]); // call split node x's ith child
        if (key > x.key[j]) j++;
      }

      nonfullInsert(x.child[j], key); // recurse
    }
  }

  /// Insert in general, it will call insert nonfull if needed
  void insert(BTree t, dynamic key) {
    BNode r = t.root; //find node to be inserted, starting at root node
    if (r.count == 2 * t.order - 1) {
      //if is full
      BNode s = BNode(t.order, null); // new node
      // Initialize node:
      t.root = s;
      s.leaf = false;
      s.count = 0;
      s.child[0] = r;
      split(s, 0, r); //split root
      nonfullInsert(s, key); // call insert method
    } else
      nonfullInsert(r, key); // if it's not full to insert in it
  }

  /// print out a node, or recourses when root node is not leaf
  void printTree(BNode n) {
    for (int i = 0; i < n.count; i++) {
      print(n.getValue(i).toString() + ' '); // prints root node
    }
    if (!n.leaf) {
      // called when root is not leaf
      for (int j = 0; j <= n.count; j++) {
        //recurse to print out tree in preorder fashion going from left most child to right most child
        if (n.getChild(j) != null) {
          print('\n');
          printTree(n.getChild(j));
        }
      }
    }
  }

  /// Print out a node
  void searchPrintNode(BTree T, dynamic x) {
    BNode temp = BNode(order, null);
    temp = search(T.root, x);
    if (temp == null) {
      print('he key does not exist in this tree');
    } else {
      printTree(temp);
    }
  }

  /// Delete a key value from the leaf node it is in. 
  /// first search to traverse through the tree to find the node where the key is in. 
  /// Then iterate through key list until get node, will assign k[i] = k[+1] overwriting 
  /// key to delete and keeping blank spots out as well.
  
  //TODO: Missing implement all cases of deleting
  void deleteKey(BTree t, dynamic key) {
    BNode temp = BNode(order, null); // temp BNode
    temp = search(t.root, key); // call search method on tree for key
    if (temp.leaf && temp.count > order - 1) {
      int i = 0;
      while (key > temp.getValue(i)) i++;
      for (int j = i; j < 2 * order - 2; j++) {
        temp.key[j] = temp.getValue(j + 1);
      }
      temp.count--;
    } else {
      print('This node is either not a leaf or has less than order - 1 keys');
    }
  }
}
