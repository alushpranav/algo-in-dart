class Node {
  int value;
  Node? next;
  Node({required this.value, this.next});

  @override
  String toString() {
    return (next == null ? '' : next.toString()) +
        '| ' +
        value.toString() +
        ' ';
  }
}

class Stack {
  int _length = 0;
  Node? head;
  Stack(int? val) {
    if (val != null) {
      head = Node(value: val);
      _length++;
    }
  }

  int get length => _length;

  push(int val) {
    final node = Node(value: val);
    _length++;
    if (head == null) {
      head = node;
      return;
    }
    node.next = head;
    head = node;
  }

  int? pop() {
    if (head == null) return null;
    int? temp;
    if (_length == 1) {
      temp = head?.value;
      head = null;
    } else {
      temp = head?.value;
      head = head?.next;
    }
    _length--;
    return temp;
  }

  @override
  String toString() {
    return head == null ? 'Stack Empty!' : head.toString() + ' <=';
  }
}

void main() {
  Stack st = Stack(4);
  st.push(5);
  st.push(6);
  st.push(7);
  st.pop();
  print(st.length);
  print(st.toString());
}
