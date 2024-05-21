#include <iostream>
using namespace std;

int HitungAngka_144( const int array[], int size_144, int target_144) {
    int count = 0;

    for (int i = 0; i < size_144; i++) {
        if (array[i] == target_144) {
            count++;
        }
    }

    return count;
}

int main() {
    const int size_144 = 10;
    int array[size_144] = {9, 4, 1, 4, 7, 10, 5, 4, 12, 4};
    int target_144 = 4;

    int count = HitungAngka_144(array, size_144, target_144);

    cout << "=======================" << endl;
    cout << "MENGHITUNG ANGKA TARGET" << endl;
    cout << "=======================" << endl;
    cout << "Jumlah angka " << target_144 <<  endl;
    cout << "Ditemukan dalam data sebanyak: " << count << endl;

    return 0;
}