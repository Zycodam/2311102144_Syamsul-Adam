#include <iostream>
#include <vector>
#include <string>
using namespace std;

struct Mahasiswa {
    string NIM_144;
    float NILAI_144;
};

class HashTable {
private:
    static const int table_size = 10; // Ukuran hash table disetel ke 10 untuk contoh
    vector<Mahasiswa> table[table_size];

    int hash_func(string NIM_144) {
        int sum = 0;
        for (char c : NIM_144) {
            sum += int(c);
        }
        return sum % table_size;
    }

public:
    void tambah_data(Mahasiswa mahasiswa) {
        int index = hash_func(mahasiswa.NIM_144);
        table[index].push_back(mahasiswa);
    }

    bool hapus_data(string NIM_144) {
        int index = hash_func(NIM_144);
        for (int i = 0; i < table[index].size(); ++i) {
            if (table[index][i].NIM_144 == NIM_144) {
                table[index].erase(table[index].begin() + i);
                return true;
            }
        }
        return false;
    }

    Mahasiswa* cari_berdasarkan_nim(string NIM_144) {
        int index = hash_func(NIM_144);
        for (Mahasiswa &mahasiswa : table[index]) {
            if (mahasiswa.NIM_144 == NIM_144) {
                return &mahasiswa;
            }
        }
        return nullptr;
    }

    vector<Mahasiswa> cari_berdasarkan_rentang_nilai(float nilai_awal, float nilai_akhir) {
        vector<Mahasiswa> mahasiswa_ditemukan;
        for (int i = 0; i < table_size; ++i) {
            for (Mahasiswa &mahasiswa : table[i]) {
                if (mahasiswa.NILAI_144 >= nilai_awal && mahasiswa.NILAI_144 <= nilai_akhir) {
                    mahasiswa_ditemukan.push_back(mahasiswa);
                }
            }
        }
        return mahasiswa_ditemukan;
    }
};

// Fungsi untuk menampilkan menu
void tampilkan_menu() {
    cout << "Pilihan Menu:" << endl;
    cout << "1. Tambah Data Mahasiswa" << endl;
    cout << "2. Hapus Data Mahasiswa" << endl;
    cout << "3. Cari Data Mahasiswa Berdasarkan NIM" << endl;
    cout << "4. Cari Data Mahasiswa Berdasarkan Rentang Nilai (80-90)" << endl;
    cout << "5. Keluar" << endl;
}

int main() {
    HashTable hash_table;

    while (true) {
        tampilkan_menu();
        int pilihan;
        cout << "Masukkan pilihan Anda: ";
        cin >> pilihan;

        if (pilihan == 1) {
            Mahasiswa mahasiswa;
            cout << "Masukkan NIM mahasiswa: ";
            cin >> mahasiswa.NIM_144;
            cout << "Masukkan nilai mahasiswa: ";
            cin >> mahasiswa.NILAI_144;
            hash_table.tambah_data(mahasiswa);
            cout << "Data mahasiswa telah ditambahkan." << endl;
        } else if (pilihan == 2) {
            string NIM_144;
            cout << "Masukkan NIM mahasiswa yang akan dihapus: ";
            cin >> NIM_144;
            if (hash_table.hapus_data(NIM_144)) {
                cout << "Data mahasiswa dengan NIM " << NIM_144 << " telah dihapus." << endl;
            } else {
                cout << "Data mahasiswa dengan NIM " << NIM_144 << " tidak ditemukan." << endl;
            }
        } else if (pilihan == 3) {
            string NIM_144;
            cout << "Masukkan NIM mahasiswa yang ingin dicari: ";
            cin >> NIM_144;
            Mahasiswa* mahasiswa = hash_table.cari_berdasarkan_nim(NIM_144);
            if (mahasiswa != nullptr) {
                cout << "Data Mahasiswa Ditemukan:" << endl;
                cout << "NIM: " << mahasiswa->NIM_144 << endl;
                cout << "Nilai: " << mahasiswa->NILAI_144 << endl;
            } else {
                cout << "Data Mahasiswa dengan NIM " << NIM_144 << " tidak ditemukan." << endl;
            }
        } else if (pilihan == 4) {
            vector<Mahasiswa> mahasiswa_ditemukan = hash_table.cari_berdasarkan_rentang_nilai(80, 90);
            if (!mahasiswa_ditemukan.empty()) {
                cout << "Data Mahasiswa dengan Nilai Antara 80 dan 90:" << endl;
                for (Mahasiswa &mahasiswa : mahasiswa_ditemukan) {
                    cout << "NIM: " << mahasiswa.NIM_144 << endl;
                    cout << "Nilai: " << mahasiswa.NILAI_144 << endl;
                }
            } else {
                cout << "Tidak Ada Data Mahasiswa dengan Nilai Antara 80 dan 90." << endl;
            }
        } else if (pilihan == 5) {
            cout << "Terima Kasih!" << endl;
            break;
        } else {
            cout << "Pilihan Tidak Valid. Silakan Pilih Lagi." << endl;
        }
    }

    return 0;
}