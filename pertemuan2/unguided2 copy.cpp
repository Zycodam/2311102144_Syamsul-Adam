#include <iostream>
using namespace std;

int main() {
    int jumlahBaris, kolom1, kolom2;
    cout << "Masukkan jumlah elemen matriks: ";
    cin >> jumlahBaris;
    cout << "Masukkan ukuran matriks (y z): ";
    cin >> kolom1 >> kolom2;

    int matriks[jumlahBaris][kolom1][kolom2];
    //Input elemen
    for (int i = 0; i < jumlahBaris; i++) {
        for (int j = 0; j < kolom1; j++) {
            for (int k = 0; k < kolom2; k++) {
                cout << "Input Matriks[" << i << "][" << j << "][" << k << "] = ";
                cin >> matriks[i][j][k];
            }
        }
        cout << endl;
    }
    //Output Array
    for (int i = 0; i < jumlahBaris; i++) {
        for (int j = 0; j < kolom1; j++) {
            for (int k = 0; k < kolom2; k++) {
                cout << "Data Matriks[" << i << "][" << j << "][" << k << "] = " << matriks[i][j][k] << endl;
            }
            
        } 
    }
    cout << endl; 
    //Tampilan array
    for (int i = 0; i < jumlahBaris; i++) { 
        cout << "Matriks ke-" << i+1 << ":" << endl; 
        for (int j = 0; j < kolom1; j++) { 
            for (int k = 0; k < kolom2; k++) { 
                cout << matriks[i][j][k] << " "; 
           } 
             cout << endl; 
        } 
        cout << endl; 
    } 
    return 0; 
}