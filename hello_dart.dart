import 'dart:async';

void main() {
  ///
  int getPairElement(List array, int sum) {
    int temp = 0;
    for (int i = 0; i < array.length; i++) {
      for (int j = i; j < array.length - i; j++) {
        if (i != j) {
          if (array[i] + array[j] == sum) {
            temp++;
          }
        }
      }
    }
    return temp;
  }

  print(getPairElement([4, 5, 3, 4, 3, 4, 2], 8));
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
