#include <iostream>
#include <string>
#include <vector>
#include <Windows.h>

#include "Snake.h"

using namespace std;

int main(){
    Snake cobra;
    cobra.hide_cursor();
    cobra.canvas();
    cobra.moveSnake();

    system("pause>nul");
    return 0;
}
