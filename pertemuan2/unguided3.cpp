#include <iostream>

using namespace std;

int main() {
    const int SIZE = 10;
    int arr[SIZE];
    int sum = 0;
    int max = INT_MIN;
    int min = INT_MAX;

    cout << "Masukkan " << SIZE << " elemen array: ";
    for (int i = 0; i < SIZE; i++) {
        cin >> arr[i];
        sum += arr[i];
        if (arr[i] > max) {
            max = arr[i];
        }
        if (arr[i] < min) {
            min = arr[i];
        }
    }

    cout << "Nilai maksimum: " << max << endl;
    cout << "Nilai minimum: " << min << endl;
    cout << "Nilai rata-rata: " << (float)sum / SIZE << endl;

    return 0;
}