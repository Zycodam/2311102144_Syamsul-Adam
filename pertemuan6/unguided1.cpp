#include <iostream>
#include <conio.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#define maxstack196 200
using namespace std;

struct STACK {
    int top;
    char data[maxstack196];
};

char data[maxstack196];
struct STACK stacknew;

void inisialisasi() {
    stacknew.top = -1;
}

bool isFull() {
    if (stacknew.top == maxstack196 - 1) {
        return true;
    } else {
        return false;
    }
}

bool isEmpty() {
    if (stacknew.top == -1) {
        return true;
    } else {
        return false;
    }
}

void push(char data) {
    if (isFull() == false) {
        stacknew.top++;
        stacknew.data[stacknew.top] = data;
    } else {
        cout << "\n _stack penuh_";
    }
}

void pop() {
    while (isEmpty() == false) {
        cout << stacknew.data[stacknew.top];
        stacknew.top--;
    }
}

void print() {
    cout << "";
    for (int r = 0; r <= stacknew.top; r++) {
        cout << stacknew.data[r];
    }
}

void clear() {
    stacknew.top = -1;
}

int main() {
    while (true) {
        system("cls");
        char kata[80];
        cout << "\n \t Program Polindrom Kata \t" << endl;
        cout << endl;
        int i, j, flag = 0, panjang, cek = 0;
        cout << " Masukkan kata max karakter (80) : ";
        cin.getline(kata, 80);
        panjang = strlen(kata);
        for (i = 0, j = panjang - 1; i <= (panjang / 2); ++i, --j) {
            if (tolower(kata[i]) == tolower(kata[j])) {
                flag++;
            } else {
                flag = 0;
            }
            cek++;
        }
        if (flag == cek) {
            cout << " Kalimat : " << kata << "\n\n _kata " << kata << " tersebut adalah POLINDROM_ \n" << endl;
        } else {
            cout << " Kalimat : " << kata << "\n\n _kata " << kata << " tersebut BUKAN polindrom_ \n" << endl;
            getch();
        }
        system("pause");
    }
    return 0;
}