#include <iostream>

using namespace std;

// Definisikan class mahasiswa
class Mahasiswa {
private:
    string nama;
    int umur;

public:
    // Konstruktor
    Mahasiswa(string n, int u) {
        nama = n;
        umur = u;
    }

    // Fungsi untuk mengambil nama
    string getNama() {
        return nama;
    }

    // Fungsi untuk mengambil umur
    int getUmur() {
        return umur;
    }
};

// Definisikan struct mahasiswa
struct MahasiswaStruct {
    string nama;
    int umur;
};

int main() {
    // Membuat objek mahasiswa dari class
    Mahasiswa mhs1("syamsul ", 20);
    cout << "Nama: " << mhs1.getNama() << ", Umur: " << mhs1.getUmur() << endl;

    // Membuat objek mahasiswa dari struct
    MahasiswaStruct mhs2 = {"adam", 22};
    cout << "Nama: " << mhs2.nama << ", Umur: " << mhs2.umur << endl;

    return 0;
}

//Class
//Kelas digunakan untuk membuat tipe data yang kompleks dengan menyatukan data (variabel) dan perilaku (metode) ke dalam satu entitas.
//Kelas mempromosikan konsep enkapsulasi, di mana detail internalnya disembunyikan dan hanya fungsionalitas yang terpapar secara publik.
//Mendukung konsep abstraksi, yang memungkinkan pengguna kelas untuk berinteraksi dengan antarmuka publik tanpa harus memahami implementasi internalnya.
//Pewarisan memungkinkan kelas untuk mewarisi sifat dan perilaku dari kelas lain, memfasilitasi penggunaan kembali kode dan pembuatan hierarki kelas.
//Polimorfisme memungkinkan objek dari kelas yang berbeda untuk diperlakukan sebagai objek dari kelas dasar yang umum, menyediakan fleksibilitas dalam desain kode.
//Kontrol akses (public, private, protected) digunakan untuk mengatur visibilitas dan aksesibilitas anggota kelas.

//Struct
//Struct adalah tipe data yang digunakan untuk membuat struktur data sederhana dengan anggota yang dapat diakses secara publik secara default.
//Dapat digunakan untuk mengelompokkan data terkait bersama-sama.
//Mendukung pewarisan tetapi hanya dalam konteks pewarisan gaya C++ (gaya C), di mana anggota diwariskan sebagai publik secara default.
//Struct sering digunakan untuk kompatibilitas mundur dengan C, memungkinkan penggunaan kode C dalam program C++.