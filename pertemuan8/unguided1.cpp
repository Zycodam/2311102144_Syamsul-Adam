#include <iostream>
using namespace std;

void selectionSort(string &huruf, int n)
{
    int i, j, min_144;
    for (i = 0; i < n - 1; i++)
    {
        min_144 = i;
        for (j = i + 1; j < n; j++)
            if (huruf[j] < huruf[min_144])
                min_144 = j;
        char temp = huruf[i];
        huruf[i] = huruf[min_144];
        huruf[min_144] = temp;
    }
}

int binarySearch(string Huruf_144, int kiri_144, int kanan_144, char target_144)
{
    while (kiri_144 <= kanan_144)
    {
        int mid = kiri_144 + (kanan_144 - kiri_144) / 2;
        if (Huruf_144[mid] == target_144)
            return mid;
        if (Huruf_144[mid] < target_144)
            kiri_144 = mid + 1;
        else
            kanan_144 = mid - 1;
    }
    return -1;
}

int main()
{
    string kalimat_144;
    char input140;
    cout << "====================================" << endl;
    cout << "PROGRAM MENENTUKAN INDEKS PADA HURUF" << endl;
    cout << "====================================" << endl;
    cout << "Masukkan kalimat yang anda inginkan: ";
    getline(cin, kalimat_144);
    cout << "Masukkan huruf yang anda ingin cari: ";
    cin >> input140;
    cout << endl;
    selectionSort(kalimat_144, kalimat_144.size());
    int result = binarySearch(kalimat_144, 0, kalimat_144.size() - 1, input140);
    if (result == -1)
    {
        cout << "Huruf yang anda cari tidak ditemukan!" << endl;
    }
    else
    {
        cout << "Huruf ditemukan pada indeks ke- " << result << endl;
    }
    return 0;
}