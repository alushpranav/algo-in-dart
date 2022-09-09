void swap(List<int> arr, int i, int j) {
  int temp = arr[i];
  arr[i] = arr[j];
  arr[j] = temp;
}

int pivot(List<int> arr, pivot, right) {
  right ??= arr.length - 1;
  pivot ??= 0;
  int swapIndex = pivot;
  for (int i = pivot + 1; i <= right; i++) {
    if (arr[i] < arr[pivot]) {
      swapIndex++;
      swap(arr, swapIndex, i);
    }
  }
  swap(arr, pivot, swapIndex);

  return swapIndex;
}

quick_sort(List<int> arr, [left = 0, right]) {
  right ??= arr.length - 1;
  if (left >= right) return;
  int pivotIndex = pivot(arr, left, right);
  quick_sort(arr, left, pivotIndex - 1);
  quick_sort(arr, pivotIndex + 1, right);
}

void main() {
  List<int> arr = [4, 6, 1, 7, 3, 2, 3];
  quick_sort(arr);
  print(arr);
}
