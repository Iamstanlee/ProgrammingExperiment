var deadline = new Date('Jun 29, 2019 12:00:00').getTime();
var x = setInterval(function() {
 var now = new Date().getTime();
 var t = deadline - now;
 // var days = Math.floor(t / (1000 * 60 * 60 * 24));
 var hours = Math.floor(
  (t % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)
 );
 var minutes = Math.floor(
  (t % (1000 * 60 * 60)) / (1000 * 60)
 );
 var seconds = Math.floor((t % (1000 * 60)) / 1000);
 document.getElementById('timer').innerHTML =
  hours + 'h ' + minutes + 'm ' + seconds + 's Left';
 if (t < 0) {
  clearInterval(x);
  document.getElementById('timer').innerHTML =
   'EXPERIMENTS ✅';
 }
}, 1000);

// closure
// function multiplier(factor) {
//   return function(number) {
//     return number * factor;
//   };
// }
// var twice = multiplier(2)(5);
// console.log(twice);
// let contained = [];
// function getRange(start, end) {
//   // for (let c = start;c <= end; c++) {
//   // 	c !== start && c !== end && contained.push(c)
//   // }
//   let i = start + 1;
//   while (i != end) {
//     contained.push(i);
//     i++;
//   }
// }
// getRange(10, 15);
// console.log(contained); // 11, 12, 13,8

//     function getMax(arr) {
//     		let max = 0;
//     		for(let i = 0;i <= arr.length;i++) {
//     			if(arr[i] > max) {
//     				max = arr[i]
//     			}

//     		}
//     		return max;
//     }
// console.log(getMax([83,38,2,3,4,5,5]))

//  function anagram(first, second) {
//    let f = [];
//    let s = [];
// for (let i = 0; i < first.length; i++) {
//   for (let j = 0; j < second.length; j++) {
//     if (second[j] > first[i]) {
//       num += second[j];
//     }
//   }
// }

//   for (let i = 0; i < first.length; i++) {
//     for (let j = 0; j < second.length; j++) {
//       s.push(second[j]);
//     }
//     f.push(first[i]);
//   }
//   console.log(s);
// }

// anagram('elloh', 'hello');
function numToList(n) {
 return n
  .toString()
  .split('')
  .map(i => Number(i));
}
function binaryToBaseTen(n) {
 let num = numToList(n);
 let c = 0;
 for (let i = 0; i < num.length; i++) {
  if (num.length == 1) {
   c = num[i];
  } else if (i == num.length - 1) {
  } else if (i != 0) {
   c = c * 2 + num[i + 1];
  } else {
   c = num[i] * 2 + num[i + 1];
  }
 }
 console.log(c);
}
binaryToBaseTen(1000); // 8
