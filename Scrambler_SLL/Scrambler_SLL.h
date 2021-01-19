#include <iostream>
#include <string>
#include <cmath>
#include <cstdlib>
#include <ctime>
#include <iterator>
#include <list>

using namespace std;

class Scrambler {
private:
	list<string> scramble;
	string moves[6] = { "U", "D", "F", "B", "R", "L" }, direction[3] = { "", "'", "2" };
	string culprit = "UDDURLLRBFFB", innocent;
public:
	void generator_3x3();
	void print();
	void debug();
};

void Scrambler::generator_3x3() {
	int rm = rand() % 6, rd = rand() % 3;
	scramble.insert(scramble.end(), (moves[rm] + direction[rd]));
	list<string>::iterator dec = scramble.begin(), before = scramble.begin();

	for (int i = 0; i <= 18; ++i) {
		do {
			rm = rand() % 6;
			innocent = "";
			innocent += (*dec)[0];
			innocent += moves[rm][0];
			if (scramble.size() >= 2)
				before = prev(dec);
		} while (((moves[rm][0] == (*dec)[0])) || (((culprit.find(innocent) != string::npos) && (*before)[0] == moves[rm][0])));

		rd = rand() % 3;
		scramble.insert(scramble.end(), (moves[rm] + direction[rd]));
		dec++;
	}
}

void Scrambler::print() {
	for (list<string>::iterator it = scramble.begin(); it != scramble.end(); ++it)
		cout << *it << "  ";
	//debug();
	scramble.clear();
}

void Scrambler::debug() {
	cout << endl << endl;
	string output[20] = {};
	int i = 0;
	for (list<string>::iterator z = scramble.begin(); z != scramble.end(); ++z) {
		output[i] = (*z)[0];
		i++;
	}
	
	// cheeky copy from Scrambler_V debug() function

	for (int i = 0; i <= 17; ++i) {
		if ((output[i][0] == output[i + 1][0]) || // checks for the first criteria
			(output[i][0] == 'U' && output[i + 1][0] == 'D' && output[i + 2][0] == 'U') ||
			(output[i][0] == 'D' && output[i + 1][0] == 'U' && output[i + 2][0] == 'D') ||
			(output[i][0] == 'F' && output[i + 1][0] == 'B' && output[i + 2][0] == 'F') ||
			(output[i][0] == 'B' && output[i + 1][0] == 'F' && output[i + 2][0] == 'B') ||
			(output[i][0] == 'R' && output[i + 1][0] == 'L' && output[i + 2][0] == 'R') ||
			(output[i][0] == 'L' && output[i + 1][0] == 'R' && output[i + 2][0] == 'L'))
			cout << "\033[91m" << "FAILED" << "\033[0m" << "  " << output[i] << "  " << output[i + 1] << "  " << output[i + 2] << endl;
		else
			cout << "\033[32m" << "PASSED" << "\033[0m" << endl;














	}
}

