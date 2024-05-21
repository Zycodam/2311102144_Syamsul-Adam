#include <iostream>
using namespace std;

int main()
{
   string kalimat_144;
   int count=0;
   cout << "======================================" << endl;
   cout << "====PROGRAM MENENTUKAN HURUF VOKAL====" << endl;
   cout << "======================================" << endl;
   cout << "Masukan Kalimat yang anda inginkan: "   ;
   cin  >> kalimat_144;

   for (int i=0; i<kalimat_144.length(); i++)
   {
       if(kalimat_144[i]=='a'|| kalimat_144[i]=='i'|| kalimat_144[i]=='u'|| kalimat_144[i]=='e'|| kalimat_144[i]=='o')
       {
             count++;
       }
   }
   cout << "Jumlah huruf vokal pada kalimat tersebut adalah : " << count;

}