#include <iostream>
#include <vector>
#include <conio.h>
#include <Windows.h>
#include <string>

using namespace std;

void hide_cursor(){
    CONSOLE_CURSOR_INFO info;
    info.dwSize = 100;
    info.bVisible = FALSE;
    SetConsoleCursorInfo(GetStdHandle(STD_OUTPUT_HANDLE), &info);
}

int main() {
    string _prev = "";
	int rm = rand() % 20;
	vector<string> pll = {"A(a)", "A(b)", "T", "F", "V", "U(a)", "U(b)", "Z", "H", "J(a)", "J(b)", "N(a)", "N(b)", "E", "G(a)", "G(b)", "G(c)", "G(d)", "Y", "R(a)", "R(b)"};
    hide_cursor();

	do {
		system("CLS");
        while (_prev.compare(pll.at(rm)) == 0)
            rm = rand() % 20;
        cout << pll.at(rm) << endl;
        _prev = pll.at(rm);
	} while (_getch() == ' ');

	return 0;
}
