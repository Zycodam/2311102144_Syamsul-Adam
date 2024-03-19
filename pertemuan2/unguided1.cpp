#include <iostream>
using namespace std;

int main()
{
    // Deklarasi array
    int arr[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

    // Output Array
    cout << "Data Array: ";
    for (int i = 0; i < 10; i++)
    {
        cout << arr[i] << " ";
    }

    // Output angka genap
    cout << "\n\nNomor Genap: ";
    for (int i = 0; i < 10; i++)
    {
        if (arr[i] % 2 == 0)
        {
            cout << arr[i] << ", ";
        }
    }

    // Output angka ganjil
    cout << "\n\nNomor Ganjil: ";
    for (int i = 0; i < 10; i++)
    {
        if (arr[i] % 2 != 0)
        {
            cout << arr[i] << ", ";
        }
    }

    return 0;
}