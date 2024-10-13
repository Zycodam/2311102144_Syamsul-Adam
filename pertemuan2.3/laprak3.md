# <h2 align="center">LAPORAN PRAKTIKUM</h2>
# <h2 align="center">ALGORITMA DAN PEMROGRAMAN 2</h2>
# <h2 align="center">MODUL 3</h2>
# <h2 align="center"> FUNGSI</h2>
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
I. Fungsi adalah kumpulan blok kode yang diberi nama untuk mempermudah penggunaannya. Dengan menerapkan fungsi dengan baik, kode menjadi lebih modular dan mengikuti prinsip DRY (Don't Repeat Yourself). Artinya, kita tidak perlu menulis ulang kode yang sama berkali-kali, cukup mendefinisikan fungsi tersebut sekali, lalu memanggilnya saat diperlukan.
Suatu subprogram dikatakan fungsi apabila:

1. Ada deklarasi tipe nilai yang dikembalikan.
2. Terdapat kata kunci return dalam badan subprogram.
Maka fungsi digunakan jika suatu nilai biasanya diperlukan, seperti:
-Assignment nilai ke suatu variabel.
-Bagian dari ekspresi
-Bagian dari argumen suatu subprogram, dsb.
II. Deklasari Function


Pada bagian deklarasi fungsi, setelah parameter, terdapat tipe data dari nilai yang dikembalikan. Sedangkan pada bagian badan fungsi, terdapat kata kunci return diikuti dengan nilai yang akan dikembalikan. Berikut adalah contoh fungsi untuk menghitung volume tabung apabila jari-jari alas dan tinggi tabung diketahui:


III. Contoh Program dengan Function
``` go
package main

import "fmt"
import "strings"

func main() {
    var names = []string{"Amanda", "Windhu"}
    printMessage("halo", names)
}

func printMessage(message string, arr []string) {
    var nameString = strings.Join(arr, " ")
    fmt.Println(message, nameString)
}
```
Pada kode di atas, sebuah fungsi baru dibuat dengan nama printMessage() memiliki 2 buah parameter yaitu string message dan slice string arr.

Fungsi tersebut dipanggil dalam main(), dalam pemanggilannya disisipkan dua buah argument parameter.
Argument parameter pertama adalah string "halo" yang ditampung parameter message
Argument parameter ke-2 adalah slice string names yang nilainya ditampung oleh parameter arr.
Di dalam printMessage(), nilai arr yang merupakan slice string digabungkan menjadi sebuah string dengan pembatas adalah karakter spasi. Penggabungan slice dapat dilakukan dengan memanfaatkan fungsi strings.Join() (berada di dalam package strings).

### II. GUIDED

### 1. Contoh Program dengan Function

``` go
package main

import "fmt"

func main() {
	var a, b int

	fmt.Scan(&a, &b)
	if a >= b {
		fmt.Println(permutasi(a, b))
	} else {
		fmt.Println(permutasi(b, a))
	}
}
func faktorial(n int) int {
	var hasil int = 1
	var i int
	for i = 1; i <= n; i++ {
		hasil = hasil * i
	}
	return hasil
}
func permutasi(n, r int) int {
	return faktorial(n) / faktorial(n-r)
}
```
## Output: 

Program ini adalah program yang menghitung nilai permutasi dari dua bilangan bulat yang diinput oleh pengguna. Program ini menggunakan fungsi rekursif untuk menghitung nilai faktorial dan kemudian menghitung nilai permutasi menggunakan rumus permutasi. Hasil permutasi kemudian dicetak ke output.

## 2.  Menghitung Luas dan Keliling Persegi

```go
package main

import "fmt"

// Fungsi untuk menghitung luas persegi
func hitungLuas(sisi float64) float64 {
    return sisi * sisi
}

// Fungsi untuk menghitung keliling persegi
func hitungKeliling(sisi float64) float64 {
    return 4 * sisi
}

func main() {
    var sisi float64

    fmt.Print("Masukkan panjang sisi persegi: ")
    fmt.Scan(&sisi)

    luas := hitungLuas(sisi)
    keliling := hitungKeliling(sisi)

    fmt.Printf("Luas persegi: %.2f\n", luas)
    fmt.Printf("Keliling persegi: %.2f\n", keliling)
}
```
### Output: 


Program ini adalah program yang menghitung luas dan keliling persegi berdasarkan panjang sisi yang diinput oleh pengguna. Program ini menggunakan dua fungsi, hitungLuas dan hitungKeliling, untuk menghitung nilai luas dan keliling persegi, kemudian mencetak hasilnya ke output.


### UNGUIDED ###

### 1. Minggu ini, mahasiswa Fakultas Informatika mendapatkan tugas dari mata kuliah matematika diskrit untuk mempelajari kombinasi dan permutasi. Jonas, salah seorang mahasiswa, iseng untuk mengimplementasikannya ke dalam suatu program. Oleh karena itu bersediakah kalian membantu Jonas? (tidak tentunya ya :p) Masukan terdiri dari empat buah bilangan asli a, b, c, dan d yang dipisahkan oleh spasi, dengan syarat a ≥ c dan b ≥ d. Keluaran terdiri dari dua baris. Baris pertama adalah hasil permutasi dan kombinasi a terhadap c, sedangkan baris kedua adalah hasil permutasi dan kombinasi b terhadap d. Catatan: permutasi (P) dan kombinasi (C) dari n terhadap r (n ≥ r) dapat dihitung dengan menggunakan persamaan berikut!

```go
package main

import (
	"fmt"
)

// Fungsi untuk menghitung faktorial
func factorial(x int) int {
	if x == 0 {
		return 1
	}
	result := 1
	for i := 1; i <= x; i++ {
		result *= i
	}
	return result
}

// Fungsi untuk menghitung permutasi
func permutation(y, z int) int {
	return factorial(y) / factorial(y-z)
}

// Fungsi untuk menghitung kombinasi
func combination(w, v int) int {
	return factorial(w) / (factorial(v) * factorial(w-v))
}

func main() {
	// Input empat bilangan: e, f, g, h
	var e, f, g, h int
	fmt.Print("Masukkan 4 bilangan: ")
	fmt.Scan(&e, &f, &g, &h)

	// Baris pertama: permutasi dan kombinasi e terhadap g
	p1 := permutation(e, g)
	c1 := combination(e, g)
	fmt.Printf("%d %d\n", p1, c1)

	// Baris kedua: permutasi dan kombinasi f terhadap h
	p2 := permutation(f, h)
	c2 := combination(f, h)
	fmt.Printf("%d %d\n", p2, c2)
}

```
### Output: 


Program Go ini menghitung dan menampilkan permutasi dan kombinasi dua set angka. Program ini mengambil empat masukan bilangan bulat dari pengguna dan menghitung permutasi dan kombinasi dua angka pertama terhadap dua angka terakhir. Hasilnya kemudian dicetak ke konsol.

Fitur Utama:

Menghitung faktorial, permutasi, dan kombinasi angka input
Mengambil empat input integer dari pengguna
Menghitung permutasi dan kombinasi dua set angka
Mencetak hasil ke konsol

### 2. Diberikan tiga buah fungsi matematika yaitu f(x) = x², g(x) = x - 2 dan h(x) = x + 1. Fungsi komposisi (fogoh)(x) artinya adalah f(g(h(x))). Tuliskan f(x), g(x) dan h(x) dalam bentuk function. Masukan terdiri dari sebuah bilangan bulat a, b dan c yang dipisahkan oleh spasi. Keluaran terdiri dari tiga baris. Baris pertama adalah (fogoh)(a), baris kedua (gohof)(b), dan baris ketiga adalah (hofog)(c)! Contoh



```go
package main

import (
	"fmt"
)

func f(x int) int {
	return x * x
}

func g(x int) int {
	return x - 2
}

func h(x int) int {
	return x + 1
}

func fogoh(x int) int {
	return f(g(h(x)))
}

func gohof(x int) int {
	return g(h(f(x)))
}

func hofog(x int) int {
	return h(f(g(x)))
}

func main() {
	var a, b, c int
	fmt.Scan(&a, &b, &c)

	fmt.Println(fogoh(a))
	fmt.Println(gohof(b))
	fmt.Println(hofog(c))
}
```
## Output:



Program ini adalah program Go yang mengimplementasikan tiga fungsi matematika f(x) = x², g(x) = x - 2, dan h(x) = x + 1, serta tiga fungsi komposisi (fogoh)(x), (gohof)(x), dan (hofog)(x). Program ini membaca tiga bilangan bulat a, b, dan c sebagai input dan kemudian mencetak hasil dari masing-masing fungsi komposisi ke output.

Berikut adalah ringkasan dari program ini:

Membaca tiga bilangan bulat a, b, dan c sebagai input
Menghitung hasil dari tiga fungsi komposisi (fogoh)(a), (gohof)(b), dan (hofog)(c)
Mencetak hasil ke output dalam tiga baris


### 3. Fungsi untuk menghitung jarak titik (a, b) dan (c, d) dimana rumus jarak adalah: jarak = √(a - c)² + (b - d)² dan juga fungsi untuk menentukan posisi sebuah titik sembarang berada di dalam suatu lingkaran atau tidak.

```go
package main

import (
	"fmt"
	"math"
)

// Fungsi untuk menghitung jarak antara dua titik (a, b) dan (c, d)
func jarak(a, b, c, d float64) float64 {
	return math.Sqrt(math.Pow(a-c, 2) + math.Pow(b-d, 2))
}

// Fungsi untuk menentukan apakah titik (x, y) berada di dalam lingkaran dengan pusat (cx, cy) dan radius r
func didalam(cx, cy, r, x, y float64) bool {
	return jarak(cx, cy, x, y) <= r
}

// Fungsi untuk mengecek posisi titik terhadap dua lingkaran
func checkPosition(cx1, cy1, r1, cx2, cy2, r2, x, y float64) string {
	inCircle1 := didalam(cx1, cy1, r1, x, y)
	inCircle2 := didalam(cx2, cy2, r2, x, y)

	if inCircle1 && inCircle2 {
		return "Titik di dalam lingkaran 1 dan 2"
	} else if inCircle1 {
		return "Titik di dalam lingkaran 1"
	} else if inCircle2 {
		return "Titik di dalam lingkaran 2"
	} else {
		return "Titik di luar lingkaran 1 dan 2"
	}
}

func main() {
	var cx1, cy1, r1, cx2, cy2, r2, x, y float64

	// Masukkan data sesuai dengan format yang diberikan
	fmt.Println("Masukkan koordinat pusat dan radius lingkaran 1:")
	fmt.Scan(&cx1, &cy1, &r1)

	// Validasi input radius
	for r1 < 0 {
		fmt.Println("Radius tidak boleh negatif. Silakan masukkan nilai yang valid.")
		fmt.Scan(&r1)
	}

	fmt.Println("Masukkan koordinat pusat dan radius lingkaran 2:")
	fmt.Scan(&cx2, &cy2, &r2)

	// Validasi input radius
	for r2 < 0 {
		fmt.Println("Radius tidak boleh negatif. Silakan masukkan nilai yang valid.")
		fmt.Scan(&r2)
	}

	fmt.Println("Masukkan koordinat titik sembarang:")
	fmt.Scan(&x, &y)

	// Cek posisi titik sembarang
	result := checkPosition(cx1, cy1, r1, cx2, cy2, r2, x, y)
	fmt.Println(result)
}
```
### Output: 

Program ini menghitung posisi titik sembarang terhadap dua lingkaran.

Berikut adalah langkah-langkah program:

Deklarasi variabel: Program mendeklarasikan variabel-variabel yang dibutuhkan untuk menyimpan koordinat pusat, jari-jari, dan koordinat titik sembarang.
Input Data: Program meminta pengguna untuk memasukkan data:
Koordinat pusat dan jari-jari lingkaran pertama.
Koordinat pusat dan jari-jari lingkaran kedua.
Koordinat titik sembarang.
Validasi input: Program memvalidasi input radius agar tidak negatif.
Hitung jarak: Fungsi jarak() menghitung jarak antara dua titik dengan menggunakan rumus Pythagoras.
Tentukan apakah titik di dalam lingkaran: Fungsi didalam() menentukan apakah titik berada di dalam lingkaran dengan membandingkan jarak titik ke pusat lingkaran dengan jari-jari lingkaran.
Cek posisi titik: Fungsi checkPosition() mengecek posisi titik terhadap dua lingkaran berdasarkan hasil dari didalam():
Jika titik di dalam kedua lingkaran, outputnya adalah "Titik di dalam lingkaran 1 dan 2".
Jika titik di dalam lingkaran 1, outputnya adalah "Titik di dalam lingkaran 1".
Jika titik di dalam lingkaran 2, outputnya adalah "Titik di dalam lingkaran 2".
Jika tidak ada, outputnya adalah "Titik di luar lingkaran 1 dan 2".
Cetak hasil: Program mencetak hasil dari checkPosition().
Contoh penggunaan:

Jika pengguna memasukkan data berikut:

Lingkaran 1: Pusat (1, 2), Jari-jari 3
Lingkaran 2: Pusat (5, 6), Jari-jari 2
Titik: (3, 4)
Maka program akan mencetak: "Titik di dalam lingkaran 1".


## Output:
Program ini bertujuan untuk menerima masukan bilangan bulat dari pengguna, mencari faktor-faktor dari bilangan tersebut, dan menentukan apakah bilangan bulat tersebut merupakan bilangan prima.Program ini efektif dalam menghitung faktor dari suatu bilangan bulat positif dan menentukan apakah bilangan tersebut adalah bilangan prima. Dengan validasi input yang tepat dan penggunaan struktur kontrol yang sederhana, program ini memberikan informasi yang jelas kepada pengguna tentang bilangan yang dimasukkan.

### KESIMPULAN
Fungsi dalam Golang adalah elemen penting yang mendukung struktur dan modularitas kode. Dengan memahami cara mendefinisikan dan memanggil fungsi, serta penerapan goroutines, pengembang dapat menciptakan aplikasi yang efisien, skala besar, dan mudah dikelola. Golang menawarkan sintaks yang sederhana namun kuat, sehingga memudahkan pengembang dalam menulis kode berkualitas tinggi.

### REFERENSI
[1] https://www.staditek.id/insight/golang-adalah/
