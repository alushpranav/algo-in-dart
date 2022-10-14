void main() {
  List<int> arr = [1, 2, 3, 4], output = [];
  List<List<int>> ans = [];
  final sw = Stopwatch()..start();
  recursion(arr, ans, output, 0);
  sw.stop();
  final t = sw.elapsedMicroseconds;
  print('Subsets : ${ans.length} => $ans');
  print('Time Elapsed (micro): $t');
}

recursion(List<int> arr, List<List<int>> ans, List<int> output, int indx) {
  if (indx >= arr.length) {
    ans.add(output);
    return;
  }
  recursion(arr, ans, output.toList(), indx + 1);
  output.add(arr[indx]);
  recursion(arr, ans, output, indx + 1);
}
