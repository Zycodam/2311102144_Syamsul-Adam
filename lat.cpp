#include <iostream>
using namespace std;
const int maksimalQueue = 5;
int front = 0;
int back = 0;
string queueTeller[ ]; // TODO: Lengkapi bagian ini
bool isFull() {
// TODO: Lengkapi bagian ini
}
bool isEmpty() {
// TODO: Leng
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
// TODO: Lengkapi bagian ini
}
}
int countQueue() {
return back;
}
void clearQueue() {
if (isEmpty()) {
cout << "Antrian kosong" << endl;
} else {
// TODO: Lengkapi bagian ini
}
}
void viewQueue() {
cout << "Data antrian teller:" << endl;
for (int i = 0; i < maksimalQueue; i++) {
if (queueTeller[i] != "") {
cout << i + 1 << ". " << queueTeller[i] <<
endl;
} else {
cout << i + 1 << ". (kosong)" << endl;
}
}
}
int main() {
enqueueAntrian("Andi");
enqueueAntrian("Maya");
enqueueAntrian("Putri");
viewQueue();
cout << "Jumlah antrian = " << countQueue() << endl;
dequeueAntrian();
viewQueue();
cout << "Jumlah antrian = " << countQueue() << endl;
clearQueue();
viewQueue();
cout << "Jumlah antrian = " << countQueue() << endl;
return 0;