
#include <iostream> //required for io functions(cout,cin,...)
#include <string> // a standard lib for string manipulations
using namespace std;  

class Gradebook { //defines a class gradebook
public:
	Gradebook(string name){ // class constructor function, called implicitly on instantiation of the class
		setCourseName(name);
	}
	void setCourseName(string name) { // setter
		courseName = name;
	}
	string getCourseName() { //  getter
		return courseName;
	}

	void displayCourse() { // class or member function 
		cout << getCourseName() << endl;
	}
private: // data members declared here are only accessible by the class's member func
	string courseName;   // class attribute  || data member of the class
};


int fizzBuzz(int n){
	for(int c = 0;c <= n;c ++) {
		if(c % 15 == 0){
				cout << "FizzBuzz" << endl;
			}
			else if(c % 3 == 0) {
				cout << "Fizz" << endl;
			}
			else if(c % 5 == 0) {
				cout << "Buzz" << endl;
			}
			else {
				cout << c << endl;
			}
    }

}
	

int main(){
	// Gradebook myGradebook("computer engr 202"); // create a GradeBook object instance named myGradebook
	// myGradebook.displayCourse();
	// int n  = 100;
	// 	for(int c = 0;c <= n;c ++) {
	// 	if(c % 15 == 0){
	// 			cout << "FizzBuzz" << endl;
	// 		}
	// 		else if(c % 3 == 0) {
	// 			cout << "Fizz" << endl;
	// 		}
	// 		else if(c % 5 == 0) {
	// 			cout << "Buzz" << endl;
	// 		}
	// 		else {
	// 			cout << c << endl;
	// 		}
 //    } 
	fizzBuzz(100); // 101
	// fizzBuzz(100); //100
	return 0;
}




//prime algo using the fact that prime numbers have only two factors
// int isPrime(int n) {
	// int count = 0;
// 	for (int i = 1; i <= n; i++) {
// 		 if (n % i == 0)
// 			count++;
// 	}
// 	return count;
// }

// is palindrome func 
// bool palindrome(string word){
// 	string rw;
// 	for(int i = word.length();i > 0;i--){
// 		rw += word.at(i - 1); // index starts at (length - 1)
// 	}
// 	if(rw == word){
// 		return true;
// 	}
// 	else {
// 		return false;
// 	}
// }

// factorial func
// int factorial(int n){
	// 	int f = 1;
	// 	if(n == 0){
	// 		f = 1;
	// 	}
	// 	for(int i = n;i > 0;i --){
	// 		f *= i;
	// 	}
	// 	return f;
	// }
/*
sizeof(variable) method returns the size in byte of a variable on the disc
int takes 4bytes 




*/
