import 'dart:async';

void main() {
  int getNumberOfPairElement(List array, int sum) {
    int count = 0;
    for (int i = 0; i < array.length; i++) {
      for (int j = (i + 1); j < array.length; j++) {
        if (array[i] + array[j] == sum) {
          count++;
        }
      }
    }
    return count;
  }

  // print(getNumberOfPairElement([4, 5, 7, 3, 2, 3, 2, 3, 4, 5], 8));
  // List removeDuplicate(List<int> array) {
  //   List<int> temp = [];
  //   for (var i = 0; i < array.length; i++) {
  //     if (!temp.contains(array[i])) {
  //       temp.add(array[i]);
  //     }
  //   }
  //   return temp;
  // }
}
