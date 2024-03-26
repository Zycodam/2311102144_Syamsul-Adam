#include <iostream>
#include <iomanip>
using namespace std;

//Deklarasi Struct Node
struct Node {
    string nama144;
    int umur144;
    Node* next;
};

Node* head;
Node* tail;

//Inisialisasi Node
void node144() {
    head = NULL;
    tail = NULL;
}

// Pengecekan
bool Cek_144() {
    if (head == NULL)
        return true;
    else
        return false;
}

//Tambah Depan
void Depan_144(string name, int age) {
    //Buat Node baru
    Node* baru = new Node;
    baru->nama144 = name;
    baru->umur144 = age;
    baru->next = NULL;

    if (Cek_144() == true) {
        head = tail = baru;
        tail->next = NULL;
    }
    else {
        baru->next = head;
        head = baru;
    }
}

//Tambah Belakang
void Belakang_144(string name, int age) {
    //Buat Node baru
    Node* baru = new Node;
    baru->nama144 = name;
    baru->umur144 = age;
    baru->next = NULL;

    if (Cek_144() == true) {
        head = tail = baru;
        tail->next = NULL;
    }
    else {
        tail->next = baru;
        tail = baru;
    }
}

//Hitung Jumlah List
int jumlah144() {
    Node* hitung;
    hitung = head;
    int jumlah = 0;

    while (hitung != NULL) {
        jumlah++;
        hitung = hitung->next;
    }

    return jumlah;
}

//Tambah Tengah
void Tengah_144(string name, int age, int posisi) {
    if (posisi < 1 || posisi > jumlah144()) {
        cout << "Tidak terjangkau!" << endl;
    }
    else if (posisi == 1) {
        cout << "Bukan di tengah." << endl;
    }
    else {
        Node* baru, * bantu;
        baru = new Node();
        baru->nama144 = name;
        baru->umur144 = age;

        // tranversing
        bantu = head;
        int nomor = 1;

        while (nomor < posisi - 1) {
            bantu = bantu->next;
            nomor++;
        }

        baru->next = bantu->next;
        bantu->next = baru;
    }
}

//Hapus Depan
void Hapus_144() {
    Node* hapus;

    if (Cek_144() == false) {
        if (head->next != NULL) {
            hapus = head;
            head = head->next;
            delete hapus;
        }
        else {
            head = tail = NULL;
        }
    }
    else {
        cout << "Kosong!" << endl;
    }
}

//Hapus Belakang
void Hapusbelakang_144() {
    Node* hapus;
    Node* bantu;

    if (Cek_144() == false) {
        if (head != tail) {
            hapus = tail;
            bantu = head;

            while (bantu->next != tail) {
                bantu = bantu->next;
            }

            tail = bantu;
            tail->next = NULL;
            delete hapus;
        }
        else {
            head = tail = NULL;
        }
    }
    else {
        cout << "Kosong!" << endl;
    }
}

//Hapus Tengah
void hapustengah_144(int posisi) {
    Node* hapus, * bantu, * bantu2;

    if (posisi < 1 || posisi > jumlah144()) {
        cout << "Tidak terjangkau!" << endl;
    }
    else if (posisi == 1) {
        cout << "Bukan yang tengah." << endl;
    }
    else {
        int nomor = 1;
        bantu = head;

        while (nomor <= posisi) {
            if (nomor == posisi - 1) {
                bantu2 = bantu;
            }

            if (nomor == posisi) {
                hapus = bantu;
            }

            bantu = bantu->next;
            nomor++;
        }

        bantu2->next = bantu;
        delete hapus;
    }
}

//Ubah Depan
void ubahdepan_144(string name, int age) {
    if (Cek_144() == false) {
        head->nama144 = name;
        head->umur144 = age;
    }
    else {
        cout << "Tidak ada yang berubah!" << endl;
    }
}

//Ubah Tengah
void ubahtengah_144(string name, int age, int posisi) {
    Node* bantu;

    if (Cek_144() == false) {
        if (posisi < 1 || posisi > jumlah144()) {
            cout << "Tidak Terjangkau!" << endl;
        }
        else if (posisi == 1) {
            cout << "Bukan yang Tengah." << endl;
        }
        else {
            bantu = head;
            int nomor = 1;

            while (nomor < posisi) {
                bantu = bantu->next;
                nomor++;
            }

            bantu->nama144 = name;
            bantu->umur144 = age;
        }
    }
    else {
        cout << "Kosong!" << endl;
    }
}

//Ubah Belakang
void ubahbelakang_144(string name, int age) {
    if (Cek_144() == false) {
        tail->nama144 = name;
        tail->umur144 = age;
    }
    else {
        cout << "Kosong" << endl;
    }
}

//Hapus List
void hapuslist_144() {
    Node* bantu, * hapus;
    bantu = head;

    while (bantu != NULL) {
        hapus = bantu;
        bantu = bantu->next;
        delete hapus;
    }

    head = tail = NULL;
    cout << "Menghapus semua!" << endl;
}

//Tampilkan List
void Tampilist_144() {
    Node* bantu;
    bantu = head;

    cout << left << setw(15) << "-Nama-" << right << setw(4) << "-Usia-" << endl; // Supaya rapi

    if (Cek_144() == false) {
        while (bantu != NULL) {
            cout << left << setw(15) << bantu->nama144 << right << setw(4) << bantu->umur144 << endl; // Supaya lurus di output
            bantu = bantu->next;
        }

        cout << endl;
    }
    else {
        cout << "Kosong!" << endl;
    }
}

int main() {
    node144(); // Inisialisasi Linked List
    cout << "\n(A.)-=-=-=Welcome to My Program=-=-=-" << endl; // Menampilkan nama dan umur awal & menjawab poin a
    Depan_144("Karin", 18);
    Depan_144("Hoshino", 18);
    Depan_144("Akechi", 20);
    Depan_144("Yusuke", 19);
    Depan_144("Michael", 18);
    Depan_144("Jane", 20);
    Depan_144("John", 19);
    Depan_144("Syamsul Adam", 19);
    Tampilist_144();

    // Menjawab poin b
    cout << "-=-=-= (B) Hapus 'Akechi' =-=-=-" << endl;
    hapustengah_144(6);
    Tampilist_144();

    // Menjawab poin c
    cout << "-=-=-= (C) Tambah 'Futaba (18)' diantara John & Jane =-=-=-" << endl;
    Tengah_144("Futaba", 18, 3);
    Tampilist_144();

    // Menjawab poin d
    cout << "-=-=-= (D) Tambah 'Igor (20)' di awal =-=-=-" << endl;
    Depan_144("Igor", 20);
    Tampilist_144();

    // Menjawab poin e & f
    cout << "-=-=-= (E) Ubah 'Michael' menjadi 'Reyn (18)' =-=-=-" << endl;
    cout << "-=-=-= (F) Tampilan Akhir =-=-=-" << endl;
    ubahtengah_144("Reyn", 18, 6);
    Tampilist_144();

    return 0;
}