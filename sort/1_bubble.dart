void bubble_sort(List<int> arr) {
  for (int i = arr.length; i > 0; i--) {
    for (int j = 1; j < i; j++) {
      if (arr[j - 1] > arr[j]) {
        int temp = arr[j];
        arr[j] = arr[j - 1];
        arr[j - 1] = temp;
      }
    }
  }
}

void main() {
  List<int> arr = [3, 2, 5, 4, 6, 1];
  bubble_sort(arr);
  print(arr);
}
