class Node {
  int key;
  Node? left;
  Node? right;

  Node({required this.key, this.left, this.right});
}

class BST {
  Node? root;
  BST({this.root});

  insert(int key) {
    if (root == null) {
      root = Node(key: key);
      return;
    }
    Node temp = root!;
    while (true) {
      if (key == temp.key) return;
      if (key < temp.key) {
        if (temp.left == null) {
          temp.left = Node(key: key);
          return;
        }
        temp = temp.left!;
      } else {
        if (temp.right == null) {
          temp.right = Node(key: key);
          return;
        }
        temp = temp.right!;
      }
    }
  }

  List<int> bfs() {
    List<int> ans = [];
    if (root != null) {
      Node node = root!;
      List<Node> q = [];
      q.add(node);
      while (q.length > 0) {
        final node = q.removeAt(0);
        ans.add(node.key);
        if (node.left != null) q.add(node.left!);
        if (node.right != null) q.add(node.right!);
      }
    }
    return ans;
  }

  inOrder() {
    List<int> ans = [];
    traverse(Node node) {
      if (node.left != null) traverse(node.left!);
      ans.add(node.key);
      if (node.right != null) traverse(node.right!);
    }

    if (root != null) traverse(root!);
    return ans;
  }

  preOrder() {
    List<int> ans = [];
    traverse(Node node) {
      ans.add(node.key);
      if (node.left != null) traverse(node.left!);
      if (node.right != null) traverse(node.right!);
    }

    if (root != null) traverse(root!);
    return ans;
  }

  postOrder() {
    List<int> ans = [];
    traverse(Node node) {
      if (node.left != null) traverse(node.left!);
      if (node.right != null) traverse(node.right!);
      ans.add(node.key);
    }

    if (root != null) traverse(root!);
    return ans;
  }

  iterativeInorder() {
    List<int> ans = [];
    if (root != null) {
      Node? curr = root!;
      final stk = <Node>[];
      while (stk.length > 0 || curr != null) {
        while (curr != null) {
          stk.add(curr);
          curr = curr.left;
        }
        curr = stk.removeLast();
        ans.add(curr.key);
        curr = curr.right;
      }
    }
    return ans;
  }

  iterativePreorder() {
    List<int> ans = [];
    if (root != null) {
      final nodeStack = <Node>[];
      nodeStack.add(root!);
      while (nodeStack.length > 0) {
        var mynode = nodeStack[nodeStack.length - 1];
        ans.add(mynode.key);
        nodeStack.removeLast();
        if (mynode.right != null) nodeStack.add(mynode.right!);
        if (mynode.left != null) nodeStack.add(mynode.left!);
      }
    }
    return ans;
  }

  iterativePostorder() {
    List<int> ans = [];
    if (root != null) {
      List<Node> s1 = [], s2 = [];
      s1.add(root!);
      while (s1.length > 0) {
        var temp = s1.removeLast();
        s2.add(temp);
        if (temp.left != null) s1.add(temp.left!);
        if (temp.right != null) s1.add(temp.right!);
      }
      while (s2.length > 0) {
        var temp = s2.removeLast();
        ans.add(temp.key);
      }
    }
    return ans;
  }
}

void main() {
  List<int> a = [4, 2, 6, 1, 3, 5, 7];
  final bst = BST();
  a.forEach((e) => bst.insert(e));
  print(bst.bfs());
  print(bst.preOrder());
  print(bst.inOrder());
  print(bst.postOrder());
  print(bst.iterativePreorder());
  print(bst.iterativeInorder());
  print(bst.iterativePostorder());
}
