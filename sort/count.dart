count_sort(List<int> arr) {
  int max = arr.reduce((value, element) => element > value ? element : value);
  List<int> countArr = List.filled(max + 1, 0);
  arr.forEach((element) {
    countArr[element]++;
  });
  for (int i = 1; i <= max; i++) {
    countArr[i] += countArr[i - 1];
  }
  List<int> sortedArr = List.filled(arr.length, 0);
  for (int i = arr.length - 1; i >= 0; i--) {
    sortedArr[--countArr[arr[i]]] = arr[i];
  }
  arr.replaceRange(0, arr.length, sortedArr);
}

void main() {
  List<int> arr = [1, 3, 2, 3, 4, 1, 6, 4, 3];
  count_sort(arr);
  print(arr);
}
