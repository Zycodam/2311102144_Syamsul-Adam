#include <iostream>
using namespace std;

// Struktur simpul untuk node dalam linked list
struct Mahasiswa {
    string nama144;
    string nim144;
    Mahasiswa* next;
};

// Kelas Queue yang menggunakan linked list
class Queue {
private:
    Mahasiswa* front; // Pointer ke depan antrian
    Mahasiswa* back;  // Pointer ke belakang antrian

public:
    Queue() {
        front = nullptr;
        back = nullptr;
    }

    // Fungsi untuk mengecek apakah antrian kosong
    bool isEmpty() {
        return front == nullptr;
    }

    // Fungsi untuk menambahkan data ke antrian
    void enqueue(string nama_adm, string nim_adm) {
        Mahasiswa* newNode = new Mahasiswa();
        newNode->nama144 = nama_adm;
        newNode->nim144 = nim_adm;
        newNode->next = nullptr;

        // Jika antrian kosong, node baru menjadi front dan back
        if (isEmpty()) {
            front = newNode;
            back = newNode;
        } else {
            // Jika antrian tidak kosong, tambahkan node baru ke belakang dan update back
            back->next = newNode;
            back = newNode;
        }
        cout << "Data berhasil dimasukkan ke dalam antrian" << endl;
    }

    // Fungsi untuk menghapus data dari antrian
    void dequeue() {
        if (isEmpty()) {
            cout << "Antrian kosong" << endl;
        } else {
            // Jika antrian tidak kosong, hapus node pertama dan update front
            Mahasiswa* temp = front;
            front = front->next;
            delete temp;
            cout << "Data berhasil dihapus dari antrian" << endl;
        }
    }

    // Fungsi untuk menghitung jumlah data dalam antrian
    int countQueue() {
        int count = 0;
        Mahasiswa* temp = front;
        while (temp != nullptr) {
            count++;
            temp = temp->next;
        }
        return count;
    }

    // Fungsi untuk menghapus semua data dari antrian
    void clearQueue() {
        while (!isEmpty()) {
            dequeue();
        }
        cout << "Data berhasil di-reset" << endl;
    }

    // Fungsi untuk menampilkan data dalam antrian
    void viewQueue() {
        if (isEmpty()) {
            cout << "Antrian kosong" << endl;
        } else {
            cout << "Data antrian Mahasiswa: " << endl;
            Mahasiswa* temp = front;
            int pos = 1;
            while (temp != nullptr) {
                cout << pos << ". Nama: " << temp->nama144 << " || NIM: " << temp->nim144 << endl;
                temp = temp->next;
                pos++;
            }
        }
    }
};

int main() {
    Queue queue;
    int choice;

    do {
        cout << "=== Menu Antrian Mahasiswa ===" << endl;
        cout << "1. Masukkan data" << endl;
        cout << "2. Hapus satu data" << endl;
        cout << "3. Reset data" << endl;
        cout << "4. Tampil data" << endl;
        cout << "5. Keluar" << endl;
        cout << "==============================\n" << endl;
        cout << "Masukkan Pilihan Anda: ";
        cin >> choice;

        switch (choice) {
            case 1: {
                string nama_144, nim_144;
                cout << "Masukkan Nama Mahasiswa : ";
                cin.ignore();
                getline(cin, nama_144);
                cout << "Masukkan NIM Mahasiswa  : ";
                cin >> nim_144;
                queue.enqueue(nama_144, nim_144);
                break;
            }
            case 2: {
                if (queue.isEmpty()) {
                    cout << "Antrian kosong" << endl;
                } else {
                    queue.dequeue ();
                }
                break;
            }
            case 3: {
                if (queue.isEmpty()) {
                    cout << "Antrian kosong" << endl;
                } else {
                    queue.clearQueue();
                }
                break;
            }
            case 4: {
                queue.viewQueue();
                break;
            }
            case 5: {
                cout << "Terima kasih telah menggunakan layanan kami ;)" << endl;
                break;
            }
            default: {
                cout << "Pilihan yang Anda masukkan tidak valid" << endl;
                break;
            }
        }

        cout << endl;

    } while (choice != 5);

    return 0;
}