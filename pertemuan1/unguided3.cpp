#include <iostream>
#include <map>
#include <array>

using namespace std;
int main() {

//Deklarasi fungsi array
int nilai[5];
nilai[0] = 23;
nilai[1] = 50;
nilai[2] = 34;
nilai[3] = 78;
nilai[4] = 90;

cout << "Isi array pertama : " << nilai[0] << endl;
cout << "Isi array kedua : " << nilai[1] << endl;
cout << "Isi array ketiga : " << nilai[2] << endl;
cout << "Isi array keempat : " << nilai[3] << endl;
cout << "Isi array kelima : " << nilai[4] << endl;


//Deklarasi fungsi Map
std::map<std::string, int> nilaiMap;

nilaiMap["Kumbang"] = 1;
nilaiMap["Semut"] = 2;
nilaiMap["Kecoa"] = 3;

std::cout << "Nilai dari Map:" << std::endl;
for (auto it = nilaiMap.begin(); it != nilaiMap.end(); ++it)
{
    std::cout << "Nama Hewan: " <<it->first <<", Jumlah: " << it->second << std::endl;
}


return 0;
}

//Array
//Merupakan struktur data yang digunakan untuk menyimpan elemen-elemen yang bertipe data sama dan tidak bisa menyimpan tipe data yang beda. 
//Di dalam kode yang saya buat diatas saya membuat nilai berisi lima elemen bertipe integer. 
//Saya mengakses elemen-elemen array tersebut menggunakan indeks, yang merupakan angka mulai dari 0. nilai[0] akan mengakses elemen pertama dalam array.


//Map
//Merupakan struktur data yang menyimpan pasangan kunci-nilai. Kunci dan nilai ini bisa berupa tipe data apa pun. 
//Dalam kode yang saya buat nilaiMap adalah map yang kuncinya adalah string dan nilainya adalah integer. saya mengunakan nilai yang mengakses dalam map menggunakan kunci. 
//Diatas saya membuat nilaiMap["Kumbang"] mengakses nilai yang terkait dengan kunci "Kumbang".
