List<int> merge(List<int> ar1, List<int> ar2) {
  List<int> merged = [];
  int i = 0, j = 0;
  while (i < ar1.length && j < ar2.length) {
    if (ar2[j] < ar1[i]) {
      merged.add(ar2[j]);
      j++;
    } else {
      merged.add(ar1[i]);
      i++;
    }
  }

  if (i < ar1.length) {
    merged.addAll(ar1.getRange(i, ar1.length));
  } else if (j < ar2.length) {
    merged.addAll(ar2.getRange(j, ar2.length));
  }

  return merged;
}

merge_sort(List<int> arr) {
  if (arr.length == 1) return arr;
  int mid = (arr.length / 2).floor();
  List<int> left = arr.sublist(0, mid);
  List<int> right = arr.sublist(mid);
  return merge(merge_sort(left), merge_sort(right));
}

void main() {
  List<int> arr = [3, 2, 5, 4, 6, 1];
  print(merge_sort(arr));
}
