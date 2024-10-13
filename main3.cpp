#include <iostream>
using namespace std;

const double pi = 3.14;
string nama = "Adam144";

int main() {
    double jariJari;
    double keliling, luas;

    cout << "Program Menghitung Keliling dan Luas Lingkaran" << endl;
    cout << "Nama: " << nama << endl;
    cout << "Masukkan jari-jari lingkaran: ";
    cin >> jariJari;

    keliling = 2 * pi * jariJari;
    luas = pi * jariJari * jariJari;

    cout << "Keliling lingkaran: " << keliling << endl;
    cout << "Luas lingkaran: " << luas << endl;

    return 0;
}

//Program ini menghitung keliling dan luas lingkaran berdasarkan jari-jari yang diinput oleh pengguna. Program ini menggunakan konstanta pi yang telah didefinisikan sebelumnya dan nama pengguna yang telah diinisialisasi. Setelah pengguna memasukkan jari-jari, program akan menghitung keliling dan luas lingkaran menggunakan rumus matematika dan menampilkan hasilnya.