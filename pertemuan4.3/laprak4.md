# <h2 align="center">LAPORAN PRAKTIKUM</h2>
# <h2 align="center">ALGORITMA DAN PEMROGRAMAN 2</h2>
# <h2 align="center">MODUL 4</h2>
# <h2 align="center"> PROSEDUR </h2>
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
Definisi Prosedur
Prosedur adalah serangkaian instruksi yang dipecah dari program yang lebih besar untuk mengurangi kompleksitas kode. Ketika prosedur dipanggil dalam program utama, ia akan memberikan efek langsung pada jalannya program. Suatu subprogram disebut sebagai prosedur jika:

Tidak memiliki deklarasi tipe nilai yang dikembalikan, dan
Tidak menggunakan kata kunci return dalam isinya.
Prosedur mirip dengan instruksi dasar seperti penugasan (assignment) atau instruksi dari paket seperti fmt.Scan atau fmt.Print. Oleh karena itu, nama prosedur sebaiknya menggunakan kata kerja atau sesuatu yang menggambarkan suatu tindakan, misalnya cetak, hitungRerata, cariNilai, belok, mulai, dll.

Deklarasi Prosedur

### >br/> Penulisan deklarasi ini berada di luar blok yang dari program utama atau fungsi main() pada suatu program C, dan bisa ditulis sebelum atau setelah dari blok program utama tersebut.
Contoh deklarasi prosedur mencetak n nilai pertama dari deret Fibonacci


Cara Pemanggilan Prosedur
Seperti yang telah dijelaskan, prosedur hanya akan dijalankan jika dipanggil, baik secara langsung maupun tidak langsung oleh program utama. Pemanggilan tidak langsung berarti prosedur tersebut dipanggil melalui subprogram lain sebagai perantara.
Cara memanggil prosedur cukup sederhana, yaitu dengan menuliskan nama prosedur dan menyertakan parameter atau argumen yang diperlukan. Misalnya, prosedur cetakNFibo dipanggil dengan menuliskan namanya dan memberikan sebuah variabel atau nilai integer tertentu sebagai argumen untuk parameter n.
Contohnya:



Contoh Program dengan Prosedur
Berikut ini adalah contoh penulisan prosedur pada suatu program lengkap. Buatlah sebuah program beserta prosedur yang digunakan untuk menampilkan suatu pesan error, warning atau informasi berdasarkan masukan dari user.
Masukan: terdiri dari sebuah bilangan bulat flag (0 s.d. 2) dan sebuah string M.
Keluaran: berupa string pesan M beserta jenis pesannya, yaitu error, warning atau informasi berdasarkan nilai flag 0, 1 dan 2 secara berturut-turut. 

Penulisan argumen pada parameter cetakPesan(pesan, bilangan) harus sesuai tipe data pada func cetakPesan (M string, flag int), yaitu string kemudian integer.

Parameter
Subprogram yang dipanggil dapat berinteraksi dengan pemanggilnya melalui argumen yang diberikan ke parameter yang dideklarasikan dalam subprogram. Terdapat dua jenis parameter berdasarkan posisinya dalam program, yaitu parameter formal dan parameter aktual.

Parameter Fromal
Parameter formal adalah parameter yang ditulis pada saat deklarasi suatu subprogram, parameter ini berfungsi sebagai petunjuk bahwa argumen apa saja yang diperlukan pada saat pemanggilan subprogram. Sebagai contoh parameter jari_jari, tinggi pada deklarasi fungsi volumeTabung adalah parameter formal (teks berwarna merah). Artinya ketika memanggil volumeTabung maka kita harus mempersiapkan dua integer (berapapun nilainya) sebagai jari_jari dan tinggi.
Parameter Aktual
Sedangkan parameter aktual adalah argumen yang digunakan pada bagian parameter saat pemanggilan suatu subprogram. Banyaknya argumen dan tipe data yang terdapat pada parameter aktual harus mengikuti parameter formal. Sebagai contoh argumen r, t, 15, 14 dan 100 pada contoh kode di atas (teks berwarna biru) adalah parameter aktual, yang menyatakan nilai yang kita berikan sebagai jari-jari dan tinggi.
Selain itu, parameter juga diklasifikasikan berdasarkan cara alokasi memorinya, yaitu pass by value dan pass by reference.
Pass by Value
Pada pass by value, nilai dari parameter aktual disalin ke variabel lokal (parameter formal) dalam subprogram. Ini berarti parameter aktual dan formal memiliki alamat memori yang berbeda. Subprogram dapat menggunakan nilai pada parameter formal untuk berbagai proses, namun tidak dapat mengembalikan informasi tersebut ke pemanggil melalui parameter aktual, karena pemanggil tidak memiliki akses ke memori subprogram. Pass by value dapat diterapkan baik pada fungsi maupun prosedur. Dalam notasi pseudocode, semua parameter formal pada fungsi secara default menggunakan pass by value, sedangkan pada prosedur menggunakan kata kunci "in" saat mendeklarasikan parameter formal. Di bahasa pemrograman Go, sama seperti pada pseudocode fungsi, tidak ada kata kunci khusus untuk parameter formal pada fungsi dan prosedur.
Pass by Reference (Pointer)
Pada pass by reference, parameter formal bertindak sebagai pointer yang menyimpan alamat memori dari parameter aktual. Hal ini berarti perubahan yang terjadi pada parameter formal akan berdampak langsung pada parameter aktual. Setelah subprogram selesai dijalankan, nilai akhir dari parameter tersebut dapat diakses oleh pemanggil. Pass by reference lebih cocok digunakan pada prosedur. Dalam pseudocode, parameter pass by reference pada prosedur ditulis dengan kata kunci "in/out", sedangkan di bahasa Go menggunakan simbol asterik (*) sebelum tipe data pada parameter formal.
Catatan: Sebaiknya parameter pada fungsi menggunakan pass by value, karena fungsi dapat mengembalikan nilai ke pemanggil tanpa memberikan dampak langsung pada program. Meskipun demikian, pass by reference juga dapat digunakan jika diperlukan. Sementara itu, pass by reference lebih ideal digunakan pada prosedur, karena prosedur tidak dapat mengembalikan nilai secara langsung. Dengan pass by reference, prosedur dapat seolah-olah mengirimkan nilai ke pemanggil.

### II. GUIDED

### 1. Contoh Program dengan prosedur

``` go
package main

import "fmt"

func main() {
	var angka1, angka2 int
	fmt.Scan(&angka1, &angka2) // Membaca input dari pengguna untuk dua nilai integer angka1 dan angka2
	if angka1 >= angka2 { 
		// Jika angka1 lebih besar atau sama dengan angka2, panggil prosedur permutasi dengan parameter (angka1, angka2)
		hitungPermutasi(angka1, angka2)
	} else { 
		// Jika angka2 lebih besar dari angka1, panggil prosedur permutasi dengan parameter (angka2, angka1)
		hitungPermutasi(angka2, angka1)
	}
}

func hitungFaktorial(n int) int {
	var hasil int = 1
	// Loop untuk menghitung faktorial dari n
	for i := 1; i <= n; i++ {
		hasil *= i // Mengalikan hasil dengan nilai i pada setiap iterasi
	}
	return hasil // Mengembalikan hasil faktorial
}

func hitungPermutasi(n, r int) {
	// Menghitung permutasi nPr dan langsung mencetak hasilnya
	hasil := hitungFaktorial(n) / hitungFaktorial(n-r)
	fmt.Println(hasil) // Mencetak hasil permutasi
}
```
## Output: 



Program ini akan mencari pemenang dari kompetisi pemrograman tingkat nasional. Setiap peserta harus menyelesaikan 8 soal dalam waktu 5 jam. Pemenangnya adalah peserta yang berhasil menyelesaikan paling banyak soal dalam waktu paling singkat. Untuk membuat program modular, prosedur hitung skor harus digunakan. Prosedur ini akan menerima nama peserta, jumlah soal yang diselesaikan, dan skor yang diperoleh sebagai input. Kemudian prosedur ini akan mengembalikan jumlah total soal dan skor yang dikerjakan oleh peserta.
Program utama membaca nama peserta, sedangkan prosedur hitung skor membaca waktu pengerjaan. Jumlah soal yang diselesaikan, nama pemenang, dan jumlah waktu yang dibutuhkan untuk menyelesaikan setiap soal diberikan oleh program ini.

## 2.  Menghitung Luas dan Keliling Persegi

```go
package main

import "fmt"

// Prosedur untuk menghitung dan mencetak luas persegi
func hitungLuas(s float64) {
    luas := s * s
    fmt.Printf("Luas persegi: %.2f\n", luas) // Mencetak hasil luas
}

// Prosedur untuk menghitung dan mencetak keliling persegi
func hitungKeliling(s float64) {
    keliling := 4 * s
    fmt.Printf("Keliling persegi: %.2f\n", keliling) // Mencetak hasil keliling
}

func main() {
    var s float64

    fmt.Print("Masukkan panjang sisi persegi: ")
    fmt.Scan(&s)

    hitungLuas(s)      // Memanggil prosedur hitungLuas
    hitungKeliling(s)  // Memanggil prosedur hitungKeliling
}
```
### Output: 


program ini melakukan:

Meminta pengguna untuk memasukkan panjang sisi persegi.
Menghitung luas dan keliling persegi berdasarkan input tersebut.
Menampilkan hasil perhitungan luas dan keliling ke layar.
Kode program ini menunjukkan penggunaan fungsi dan pemisahan tugas dalam pemrograman, di mana fungsi hitungLuas dan hitungKeliling bertanggung jawab untuk menghitung masing-masing luas dan keliling persegi, sementara fungsi utama main bertugas untuk mendapatkan input pengguna dan memanggil fungsi-fungsi yang diperlukan.


### UNGUIDED ###

### 1. Minggu ini, mahasiswa Fakultas Informatika mendapatkan tugas dari mata kuliah matematika diskrit untuk mempelajari kombinasi dan permutasi. Jonas salah seorang mahasiswa, iseng untuk mengimplementasikannya ke dalam suatu program. Oleh karena itu bersediakah kalian membantu Jonas? (tidak tentunya ya :p) Masukan terdiri dari empat buah bilangan asli a, b, c, dan d yang dipisahkan oleh spasi, dengan syarat a ≥ c dan b ≥ d. Keluaran terdiri dari dua baris. Baris pertama adalah hasil permutasi dan kombinasi a terhadap c, sedangkan baris kedua adalah hasil permutasi dan kombinasi b terhadap d. Catatan: permutasi (P) dan kombinasi (C) dari n terhadap r (n ≥ r) dapat dihitung dengan menggunakan persamaan berikut!


### Selesaikan program tersebut dengan memanfaatkan procedure yang diberikan berikut ini!



```go
package main
import (
	"fmt"
)

// Prosedur untuk menghitung faktorial dari suatu bilangan bulat positif.
func faktorial(n int, hasil *int) {
	*hasil = 1
	if n == 0 {
		*hasil = 1
		return
	}
	for i := 1; i <= n; i++ {
		*hasil *= i
	}
}

// Prosedur untuk menghitung permutasi dari n terhadap r, dengan n >= r.
func permutasi(n, r int, hasil *int) {
	var fn, fnr int
	faktorial(n, &fn)
	faktorial(n-r, &fnr)
	*hasil = fn / fnr
}

// Prosedur untuk menghitung kombinasi dari n terhadap r, dengan n >= r.
func kombinasi(n, r int, hasil *int) {
	var fn, fr, fnr int
	faktorial(n, &fn)
	faktorial(r, &fr)
	faktorial(n-r, &fnr)
	*hasil = fn / (fr * fnr)
}

func main() {
	// Input empat bilangan asli a, b, c, d
	var a, b, c, d int
	fmt.Print("Masukkan 4 bilangan: ")
	fmt.Scan(&a, &b, &c, &d)

	// Variabel untuk menyimpan hasil permutasi dan kombinasi
	var x1, y1, x2, y2 int

	// Baris pertama: permutasi dan kombinasi a terhadap c
	permutasi(a, c, &x1)
	kombinasi(a, c, &y1)
	fmt.Printf("%d %d\n", x1, y1)

	// Baris kedua: permutasi dan kombinasi b terhadap d
	permutasi(b, d, &x2)
	kombinasi(b, d, &y2)
	fmt.Printf("%d %d\n", x2, y2)
}
```
### Output: 


Program ini menghitung permutasi dan kombinasi dari dua pasang bilangan bulat positif. Program ini dimulai dengan meminta pengguna untuk memasukkan empat bilangan bulat positif. Kemudian program menghitung permutasi dan kombinasi dari bilangan pertama terhadap bilangan ketiga, dan permutasi dan kombinasi dari bilangan kedua terhadap bilangan keempat. Hasilnya dicetak ke layar dalam dua baris, dengan permutasi di kolom pertama dan kombinasi di kolom kedua. Program ini menggunakan tiga prosedur: faktorial, permutasi, dan kombinasi.

Prosedur faktorial menghitung faktorial dari suatu bilangan bulat positif. Faktorial dari n didefinisikan sebagai perkalian semua bilangan bulat positif dari 1 hingga n.
Prosedur permutasi menghitung permutasi dari n terhadap r, dengan n >= r. Permutasi dari n terhadap r adalah jumlah cara untuk memilih r objek dari set n objek, di mana urutan pemilihan penting.
Prosedur kombinasi menghitung kombinasi dari n terhadap r, dengan n >= r. Kombinasi dari n terhadap r adalah jumlah

### 2. Kompetisi pemrograman tingkat nasional berlangsung ketat. Setiap peserta diberikan 8 soal yang harus dapat diselesaikan dalam waktu 5 jam saja. Peserta yang berhasil menyelesaikan soal paling banyak dalam waktu paling singkat adalah pemenangnya. Buat program gema yang mencari pemenang dari daftar peserta yang diberikan. Program harus dibuat modular, yaitu dengan membuat prosedur hitungSkor yang mengembalikan total soal dan total skor yang dikerjakan oleh seorang peserta, melalui parameter formal. Pembacaan nama peserta dilakukan di program utama, sedangkan waktu pengerjaan dibaca di dalam prosedur.

### Setiap baris masukan dimulai dengan satu string nama peserta tersebut diikuti dengan adalah 8 integer yang menyatakan berapa lama (dalam menit) peserta tersebut menyelesaikan soal. Jika tidak berhasil atau tidak mengirimkan jawaban, maka otomatis dianggap menyelesaikan dalam waktu 5 jam 1 menit (301 menit). Satu baris keluaran berisi nama pemenang, jumlah soal yang diselesaikan, dan nilai yang diperoleh. Nilai adalah total waktu yang dibutuhkan untuk menyelesaikan soal yang berhasil diselesaikan. 


### Keterangan:
### Astuti menyelesaikan 6 soal dalam waktu 287 menit, sedangkan Bertha 7 soal dalam waktu 294 menit. Karena Bertha menyelesaikan lebih banyak, maka Bertha menang. Jika keduanya menyelesaikan sama banyak, maka pemenang adalah yang menyelesaikan dengan total waktu paling kecil.



```go
package main

import (
	"fmt"
	"strings"
)

const batasWaktu = 301

// Fungsi untuk menghitung jumlah soal dan total waktu yang valid
func evaluasiSkor(waktuSoal [8]int, soalSelesai *int, waktuTotal *int) {
	*soalSelesai = 0
	*waktuTotal = 0
	for _, waktu := range waktuSoal {
		if waktu < batasWaktu {
			*soalSelesai++
			*waktuTotal += waktu
		}
	}
}

func main() {
	var peserta, juara string
	var waktuSoal [8]int
	var soalSelesai, waktuTotal int
	soalMaks := -1
	waktuTerkecil := batasWaktu * 8 // Nilai inisialisasi maksimal waktu

	for {
		// Meminta input nama peserta dan waktu pengerjaan soal
		fmt.Print("Nama peserta (ketik 'selesai' untuk berhenti): ")
		fmt.Scan(&peserta)
		if strings.EqualFold(peserta, "selesai") {
			break
		}

		fmt.Println("Masukkan waktu untuk tiap soal:")
		for i := 0; i < 8; i++ {
			fmt.Scan(&waktuSoal[i])
		}

		// Menghitung jumlah soal yang diselesaikan dan total waktu yang digunakan
		evaluasiSkor(waktuSoal, &soalSelesai, &waktuTotal)

		// Menentukan juara sementara berdasarkan soal yang dikerjakan dan waktu total
		if soalSelesai > soalMaks || (soalSelesai == soalMaks && waktuTotal < waktuTerkecil) {
			soalMaks = soalSelesai
			waktuTerkecil = waktuTotal
			juara = peserta
		}
	}

	// Mengumumkan pemenang
	fmt.Printf("Pemenang: %s, Soal Diselesaikan: %d, Total Waktu: %d\n", juara, soalMaks, waktuTerkecil)
}

```
## Output:



PProgram di atas menentukan pemenang dari sekumpulan peserta berdasarkan jumlah soal yang diselesaikan dalam waktu yang valid (kurang dari 301 detik per soal). Setiap peserta mengerjakan 8 soal, dan program mencatat waktu pengerjaannya. Setelah semua peserta memasukkan datanya, program membandingkan siapa yang menyelesaikan soal terbanyak dalam waktu tercepat. Peserta yang menyelesaikan paling banyak soal dengan waktu terkecil dinyatakan sebagai pemenang.

### 3. Skiena dan Revilla dalam Programming Challenges mendefinisikan sebuah deret bilangan. Deret dimulai dengan sebuah bilangan bulat n. Jika bilangan n saat itu genap, maka suku berikutnya adalah ½n, tetapi jika ganjil maka suku berikutnya bernilai 3n+1. Rumus yang sama digunakan terus menerus untuk mencari suku berikutnya. Deret berakhir ketika suku terakhir bernilai 1. Sebagai contoh, jika dimulai dengan n = 22, maka deret bilangan yang diperoleh adalah:

### Untuk suku awal sampai dengan 1000000, diketahui deret selalu mencapai suku dengan nilai 1. Buat program skiena yang akan mencetak setiap suku dari deret yang dijelaskan di atas untuk nilai suku awal yang diberikan. Pencetakan deret harus dibuat dalam prosedur cetakDeret yang mempunyai 1 parameter formal, yaitu nilai dari suku awal.

### Masukan berupa satu bilangan integer positif yang lebih kecil dari 1000000. Keluaran terdiri dari satu baris saja. Setiap suku dari deret tersebut dicetak dalam baris yang sama dan dipisahkan oleh sebuah spasi.

```go
package main 
import "fmt"

// Prosedur untuk mencetak deret
func cetakDeret(n int) {
	for n != 1 {
		fmt.Printf("%d ", n)
		if n%2 == 0 {
			n /= 2
		} else {
			n = 3*n + 1
		}
	}
	// Cetak angka terakhir (1)
	fmt.Printf("%d\n", n)
}

func main() {
	var n int

	// Input bilangan awal
	fmt.Print("Masukkan nilai: ")
	fmt.Scan(&n)

	// Cetak deret
	cetakDeret(n)
}
```
### Output: 

Program ini mencetak deret angka berdasarkan Collatz conjecture. Pengguna memasukkan bilangan bulat positif, lalu program menghasilkan deret berdasarkan aturan:
Jika angka genap, dibagi 2.
Jika angka ganjil, dikalikan 3 dan ditambah 1. Proses berlanjut hingga angka mencapai 1.


### KESIMPULAN
Program ini dirancang untuk menyelesaikan berbagai tugas, antara lain menghitung permutasi dan kombinasi, menentukan pemenang kompetisi berdasarkan jumlah soal yang diselesaikan dalam waktu tercepat, dan mencetak deret angka berdasarkan Collatz conjecture. Program ini terdiri dari beberapa prosedur dan memanfaatkan masukan dari pengguna untuk menghasilkan output yang sesuai.

### REFERENSI
[1] https://www.staditek.id/insight/golang-adalah/
[2] https://dibimbing.id/blog/detail/panduan-belajar-golang-untuk-pemula-sampai-mahir
Laprak modul 4