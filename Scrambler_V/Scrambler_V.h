#pragma once

#include <iostream>
#include <vector>
#include <string>
#include <cmath>
#include <cstdlib>
#include <ctime>

using namespace std;

class Scrambler {
private:
	vector<string> moves{ "U", "D", "F", "B", "R", "L" }, direction{ "", "'", "2" }, output;
public:
	void generator_3x3();
	void print();
	void debug();
};

void Scrambler::generator_3x3() {
	int rm = rand() % 6, rd = 0, curr = 0, prev = 0, prev_prev = 0;
	for (int i=0; i<=19; ++i) {
		if (i!=0) { // the first value does not cause any error within the criterias
			do {
				rm = rand() % 6; // random number from [0, 6)
				curr = rm;
			} while ((prev==curr) || (prev_prev==curr && (abs(prev_prev-prev)==1) && (prev_prev+prev==4*(rm/2)+1)));
			//    <-first criteria->   <------------------------------checks second criteria---------------------------------------->
			if (i>=2)
				prev_prev = prev; // increments the third value
			prev = rm; // increments the second value
		}
		else {
			prev = rm; // initializes the second value
			prev_prev = rm; // initializes the third value
		}
		rd = rand() % 3;
		output.push_back(moves.at(rm) + direction.at(rd)); // string concatenation of moves and direction and inserts it to a vector
	}
}

void Scrambler::print() {
	for (string T : output)
		cout << T << " ";
	//debug();
	output.clear();
}

void Scrambler::debug() {
	cout << endl << endl;
	for (int i=0; i<=17; ++i) {
		if ((output[i][0] == output[i + 1][0]) || // checks for the first criteria
		   (output[i][0] == 'U' && output[i + 1][0] == 'D' && output[i + 2][0] == 'U') || // checks
		   (output[i][0] == 'D' && output[i + 1][0] == 'U' && output[i + 2][0] == 'D') || // for
		   (output[i][0] == 'F' && output[i + 1][0] == 'B' && output[i + 2][0] == 'F') || // the
	   	   (output[i][0] == 'B' && output[i + 1][0] == 'F' && output[i + 2][0] == 'B') || // second
		   (output[i][0] == 'R' && output[i + 1][0] == 'L' && output[i + 2][0] == 'R') || // criteria
		   (output[i][0] == 'L' && output[i + 1][0] == 'R' && output[i + 2][0] == 'L'))
			cout << "\033[91m" << "FAILED" << "\033[0m" << "  " << output[i] << "  " << output[i + 1] << "  " << output[i+2] << endl;
		else
			cout << "\033[32m" << "PASSED" << "\033[0m" << endl;
	}
}
