#pragma once

#include <iostream>
#include <conio.h>
#include <Windows.h>
#include <string>
#include <queue>
#include <iomanip>

using namespace std;

class Timer {
private:
    int min, sec;
    double average;
    queue<int> listTimes;

public:
    Timer(){
        this->min = 0;
        this->sec = 0;
        this->average = 0.0;
    }

    double avg(queue<int>, int);
    void elapseTime();
}; 

double Timer::avg(queue<int> temp, int len){
    while (!temp.empty()){
        average += temp.front();
        temp.pop();
    }

    average /= len;
    return average;
}

void Timer::elapseTime(){
    min = 0;
    sec = 0;
    _getch();
    while (!_kbhit()){
        sec++;
        Sleep(1000);

        if (sec > 59){
            min++;
            sec = 0;
        }

        system("CLS");
        if (min != 0)
            cout << min << "." << sec << endl;
        else if (sec != 0)
            cout << "0" << "." << sec << endl;
        else
            cout << "0" << "." << "0" << endl;
    }
    
    listTimes.push(sec);

    if (listTimes.size() > 5){
        listTimes.pop();
        if (listTimes.size() == 5)
        cout << "\nao5: " << setprecision(3) << avg(listTimes, 5); 
    }
    else
        cout << "\nao5: N/A";
}
