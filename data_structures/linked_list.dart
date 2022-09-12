class Node {
  Node({required this.value, this.next});
  int value;
  Node? next;

  @override
  String toString() {
    if (next == null) return '$value';
    return '$value -> ${next.toString()}';
  }
}

class LinkedList {
  Node? head;
  Node? tail;
  int _length = 0;
  int get length => _length;
  bool get isEmpty => head == null;

  void unshift(int value) {
    head = Node(value: value, next: head);
    tail ??= head;
    _length++;
  }

  void shift() {
    if (isEmpty) return;
    _length--;
    if (_length == 1) {
      head = tail = null;
      return;
    }
    head = head?.next;
  }

  void push(int value) {
    if (isEmpty) {
      unshift(value);
      return;
    }
    tail!.next = Node(value: value);
    tail = tail!.next;
    _length++;
  }

  void pop() {
    if (isEmpty) return;
    if (_length == 1) {
      head = tail = null;
      return;
    }
    Node? prevNode = head;
    Node? currNode = head;
    while (currNode?.next != null) {
      prevNode = currNode;
      currNode = currNode?.next;
    }
    tail = prevNode;
    tail?.next = null;
    _length--;
  }

  Node? nodeAt(int index) {
    Node? currentNode = head;
    var currentIndex = 0;
    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex += 1;
    }
    return currentNode;
  }

  @override
  String toString() {
    if (isEmpty) return 'Empty list';
    return head.toString();
  }
}

void main() {
  LinkedList ll = LinkedList();
  ll.push(4);
  ll.pop();
  ll.unshift(5);
  print(ll.toString());
}
