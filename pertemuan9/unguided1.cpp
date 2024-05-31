#include <iostream> 
#include <iomanip> 
#include <vector> 
#include <string> 
using namespace std; 

int main() 
{ 
    int syamsul_2311102144; 
    cout << "Silahkan masukkan jumlah simpul: "; 
    cin >> syamsul_2311102144; 
    vector<string> simpul(syamsul_2311102144); 
    vector<vector<int>> busur(syamsul_2311102144, 
    vector<int>(syamsul_2311102144, 0)); 
    
    cout << "Silahkan masukkan nama simpul " << endl; 
    
    for (int i = 0; i < syamsul_2311102144; i++) { 
        cout << "Simpul ke-" << (i + 1) << ": "; 
        cin >> simpul[i]; 
        } 
        cout << "Silahkan masukkan bobot antar simpul" << endl; 
    
    for (int i = 0; i < syamsul_2311102144; i++) { 
        
        for (int j = 0; j < syamsul_2311102144; j++) 
        { 
            cout << simpul[i] << " --> " << simpul[j] << " = "; 
            cin >> busur[i][j];
             }
        } 
             cout << endl; 
             cout << setw(7) << " "; 
             for (int i = 0; i < syamsul_2311102144; i++) {

                cout << setw(8) << simpul[i]; 
            } 
                cout << endl; 
                
                for (int i = 0; i < syamsul_2311102144; i++) 
                { 
                    cout << setw(7) << simpul[i]; 
                    
                    for (int j = 0; j < syamsul_2311102144; j++) 
                    
                {
                    cout << setw(8) << busur[i][j];
                } 
                cout << endl; 
            } 
        }