sort(List<int> arr) {
  for (int i = 1; i < arr.length; i++) {
    int temp = arr[i];
    int j = i - 1;
    while (j >= 0 && temp < arr[j]) {
      arr[j + 1] = arr[j];
      arr[j] = temp;
      j--;
    }
  }
}

void main() {
  List<int> arr = [3, 2, 5, 4, 6, 1];
  sort(arr);
  print(arr);
}
