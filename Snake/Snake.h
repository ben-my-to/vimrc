#pragma once

#include <iostream>
#include <string>
#include <vector>
#include <list>
#include <cmath>
#include <Windows.h>

using namespace std;

class Snake{
private:
    int x_coor, y_coor, row = 20, col = 20;
    list<int> slen;
public:
    Snake(){
        this->x_coor = row/2;
        this->y_coor = col/2;
        this->slen.push_back(1);
    }
    void hide_cursor();
    void gotoxy(int, int);
    void canvas();
    void moveSnake();
};

void Snake::hide_cursor(){
    CONSOLE_CURSOR_INFO info;
    info.dwSize = 100;
    info.bVisible = FALSE;
    SetConsoleCursorInfo(GetStdHandle(STD_OUTPUT_HANDLE), &info);
}

void Snake::gotoxy(int xcoor, int ycoor){
    for (int j=0; j<ycoor; ++j)
        cout << endl;
    for (int i=0; i<xcoor; ++i)
        cout << "   "; 
}

void Snake::canvas(){
    int board[row][col] = {};

    for(int i=0; i<row; ++i){
        for (int j=0; j<col; ++j){
            if (i==0 || i==row-1 || j==0 || j==col-1)
                cout << "*" << " ";
            else
                cout << "  ";
        }
        cout << endl;
    }
}

void Snake::moveSnake(){
    int snake_pos[row][col] = {};

    for(int i=0; i<row; ++i){
        for (int j=0; j<col; ++j){
            if (i==x_coor && j==y_coor)
                cout << "*";
            else
                cout << "  ";
        }
        cout << endl;
    } 




}
