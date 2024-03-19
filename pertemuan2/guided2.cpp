#include <iostream>
using namespace std;

int main() {
    int maks, a, i, lokasi;

    cout << "Masukkan panjang array: ";
    cin >> a;

    int array[a];

    cout << "Masukkan " << a << " angka:\n";
    for (i = 0; i < a; i++) {
        cout << "Array ke-" << (i + 1) << ": ";
        cin >> array[i];
    }

    maks = array[0];
    lokasi = 0;
    for (i = 0; i < a; i++) {
        if (array[i] > maks) {
            maks = array[i];
            lokasi = i;
        }
    }

    cout << "Nilai maksimum adalah " << maks << " berada di Array ke " << lokasi + 1 << endl;

    return 0;
}