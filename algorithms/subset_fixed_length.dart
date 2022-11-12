void main() {
  List<int> arr = [1, 2, 3, 4];
  List<List<int>> ans = [];
  final sw = Stopwatch()..start();
  bitmask(arr, ans, 2);
  sw.stop();
  final t = sw.elapsedMicroseconds;
  print('Subsets : ${ans.length} => $ans');
  print('Time Elapsed (micro): $t');
}

bitmask(List<int> arr, List<List<int>> ans, int k) {
  for (int i = 0; i < 1 << arr.length; i++) {
    if (i.toRadixString(2).replaceAll('0', '').length == k) {
      List<int> temp = [];
      for (int j = 0; j < arr.length; j++) {
        if (i & (1 << j) != 0) {
          temp.add(arr[j]);
        }
      }
      ans.add(temp);
    }
  }
}
