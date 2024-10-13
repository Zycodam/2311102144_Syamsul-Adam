#include <iostream>
using namespace std;
//2311102144
const int maksimalQueue = 10;
int front = 0;
int back = 0;
string queueTeller[maksimalQueue];

bool isFull() {
    return back == maksimalQueue;
}

bool isEmpty() {
    return back == 0;
}

void enqueueAntrian(string data) {
    if (isFull()) {
        cout << "Antrian penuh" << endl;
    } else {
        queueTeller[back] = data;
        back++;
    }
}

void dequeueAntrian() {
    if (isEmpty()) {
        cout << "Antrian kosong" << endl;
    } else {
        front++;
        if (front == maksimalQueue) {
            front = 0;
        }
    }
}

int countQueue() {
    return back;
}

void clearQueue() {
    if (isEmpty()) {
        cout << "Antrian kosong" << endl;
    } else {
        front = 0;
        back = 0;
    }
}

void viewQueue() {
    cout << "Data antrian teller:" << endl;
    for (int i = 0; i < maksimalQueue; i++) {
        if (i >= front && i < back) {
            cout << i + 1 << ". " << queueTeller[i] << endl;
        } else {
            cout << i + 1 << ". (kosong)" << endl;
        }
    }
}

int main() {
    enqueueAntrian("Andi");
    enqueueAntrian("Thomas");
    enqueueAntrian("Bryan");
    enqueueAntrian("Dicka");
    enqueueAntrian("Adam"); // antrian ke 5
    enqueueAntrian("Anggraini");
    enqueueAntrian("Rafit");
    enqueueAntrian("Udin");
    enqueueAntrian("Vina");
    enqueueAntrian("Rahmadhani");
    viewQueue();
    cout << "Jumlah antrian = " << countQueue() << endl;
    dequeueAntrian();
    return 0;
}

//Program ini mengimplementasikan struktur data antrian sederhana untuk mengelola antrian teller. Program ini memungkinkan pengguna untuk menambahkan pelanggan ke antrian (enqueue), menghapus pelanggan dari antrian (dequeue), melihat antrian saat ini, dan mengosongkan antrian. Program juga memeriksa kondisi antrian penuh dan kosong.