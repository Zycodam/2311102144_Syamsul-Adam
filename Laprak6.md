# <h2 align="center">LAPORAN PRAKTIKUM</h2>
# <h2 align="center">ALGORITMA DAN PEMROGRAMAN 2</h2>
# <h2 align="center">MODUL 6</h2>
# <h2 align="center">REKURSIF</h2>
<p align="center">
    <img src="https://github.com/user-attachments/assets/3ccfed0b-72d1-4349-ac08-c4dce379c827" alt="Gambar">
</p>
 <h3  align="center" >Disusun Oleh : </h3>
<p align="center">Syamsul Adam - 2311102144</p>
<p align="center">IF-11-05</p>
 <h3 <p align="center" >Dosen Pengampu : </h3> </p>
 <p align="center">Arif Amrulloh, S.Kom., M.Kom.</p>

# <h3 align="center"> PROGRAM STUDI S1 TEKNIK INFORMATIKA </h3>
# <h3 align="center"> FAKULTAS INFORMATIKA </h3>
# <h3 align="center"> TELKOM UNIVERSITY PURWOKERTO </h3>
# <h3 align="center"> 2024 </h3>

## I. DASAR TEORI

### Pengantar Rekursif<br/>
Rekursif secara sederhana dapat diartikan sebagai metode penyelesaian masalah dengan cara menyelesaikan sub-masalah yang serupa dengan masalah utamanya. Sebagai
contoh, perhatikan prosedur cetak berikut!<br/>
![image](https://github.com/user-attachments/assets/ad6522dc-1fd2-451b-b74d-55f1945c6e12)<br/>
Jika diperhatikan, pada subprogram `cetak()` di atas, terlihat pada baris ke-4 terdapat pemanggilan kembali subprogram `cetak()`. Misalnya, jika kita menjalankan perintah `cetak(5)`, maka akan menghasilkan tampilan angka 5, 6, 7, 8, 9, dan seterusnya tanpa henti. Ini berarti setiap kali subprogram `cetak()` dipanggil, nilai x akan terus bertambah 1 (increment by one) tanpa henti.<br/>
![image](https://github.com/user-attachments/assets/ee5b2507-f3ba-464a-aac1-2bfba2df651c)<br/>
Oleh karena itu bisanya ditambahkan struktur kontrol percabangan (if-then) untuk menghentikan proses rekursif ini. Kondisi ini disebut juga dengan base-case, artinya apabila kondisi base-case bernilai true maka proses rekursif akan berhenti. Sebagai contoh misalnya base case adalah ketika x bernilai 10 atau x == 10, maka tidak perlu dilakukan rekursif.<br/>
![image](https://github.com/user-attachments/assets/a630d60e-9254-4f10-8359-3e048b1b8209)<br/>
Apabila diperhatikan pada baris ke-3 di Program di atas, kita telah menambahkan base-case seperti penjelasan sebelumnya. Selanjutnya pada bagian aksi else dari baris ke-6 dan ke-7 kita namakan recursive-case atau kasus pemanggilan dirinya sendiri tersebut terjadi. Kondisi dari recursive-case ini adalah negasi dari kondisi base-case atau ketika nilai x != 10.<br/>
![image](https://github.com/user-attachments/assets/1d56cf6f-d51e-4bc4-bad3-be86734048a0)<br/>
Apabila program di atas ini dijalankan maka akan tampil angka 5 6 7 8 9 10. Terlihat bahwa proses rekursif berhasil dihentikan ketika x == 10.<br/>
![image](https://github.com/user-attachments/assets/0d3fd753-4a9c-4ede-84a5-82b53bea7c06)<br/>
Pada Gambar 1 memperlihatkan saat subprogram dipanggil secara rekursif, maka subprogram akan terus melakukan pemanggilan (forward) hingga berhenti pada saat kondisi base-case terpenuhi atau true. Setelah itu akan terjadi proses backward atau kembali ke subprogram yang sebelumnya. Artinya setelah semua instruksi cetak(10) selesai di eksekusi, maka program akan kembali ke cetak(9) yang memanggil cetak(10) tersebut. Begitu seterusnya hingga kembali ke cetak(5).
Perhatikan modifikasi program di atas dengan menukar posisi baris 10 dan 11, mengakibatkan ketika program dijalankan maka akan menampilkan 10 9 8 7 6 5. Kenapa bisa demikian? Pahami proses backward pada Gambar 1<br/>
![image](https://github.com/user-attachments/assets/56caeef3-fd55-4ca1-af98-759f49a5b495)<br/>
Catatan:<br/>
1. Teknik rekursif ini merupakan salah satu alternatif untuk mengganti struktur kontrol perulangan dengan memanfaatkan subprogram (bisa fungsi ataupun prosedur).
2. Untuk menghentikan proses rekursif digunakan percabangan (if-then).
3. Base-case adalah kondisi proses rekursif berhenti. Base-case merupakan hal terpenting dan pertama yang harus diketahui ketika akan membuat program rekursif. Mustahil membuat program rekursif tanpa mengetahui base-case terlebih dahulu.
4. Recursive-case adalah kondisi dimana proses pemanggilan dirinya sendiri dilakukan. Kondisi recursive-case adalah komplemen atau negasi dari base-case.
5. Setiap algoritma rekursif selalu memiliki padanan dalam bentuk algoritma iteratif.

### Komponen Rekursif
Algoritma rekursif terdiri dari dua komponen utama:
1. Bae-case (Basis), yaitu bagian untuk menghentikan proses rekursif dan menjadi komponen terpenting di dalam sebuah rekursif.
2. Recursive-case, yaitu bagian pemanggilan subprogramnya

### Contoh Program dengan menggunakan Rekursif
1. Membuat baris bilangan dari n hingga 1
   Base-case: bilangan == 1<br/>
   ![image](https://github.com/user-attachments/assets/e0b66fdd-e2d6-4973-ab56-7010e254c8f5)
2. Menghitung hasil penjumlahan 1 hingga n
   Base-case: n == 1
   ![image](https://github.com/user-attachments/assets/5f1520b0-8a51-41d2-ab85-67e5d54735e7)
3. Mencari dua pangkat n atau 2^n
   Base-case: n == 0
   ![image](https://github.com/user-attachments/assets/8dd3cd40-a81c-4525-ab45-a94c359cad46)
4. Mencari nilai faktorial atau n!
   Base-case: n == 0 atau n == 1
   ![image](https://github.com/user-attachments/assets/ced93f94-7bff-46f3-837b-47a501be16de)

## II. GUIDED

### 1. Contoh Program Rekursif Menampilkan Deret Angka Menurun

```go
package main

import "fmt"

func main() {
	var n int
	fmt.Scan(&n)
	baris(n)
}

func baris(bilangan int) {
	if bilangan == 1 {
		fmt.Println(1)
	} else {
		fmt.Println(bilangan)
		baris(bilangan - 1)
	}
}
```
## Output: ![Screenshot 2024-11-03 195751](https://github.com/user-attachments/assets/4d68e995-df07-4e58-b308-f997a55e3cc5)


Program ini meminta pengguna untuk memasukkan sebuah angka dan kemudian mencetak angka itu dan semua angka sebelumnya dalam urutan menurun. Program tersebut mengimplementasikan fungsi rekursif "baris()" yang memanggil dirinya sendiri dengan angka yang lebih kecil.
### 2. Program Rekursif untuk Menghitung Penjumlahan Bilangan dari 1 hingga n

```go
package main

import "fmt"

func penjumlahan(n int) int {
	if n == 1 {
		return 1
	} else {
		return n + penjumlahan(n-1)
	}
}
func main() {
	var n int
	fmt.Scan(&n)
	fmt.Println(penjumlahan(n))
}
```
## Output: ![Screenshot 2024-11-03 195825](https://github.com/user-attachments/assets/b6820330-0aed-4895-9295-9bd699a5377b)


Program ini menerima masukan berupa bilangan bulat dan menggunakan fungsi rekursif untuk menghitung penjumlahan dari 1 hingga bilangan yang dimasukkan. Fungsi penjumlahan memeriksa apakah bilangan yang dimasukkan sama dengan 1. Jika iya, maka fungsi tersebut mengembalikan nilai 1. Jika tidak, maka fungsi tersebut mengembalikan nilai bilangan yang dimasukkan ditambah dengan hasil fungsi penjumlahan dengan parameter bilangan dikurangi 1. Program ini kemudian mencetak hasil penjumlahan dari 1 hingga bilangan yang dimasukkan.
### 3. Program Rekursif untuk Menghitung 2 Pangkat n

```go
package main

import "fmt"

func pangkat(n int) int {
	if n == 0 {
		return 1
	} else {
		return 2 * pangkat(n-1)
	}
}
func main() {
	var n int
	fmt.Print("MasukKan nilai n: ")
	fmt.Scan(&n)
	fmt.Println("Hasil dari 2 pangkat", n, "adalah:", pangkat(n))
}
```
## Output: ![Screenshot 2024-11-03 195858](https://github.com/user-attachments/assets/edbae5a8-f73c-4c0b-b3df-4ccf686e5c31)


Program ini menghitung hasil pangkat dari 2 dengan input n menggunakan rekursi, di mana function pangkat() mengembalikan 2 * pangkat(n-1) jika n lebih besar dari 0, atau 1 jika n sama dengan 0.
### 4. Program Rekursif untuk Menghitung Faktorial dari Bilangan n

```go
package main

import "fmt"

var n int

func faktorial(n int) int {
	if n == 0 || n == 1 {
		return 1
	} else {
		return n * faktorial(n-1)
	}
}
func main() {
	fmt.Scan(&n)
	fmt.Println(faktorial(n))
}
```
## Output: ![Screenshot 2024-11-03 200015](https://github.com/user-attachments/assets/f60a18c7-c42e-4da5-a560-8df808db551e)


Program ini menghitung faktorial dari bilangan bulat yang diberikan. Program ini menggunakan rekursi untuk menghitung faktorial dari bilangan bulat. Fungsi faktorial mengambil bilangan bulat sebagai masukan dan mengembalikan faktorial dari bilangan bulat tersebut.
Jika bilangan bulat adalah 0 atau 1, fungsi mengembalikan 1. 
Jika tidak, fungsi mengembalikan bilangan bulat dikalikan dengan faktorial dari bilangan bulat tersebut dikurangi 1. Program ini dimulai dengan meminta pengguna untuk memasukkan bilangan bulat. Kemudian program menghitung faktorial dari bilangan bulat tersebut menggunakan fungsi faktorial dan menampilkan hasil ke layar.
## III. UNGUIDED

### 1. Deret Fibonacci adalah sebuah deret dengan nilai suku ke-0 dan ke-1 adalah 0 dan 1, dan nilai suku ke-n selanjutnya adalah hasil penjumlahan dua suku sebelumnya. Secara umum dapat diformulasikan Sn = Sn-1 + Sn-2. Berikut ini adalah contoh nilai deret Fibonacci hingga suku ke-10. Buatlah program yang mengimplementasikan fungsi rekursif pada deret Fibonacci tersebut.<br/>
![image](https://github.com/user-attachments/assets/ae90637e-9f70-43a6-bdca-2440363043a7)

```go
package main

import (
	"fmt"
	"strconv"
)

func fibonacci(n int) int {
	if n <= 1 {
		return n
	} else {
		return fibonacci(n-1) + fibonacci(n-2)
	}
}

func main() {
	var inp int
	var a, b144 string
	fmt.Scan(&inp)
	for i := 0; i <= inp; i++ {
		a += "\t" + strconv.Itoa(i)
		b144 += "\t" + strconv.Itoa(fibonacci(i))
	}
	fmt.Printf("n: %s \nSn: %s \n", a, b144)
}
```
## Output: ![Screenshot 2024-11-03 200057](https://github.com/user-attachments/assets/9c90f491-d9aa-4386-9a03-514445b16d80)



Program ini mencari nilai dari deret fibonacci untuk sejumlah n angka dengan menggunakan fungsi rekursif. Program mengambil masukan integer n, dan mencetak nilai n dan deret fibonacci untuk angka sampai n. Fungsi rekursif fibonacci() berfungsi dengan pengecekan:
Jika n lebih kecil dari atau sama dengan 1, fungsi akan mengembalikan n
Jika tidak, fungsi akan mengembalikan nilai dari fungsi fibonacci(n-1) dan fibonacci(n-2). Secara sederhana, program ini menunjukkan konsep rekursi dalam deret fibonacci.
### 2. Buatlah sebuah program yang digunakan untuk menampilkan pola bintang berikut ini dengan menggunakan fungsi rekursif. N adalah masukan dari user.

```go
package main

import "fmt"

func printStars(n int) {
	if n == 0 {
		return
	}
	printStars(n - 1)
	for i := 0; i < n; i++ {
		fmt.Print("*")
	}
	fmt.Println()
}

func main() {
	var a144 int
	fmt.Print("Masukkan N: ")
	fmt.Scanln(&a144)
	printStars(a144)

	
}

```
## Output: ![Screenshot 2024-11-03 200135](https://github.com/user-attachments/assets/ff59390e-5508-4bd9-bebc-8166095f68f0)



Program ini menerima input integer N dan mencetak segitiga bintang dengan N baris, di mana setiap baris memiliki jumlah bintang yang sama dengan nomor baris. Program ini menggunakan fungsi rekursif printStars untuk mencetak bintang, dengan panggil rekursif dan loop untuk mencetak bintang pada setiap baris.
### 3. Buatlah program yang mengimplementasikan rekursif untuk menampilkan faktor bilangan dari suatu N, atau bilangan yang apa saja yang habis membagi N.<br/> Masukan terdiri dari sebuah bilangan bulat positif N. <br/> Keluaran terdiri dari barisan bilangan yang menjadi faktor dari N (terurut dari 1 hingga N ya).

```go
package main

import "fmt"

func main() {
	fmt.Println("Masukkan bilangan: ")
	var a144 int
	fmt.Scanln(&a144)

	fmt.Printf("Keluaran dari %d adalah: ", a144)
	faktor(a144, 1)
}

func faktor(a144, i int) {
	if i > a144 {
		return
	}

	if a144%i == 0 {
		fmt.Printf("%d ", i)
	}

	faktor(a144, i+1)
}

```
## Output: ![Screenshot 2024-11-03 200218](https://github.com/user-attachments/assets/f30a1be1-0eee-464c-959a-a4af9e9ca81b)



Program ini dirancang untuk menghitung pangkat dari dua bilangan bulat yang diberikan menggunakan rekursi. Fungsi rekursif melakukan operasi pangkat secara berulang dengan mengalikan bilangan dasar dengan dirinya sendiri sebanyak pangkat yang ditentukan. Fungsi tersebut berhenti saat pangkat mencapai nol.
### 4. Buatlah program yang mengimplementasikan rekursif untuk menampilkan barisan bilangan tertentu.<br/> Masukan terdiri dari sebuah bilangan bulat positif N.<br/>Keluaran terdiri dari barisan bilangan dari N hingga 1 dan kembali ke N.

```go
package main

import "fmt"

func main() {
	var a144 int
	fmt.Print("Masukkan bilangan: ")
	fmt.Scanln(&a144)

	fmt.Println("Keluaran:", sequence(a144))
}

func sequence(a144 int) string {
	if a144 == 1 {
		return "1"
	} else {
		return fmt.Sprintf("%d %s %d", a144, sequence(a144-1), a144)
	}
}
```
## Output: ![Screenshot 2024-11-03 201158](https://github.com/user-attachments/assets/8d34438b-d64a-4807-8037-4ee2f353d487)



Program ini menerima input bilangan bulat dan menghasilkan output berupa urutan bilangan yang dimulai dari 1 hingga bilangan input, dipisahkan dengan spasi, dan diulang dua kali. Program ini menggunakan fungsi rekursif sequence untuk menghasilkan output.
### 5. Buatlah program yang mengimplementasikan rekursif untuk menampilkan barisan bilangan ganjil.<br/> Masukan terdiri dari sebuah bilangan bulat positif N.<br/>Keluaran terdiri dari barisan bilangan ganjil dari 1 hingga N.

```go
package main

import "fmt"

func main() {
	var a144 int
	fmt.Print("Masukkan bilangan: ")
	fmt.Scanln(&a144)

	fmt.Println("Keluaran:", ganjil(a144))
}

func ganjil(a144 int) []int {
	if a144 <= 0 {
		return nil
	}
	
	list := ganjil(a144 - 1)
	if a144%2 != 0 {
		list = append(list, a144)
	}
	return list
}
```

## Output: 
![Screenshot 2024-11-03 201558](https://github.com/user-attachments/assets/27676c6c-217a-4b0c-b450-857d489f11f5)



Program ini mencari angka ganjil dari suatu bilangan. Program ini menerima input berupa bilangan bulat dan mengembalikan list dari angka ganjil dari bilangan tersebut. Program ini menggunakan metode rekursif untuk memproses input.
### 6. Buatlah program yang mengimplementasikan rekursif untuk mencari hasil pangkat dari dua buah bilangan.<br/>Masukan terdiri dari bilangan bulat x dan y.<br/>Keluaran terdiri dari hasil x dipangkatkan y.<br/>Catatan: diperbolehkan menggunakan asterik , tapi dilarang menggunakan import "math".

```go
package main
import "fmt"

func power(x, y int) int {
	if y == 0 {
		return 1
	}
	return x * power(x, y-1)
}

func main() {
	var x, y int
	fmt.Print("Masukkan x dan y: ")
	fmt.Scan(&x, &y)

	result := power(x, y)
	fmt.Printf("Hasil dari %d^%d adalah %d\n", x, y, result)
}

```
## Output: ![Screenshot 2024-11-03 200328](https://github.com/user-attachments/assets/f74b81fb-a411-440f-89d3-26ea2ea3396e)



Program ini menghitung pangkat bilangan bulat menggunakan rekursi. Program ini akan meminta pengguna untuk memasukkan dua bilangan bulat dan mencetak hasil perhitungan pangkatnya.
### KESIMPULAN
Rekursif adalah program yang mengimplementasikan konsep rekursif untuk mencari hasil pangkat dari dua buah bilangan, di mana input terdiri dari dua buah bilangan integer x dan y. Program ini memanfaatkan fungsi rekursif yang memanggil dirinya sendiri dengan parameter yang diubah, sampai mencapai base case, yaitu saat y = 0. Program ini dilarang menggunakan library math dan menggunakan operator "*" untuk menghitung pangkat, sehingga dapat menjadi contoh yang baik untuk memahami konsep rekursif dalam pemrograman.
### REFERENSI
[1] Modul Praktikum Algoritma dan Pemrograman 2 (Rekursif)<br/>
