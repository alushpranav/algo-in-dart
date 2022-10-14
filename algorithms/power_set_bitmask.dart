void main() {
  List<int> arr = [1, 2, 3, 4];
  List<List<int>> ans = [];
  final sw = Stopwatch()..start();
  bitmask(arr, ans);
  sw.stop();
  final t = sw.elapsedMicroseconds;
  print('Subsets : ${ans.length} => $ans');
  print('Time Elapsed (micro): $t');
}

bitmask(List<int> arr, List<List<int>> ans) {
  for (int i = 0; i < 1 << arr.length; i++) {
    List<int> temp = [];
    for (int j = 0; j < arr.length; j++) {
      if (i & (1 << j) > 0) {
        temp.add(arr[j]);
      }
    }
    ans.add(temp);
  }
}
