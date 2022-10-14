void main() {
  List<int> arr = [1, 2, 3, 4];
  List<List<int>> ans = [];
  final sw = Stopwatch()..start();
  simple(arr, ans);
  sw.stop();
  final t = sw.elapsedMicroseconds;
  print('Subsets : ${ans.length} => $ans');
  print('Time Elapsed (micro): $t');
}

simple(List<int> arr, List<List<int>> ans) {
  ans.add([]);
  arr.forEach((element) {
    ans.toList().forEach((sublist) => ans.add(sublist + [element]));
  });
}
