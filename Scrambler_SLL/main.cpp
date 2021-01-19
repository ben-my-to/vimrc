/*
* Project: WCA Rubik's Cube Scrambler
* Singly Linked List Implementation
*/

#include <iostream>
#include <string>
#include <cmath>
#include <cstdlib>
#include <ctime>
#include <conio.h>
#include <list>
#include <Windows.h>

#include "Scrambler_SLL.h"

void hide_cursor(){
    CONSOLE_CURSOR_INFO info;
    info.dwSize = 100;
    info.bVisible = FALSE;
    SetConsoleCursorInfo(GetStdHandle(STD_OUTPUT_HANDLE), &info);
}

using namespace std;

int main() {
	Scrambler cube;
	srand(time(NULL));
    hide_cursor();

	cout << "#################################################\n"
		 << "###                                           ###\n"
		 << "###        Rubik's Cube Scrambler: v0.2       ###\n"
		 << "###          Created By: Jason Duong          ###\n"
		 << "###                                           ###\n"
		 << "#################################################\n\n"
		 << "Press SpaceBar . . . ";

	while (_getch() == ' ') {
		system("CLS");
		cube.generator_3x3();
		cube.print();
	}

	return 0;
}
