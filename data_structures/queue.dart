class Node {
  int value;
  Node? next;
  Node({required this.value, this.next});

  @override
  String toString() {
    return (next == null ? '' : next.toString()) + ' | ' + value.toString();
  }
}

class Queue {
  int _length = 0;
  Node? head;
  Node? tail;

  Queue(int? val) {
    if (val != null) {
      head = tail = Node(value: val);
      _length++;
    }
  }

  enqueue(int val) {
    Node node = Node(value: val);
    if (tail == null)
      head = tail = node;
    else {
      tail?.next = node;
      tail = node;
    }
    _length++;
  }

  int? dequeue() {
    if (head == null) return null;
    int? temp;
    temp = head?.value;
    if (_length == 1)
      head = tail = null;
    else
      head = head?.next;
    _length--;
    return temp;
  }

  @override
  String toString() {
    return head == null ? 'Empty Queue!' : '=> ' + head.toString() + ' |  =>';
  }
}

void main() {
  Queue q = Queue(3);
  q.enqueue(4);
  q.enqueue(5);
  q.enqueue(6);
  print(q.dequeue());
  print(q.toString());
}
