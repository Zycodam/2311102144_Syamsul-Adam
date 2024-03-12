#include <iostream>

using namespace std;

int add(int a, int b) {
    return a + b;
}

int subtract(int a, int b) {
    return a - b;
}

int main() {
    int num1, num2;
    cout << "Masukkan bilangan pertama: ";
    cin >> num1;
    cout << "Masukkan bilangan kedua: ";
    cin >> num2;

    cout << "Hasil penjumlahan: " << add(num1, num2) << endl;
    cout << "Hasil pengurangan: " << subtract(num1, num2) << endl;

    return 0;
}


//Tipe data primitif adalah tipe data dasar yang telah ditentukan oleh bahasa pemrograman.
//Mereka digunakan untuk menyimpan nilai tunggal seperti angka, karakter, atau nilai boolean.
//Tipe data primitif memiliki ukuran yang tetap dan operasi yang sederhana. 
//Contoh tipe data primitif umum termasuk integer, floating-point, character, dan boolean.
//Mereka digunakan dalam operasi matematika, logika, dan manipulasi data yang sederhana.