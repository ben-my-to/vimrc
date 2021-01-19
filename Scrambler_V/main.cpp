/*
* Project: WCA Rubik's Cube Scrambler
* Vector (Dynamically Allocated Array) Implementation
*/

#include <iostream>
#include <string>
#include <cmath>
#include <cstdlib>
#include <ctime>
#include <conio.h>
#include <Windows.h>

#include "Scrambler_V.h"
#include "Timer.h"

using namespace std;

void hide_cursor(){
    CONSOLE_CURSOR_INFO info;
    info.dwSize = 100;
    info.bVisible = FALSE;
    SetConsoleCursorInfo(GetStdHandle(STD_OUTPUT_HANDLE), &info);
}

int main() {
	Scrambler cube;
    Timer watch;
	srand(time(NULL));
    hide_cursor();

	cout << "#################################################\n"
		<< "###                                           ###\n"
		<< "###        Rubik's Cube Scrambler: v0.1       ###\n"
		<< "###          Created By: Jason Duong          ###\n"
		<< "###                                           ###\n"
		<< "#################################################\n\n"
		<< "Press SpaceBar . . . ";

	while (_getch()==' ') { // reads character input from user and automatically execute statements
		system("CLS");
		cube.generator_3x3();
		cube.print();
        cout << "\033[32m" << "\n\nStart" << "\033[0m";
        watch.elapseTime();
        _getch();
	}

	return 0;
}
