class Node<T> {
  Node({required this.value, this.next});
  T value;
  Node<T>? next;

  @override
  String toString() {
    if (next == null) return '$value';
    return '$value -> ${next.toString()}';
  }
}

class LinkedList<E> {
  Node<E>? head;
  Node<E>? tail;
  int _length = 0;
  int get length => _length;
  bool get isEmpty => head == null;

  void unshift(E value) {
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

  void push(E value) {
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
    var prevNode = head;
    var currNode = head;
    while (currNode?.next != null) {
      prevNode = currNode;
      currNode = currNode?.next;
    }
    tail = prevNode;
    tail?.next = null;
    _length--;
  }

  Node<E>? nodeAt(int index) {
    var currentNode = head;
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
  print(ll.toString());
  ll.push('a');
  ll.push('b');
  print(ll.toString());
  ll.unshift('x');
  print(ll.toString());
  ll.shift();
  ll.pop();
  print(ll.toString());
  ll.push('t');
  ll.unshift('s');
  print(ll.toString());
  print(ll.length);
}
