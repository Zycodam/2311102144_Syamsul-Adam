# <h2 align="center">LAPORAN PRAKTIKUM</h2>
# <h2 align="center">ALGORITMA DAN PEMROGRAMAN 2</h2>
# <h2 align="center">MODUL 7</h2>
# <h2 align="center"> STRUCT & ARRAY </h2>
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

### 1. Tipe Bentukan
Tipe bentukan memungkinkan pemrograman untuk mendefinisikan suatu tipe data baru pada suatu bahasa pemrograman. Tipe bentukan ini dapat dibedakan atas dua jenis, yaitu Alias dan Struct.</br>
    - Alias (Type)<br/>
    Bahasa pemrograman pada umumnya mengizinkan pemrograman untuk mengubah nama suatu tipe data dengan nama baru yang lebih ringkas dan familiar. Sebagai contoh
    "integer" dapat diubah dengan nama alias "bilangan". Caranya dengan menggunakan kata kunci "type".<br/>
    ![image](https://github.com/user-attachments/assets/13275380-ce9e-4c1e-bce0-0affa3239e62)
    Sebagai contoh perhatikan program Go berikut beserta  hasil eksekusinya!<br/>
    ![image](https://github.com/user-attachments/assets/887c4efc-3d81-4201-9d80-75db2e59f166)
    - Struct atau Record<br/>
    Structure memungkinkan pemrograman untuk mengelompokkan beberapa data atau nilai yang memiliki relasi atau keterkaitan tertentu menjadi suatu kesatuan. Masing
    masing nilai tersimpan dalam field dari structure tersebut.<br/>
    ![image](https://github.com/user-attachments/assets/ee368f95-8266-4a14-87da-1f85bcf2cc3e)
    Berbeda dengan bahasa pemrograman lain, kesamaan tipe dari dua variabel berjenis structure bukan karena namanya tetapi karena strukturnya. Dua variabel dengan 
    nama-nama field dan tipe field yang sama (dan dalam urutan yang sama) dianggap mempunyai tipe yang sama. Tentunya akan lebih memudahkan jika structure tersebut
    didefinisikan sebagai sebuah tipe baru, sehingga deklarasi structure tidak perlu lagi seluruh field-nya ditulis ulang berkali-kali.<br/>
    ![image](https://github.com/user-attachments/assets/afbe3b7c-6617-4765-9a43-459f408d9f63)

### 2. Array<br/>
Array mempunyai ukuran (jumlah elemen) yang tetap (statis) selama eksekusi program, sehingga jumlah elemen array menjadi bagian dari deklarasi variabel dengan tipe array.<br/>
![image](https://github.com/user-attachments/assets/bf257fb1-0618-4938-adfc-f4421d286980)
Jumlah elemen array dapat diminta dengan fungsi len yang tersedia. Sebagai contoh len(arr) akan menghasilkan 73 untuk contoh di atas.<br/>
Indeks array dimulai dari 0, sehingga indeks array pada contoh adalah 0, 1.. len(arr)-1<br/>
Contoh:<br/>
![image](https://github.com/user-attachments/assets/9d6a3239-2ae2-4fcb-b98f-adf08c23df36)<br/>
    - Slice (Array Dinamik)<br/>
    Array dalam Go juga dapat mempunyai ukuran yang dinamik. (Tidak digunakan di kelas Algoritma Pemrograman). Deklarasinya mirip dengan deklarasi array, tetapi
    jumlah elemennya dikosongkan.<br/>
    ![image](https://github.com/user-attachments/assets/fd8d3f2a-0494-429f-82aa-f1c42870e8d0)
    Sebuah slice dapat direalokasi menggunakan fungsi built-in make:<br/>
    ![image](https://github.com/user-attachments/assets/eccdd951-b904-4162-a9de-86b03439c704)
    Fungsi built-in len dapat digunakan untuk mengetahui ukuran slice. Fungsi lain, cap, dapat digunakan untuk mengetahui total tempat yang disediakan untuk slice
    tersebut.<br/>
    ![image](https://github.com/user-attachments/assets/f910cb7c-0062-45a2-b702-0113e6e81fde)
    Fungsi built-in append dapat digunakan untuk menambahkan elemen ke suatu slice, dan bila perlu memperbesar tempat untuk slice tersebut.<br/>
    ![image](https://github.com/user-attachments/assets/f36ecae1-0f8b-4a6a-8a48-18ab7b97a883)
    Sebuah slice baru juga dapat terbentuk dengan mengambil slice dari suatu array atau slice yang lain.<br/>
    ![image](https://github.com/user-attachments/assets/ab36eea8-d2ef-4bf5-9ad8-f3d9059baaad)
    - Map<br/>
    Tipe array lain, sebuah array dinamik. Indeksnya (di sini disebut kunci) tidak harus berbentuk integer. Indeks dapat berasal dari tipe apa saja. Struktur ini
    disebut map.<br/>
    ![image](https://github.com/user-attachments/assets/7916e324-fdc1-48f4-a304-0f805bd3c920)<br/>
    ![image](https://github.com/user-attachments/assets/7a9c1cdb-dc40-4083-ae3d-22210e26ebce)

## II. GUIDED

### 1. Program Menghitung Lama Parkir

```go
package main

import "fmt"

type waktu struct {
	jam, menit, detik int
}

func main() {
	var wParkir, wPulang, durasi waktu
	var dParkir, dPulang, lParkir int

	fmt.Scan(&wParkir.jam, &wParkir.menit, &wParkir.detik)
	fmt.Scan(&wPulang.jam, &wPulang.menit, &wPulang.detik)
	dParkir = wParkir.detik + wParkir.menit*60 + wParkir.jam*3600 // Konversi ke detik
	dPulang = wPulang.detik + wPulang.menit*60 + wPulang.jam*3600 // detik
	lParkir = dPulang - dParkir                                   //detik dari pulang-datang

	durasi.jam = lParkir / 3600
	durasi.menit = lParkir % 3600 / 60
	durasi.detik = lParkir % 3600 % 60 //17
	fmt.Printf("Lama Parkir : %d jam %d menit %d detik", durasi.jam, durasi.menit, durasi.detik)
}
```
## Output: ![Screenshot 2024-11-17 215918](https://github.com/user-attachments/assets/d9bc6792-d7b6-466a-82e6-7d76e67dc6cf)


Program ini dirancang untuk menghitung durasi waktu parkir berdasarkan waktu masuk dan waktu keluar. Program ini menggunakan struktur data struct untuk menyimpan informasi jam, menit, dan detik, serta melakukan konversi waktu ke dalam detik untuk memudahkan perhitungan durasi.
### 2. Program Slice

```go
package main

import (
	"fmt"
)

// Fungsi untuk mengecek apakah nama sudah ada di dalam slice
func sudahAda(daftarTeman []string, nama string) bool {
	for _, teman := range daftarTeman {
		if teman == nama {
			return true
		}
	}
	return false
}

func main() {
	// Slice awal untuk daftar teman dengan beberapa data
	daftarTeman := []string{"Andi", "Budi", "Cici"}

	// Nama-nama baru yang ingin ditambahkan
	namaBaru := []string{"Dewi", "Budi", "Eka"}

	// Menambahkan nama baru hanya jika belum ada di daftar
	for _, nama := range namaBaru {
		if !sudahAda(daftarTeman, nama) {
			daftarTeman = append(daftarTeman, nama)
		} else {
			fmt.Println("Nama", nama, "sudah ada dalam daftar.")
		}
	}

	// Menampilkan daftar teman akhir
	fmt.Println("Daftar Teman:", daftarTeman)
}
```
## Output: ![Screenshot 2024-11-17 220013](https://github.com/user-attachments/assets/4bfc73a7-1bd0-4b31-81db-eb2c5210fd38)



Program ini  dibuat berbasis teks yang sederhana, pengguna dapat dengan mudah menambah nama ke dalam daftar teman sambil memastikan tidak ada yang double.
### 2. Program Map

```go
package main

import (
	"fmt"
)

func main() {
	// Membuat map dengan nama buah sebagai kunci dan harga sebagai nilai
	hargaBuah := map[string]int{
		"Apel":  5000,
		"Pisang": 3000,
		"Mangga": 7000,
	}

	// Menampilkan harga dari setiap buah
	fmt.Println("Harga Buah:")
	for buah, harga := range hargaBuah {
		fmt.Printf("%s: Rp%d\n", buah, harga)
	}

	// Menampilkan harga buah Mangga secara spesifik
	if harga, ada := hargaBuah["Mangga"]; ada {
		fmt.Printf("Harga buah Mangga = Rp%d\n", harga)
	} else {
		fmt.Println("Buah Mangga tidak ditemukan dalam daftar.")
	}
}
```
## Output: ![Screenshot 2024-11-17 220034](https://github.com/user-attachments/assets/9841702f-c8e5-4277-9684-3bea7b2d56ce)



Program ini dibuat untuk menyimpan dan mengelola data. Dengan antarmuka berbasis teks yang sederhana, pengguna dapat dengan mudah melihat harga buah yang telah ditentukan dan melakukan pencarian harga untuk buah tertentu.

## III. UNGUIDED

### 1. Suatu lingkaran didefinisikan dengan koordinat titik pusat (cx,cy) dengan radius r. Apabila diberikan dua buah lingkaran, maka tentukan posisi sebuah titik sembarang (x,y) berdasarkan dua lingkaran tersebut. Gunakan tipe bentukan titik untuk menyimpan koordinat, dan tipe bentukan lingkaran untuk menyimpan titik pusat lingkaran dan radiusnya. <br> Masukan terdiri dari beberapa tiga baris. Baris pertama dan kedua adalah koordinat titik pusat dan radius dari lingkaran 1 dan lingkaran 2, sedangkan baris ketiga adalah koordinat titik sembarang. Asumsi sumbu x dan y dari semua titik dan juga radius direpresentasikan dengan bilangan bulat.<br/> Keluaran berupa string yang menyatakan posisi titik "Titik di dalam lingkaran 1 dan 2", "Titik di dalam lingkaran 1", "Titik di dalam lingkaran 2", atau "Titik di luar lingkaran 1 dan 2". <br/> Fungsi untuk menghitung jarak titik (a,b) dan (c,d) di mana rumus jarak adalah:<br/> ![image](https://github.com/user-attachments/assets/1ec76514-808a-436f-9d61-a908461f0954) <br/> Dan juga fungsi untuk menentukan posisi sebuah titik sembarang berada di dalam suatu lingkaran atau tidak.<br/> ![image](https://github.com/user-attachments/assets/862f3db5-0399-4b10-a06b-08f053461f68)

```go
package main

import (
	"fmt"
	"math"
)

// Definisi tipe Titik dan Lingkaran
type Titik struct {
	x, y int
}

type Lingkaran struct {
	center Titik
	radius int
}

// Fungsi untuk menghitung jarak antara dua titik
func jarak(p, q Titik) float64 {
	return math.Sqrt(float64((p.x-q.x)*(p.x-q.x) + (p.y-q.y)*(p.y-q.y)))
}

// Fungsi untuk menentukan apakah titik berada di dalam lingkaran
func didalam(c Lingkaran, p Titik) bool {
	return jarak(c.center, p) <= float64(c.radius)
}

func main() {
	// Input lingkaran pertama
	var cx1, cy1, r1 int
	fmt.Println("Masukkan koordinat titik lingkaran 1:")
	fmt.Scan(&cx1, &cy1, &r1)
	lingkaran1 := Lingkaran{Titik{cx1, cy1}, r1}

	// Input lingkaran kedua
	var cx2, cy2, r2 int
	fmt.Println("Masukkan koordinat titik  2:")
	fmt.Scan(&cx2, &cy2, &r2)
	lingkaran2 := Lingkaran{Titik{cx2, cy2}, r2}

	// Input titik yang akan dicek
	var px, py int
	fmt.Println("Masukkan koordinat titik (px, py):")
	fmt.Scan(&px, &py)
	titik := Titik{px, py}

	// Mengevaluasi posisi titik
	diDalamLingkaran1 := didalam(lingkaran1, titik)
	diDalamLingkaran2 := didalam(lingkaran2, titik)

	// Output hasil
	if diDalamLingkaran1 && diDalamLingkaran2 {
		fmt.Println("Titik di dalam lingkaran 1 dan 2")
	} else if diDalamLingkaran1 {
		fmt.Println("Titik di dalam lingkaran 1")
	} else if diDalamLingkaran2 {
		fmt.Println("Titik di dalam lingkaran 2")
	} else {
		fmt.Println("Titik di luar lingkaran 1 dan 2")
	}
}


```
## Output: ![Screenshot 2024-11-17 220328](https://github.com/user-attachments/assets/d11fdc57-e4ea-4a04-af4b-00862d05a34b)


program di buat apakah suatu titik berada di dalam dua lingkaran yang didefinisikan oleh koordinat pusat dan jari-jari masing-masing. Dengan kesempatan menggunakan tipe data struct untuk titik dan lingkaran, program akan secara otomatis menghitung jarak antara pusat poros lingkaran dan hanya menggunakanjarak Euclidean. Apakah jarak antara titik ini kurang dari faktor jari-jari dari setiap lingkaran

### 2. Sebuah array digunakan untuk menampung sekumpulan bilangan bulat. Buatlah program yang digunakan untuk mengisi array tersebut sebanyak N elemen nilai. Asumsikan array memiliki kapasitas penyimpanan data sejumlah elemen tertentu. Program dapat menampilkan beberapa informasi berikut:<br/>
### a. Menampilkan keseluruhan isi dari array.<br/>
### b. Menampilkan elemen-elemen array dengan indeks ganjil saja.<br/>
### c. Menampilkan elemen-elemen array dengan indeks genap saja (asumsi indeks ke-0 adalah genap).<br/>
### d. Menampilkan elemen-elemen array dengan indeks kelipatan bilangan x. x bisa diperoleh dari masukan pengguna.<br/>
### e. Menghapus elemen array pada indeks tertentu, asumsi indeks yang hapus selalu valid. Tampilkan keseluruhan isi dari arraynya, pastikan data yang dihapus tidak tampil.<br/>
### f. Menampilkan rata-rata dari bilangan yang ada di dalam array.<br/>
### g. Menampilkan standar deviasi atau simpangan baku dari bilangan yang ada di dalam array tersebut.<br/>
### h. Menampilkan frekuensi dari suatu bilangan tertentu di dalam array yang telah diisi tersebut.<br/>

```go
package main

import (
	"fmt"
	"math"
)

func main() {
	var n int
	fmt.Print("Masukkan jumlah elemen array: ")
	fmt.Scan(&n)

	// Input elemen array
	array := make([]int, n)
	fmt.Println("Masukkan elemen array:")
	for i := 0; i < n; i++ {
		fmt.Scan(&array[i])
	}

	// a. Menampilkan keseluruhan isi aray
	displayFullArray(array)

	// b. Menampilkan elemen dengan indeks ganjl
	displayOddIndices(array)

	// c. Menampilkan elemen dengan indeks genap
	displayEvenIndices(array)

	// d. Menampilkan elemen dengan indeks kelipatan bilangan x
	displayMultipleIndices(array)

	// e. Menghapus elemen array pada indeks tertentu
	array = deleteElement(array)

	// f. Menampilkan rata-rata dari elemen array
	displayAverage(array)

	// g. Menampilkan standar deviasi dari elemen array
	displayStdDev(array)

	// h. Menampilkan frekuensi elemen dalam array
	displayFrequency(array)
}

// a. Menampilkan keseluruhan isi array
func displayFullArray(array []int) {
	fmt.Println("a. Keseluruhan isi array:", array)
}

// b. Menampilkan elemen-elemen array dengan indeks ganjil
func displayOddIndices(array []int) {
	fmt.Print("b. Elemen dengan indeks ganjil: ")
	for i := 0; i < len(array); i += 2 {
		fmt.Print(array[i], " ")
	}
	fmt.Println()
}

// c. Menampilkan elemen-elemen array dengan indeks genap
func displayEvenIndices(array []int) {
	fmt.Print("c. Elemen dengan indeks genap: ")
	for i := 1; i < len(array); i += 2 {
		fmt.Print(array[i], " ")
	}
	fmt.Println()
}

// d. Menampilkan elemen-elemen array dengan indeks kelipatan bilangan x
func displayMultipleIndices(array []int) {
	var x int
	fmt.Print("Masukkan nilai x untuk indeks kelipatan: ")
	fmt.Scan(&x)

	if x <= 0 {
		fmt.Println("Nilai x harus lebih besar dari 0!")
		return
	}

	fmt.Printf("d. Elemen dengan indeks kelipatan %d: ", x)
	for i := x; i < len(array); i += x {
		fmt.Print(array[i], " ")
	}
	fmt.Println()
}

// e. Menghapus elemen array pada indeks tertentu
func deleteElement(array []int) []int {
	var delIndex int
	fmt.Print("Masukkan indeks elemen yang akan dihapus: ")
	fmt.Scan(&delIndex)
// 
	if delIndex >= 0 && delIndex < len(array) {
		array = append(array[:delIndex], array[delIndex+1:]...)
		fmt.Println("e. Array setelah penghapusan elemen:", array)
	} else {
		fmt.Println("Indeks tidak valid!")
	}
	return array
}

// f. Menampilkan rata-rata elemen array
func displayAverage(array []int) {
	sum := 0
	for _, val := range array {
		sum += val
	}
	avg := float64(sum) / float64(len(array))
	fmt.Printf("f. Rata-rata elemen array: %.2f\n", avg)
}

// g. Menampilkan standar deviasi elemen array
func displayStdDev(array []int) {
	sum := 0
	for _, val := range array {
		sum += val
	}
	avg := float64(sum) / float64(len(array))

	var variance float64
	for _, val := range array {
		variance += math.Pow(float64(val)-avg, 2)
	}
	stdDev := math.Sqrt(variance / float64(len(array)))
	fmt.Printf("g. Standar deviasi elemen array: %.2f\n", stdDev)
}

// h. Menampilkan frekuensi elemen dalam array
func displayFrequency(array []int) {
	freq := make(map[int]int)
	for _, val := range array {
		freq[val]++
	}
	fmt.Println("h. Frekuensi elemen dalam array:")
	for key, val := range freq {
		fmt.Printf("   %d: %d kali\n", key, val)
	}
}

```
## Output: ![Screenshot 2024-11-17 203200](https://github.com/user-attachments/assets/a6b4babc-03ae-46cf-b6c6-75ee5c79cf7f)



Program ini dirancang untuk melakukan berbagai operasi seperti pada soal ada array bilangan bulat, seperti menampilkan indeks ganjil, genap, atau kelipatan tertentu, menghitung rata-rata, menghapus elemen pada indeks tertentu, serta menghitung frekuensi kemunculan elemen.


### 3. Sebuah program digunakan untuk menyimpan dan menampilkan nama-nama klub yang memenangkan pertandingan bola pada suatu grup pertandingan. Buatlah program yang digunakan untuk merekap skor pertandingan bola 2 buah klub bola yang berlaga. Pertama-tama program meminta masukan nama-nama klub yang bertanding, kemudian program meminta masukan skor hasil pertandingan kedua klub tersebut. Yang disimpan dalam array adalah nama-nama klub yang menang saja. Proses input skor berhenti ketika skor salah satu atau kedua klub tidak valid (negatif). Di akhir program, tampilkan daftar klub yang memenangkan pertandingan.   

```go
package main

import (
	"fmt"
)

func main() {
	var klubA, klubB string
	var pemenang []string

	// Meminta input nama klub
	fmt.Print("Klub A: ")
	fmt.Scanln(&klubA)

	fmt.Print("Klub B: ")
	fmt.Scanln(&klubB)

	// Memasukkan skor pertandingan
	for i := 1; ; i++ {
		var skorA, skorB int
		fmt.Printf("Pertandingan %d : ", i)
		_, err := fmt.Scanln(&skorA, &skorB)

		// Validasi input
		if err != nil {
			fmt.Println("Input tidak valid. Coba lagi.")
			i-- // Ulangi iterasi ini
			continue
		}
		if skorA < 0 || skorB < 0 {
			break // Akhiri loop jika skor negatif
		}

		// Menentukan pemenang
		if skorA > skorB {
			pemenang = append(pemenang, klubA)
		} else if skorA < skorB {
			pemenang = append(pemenang, klubB)
		} else {
			pemenang = append(pemenang, "Seri")
		}
	}

	// Menampilkan hasil pertandingan
	fmt.Println("\nHasil Pertandingan:")
	for i, p := range pemenang {
		fmt.Printf("Hasil %d: %s\n", i+1, p)
	}
	fmt.Println("Pertandingan selesai.")
}

```
## Output: ![Screenshot 2024-11-17 210420](https://github.com/user-attachments/assets/cb4794ab-9e60-4d6e-a893-7788054d1488)


Program ini bertujuan untuk mencatat hasil beberapa pertandingan antara dua klub sepak bola. Puser memasukkan nama kedua klub, lalu memasukkan skor pertandingan secara berulang hingga salah satu skor negatif dimasukkan. Program mencatat pemenang dari setiap pertandingan dan menampilkan hasil akhirnya.

### 4. Sebuah array digunakan untuk menampung sekumpulan karakter, Anda diminta untuk membuat sebuah subprogram untuk melakukan membalikkan urutan isi array dan memeriksa apakah membentuk palindrom.

```go
package main

import (
	"fmt"
)

const NMAX int = 127

type tabel [NMAX]rune

// Fungsi untuk mengisi array dengan karakter dari input satu baris
func isiArray(t *tabel, n *int) {
	var input string

	fmt.Println("Masukkan teks : ")
	fmt.Scanln(&input)

	*n = 0
	for _, char := range input {
		if char == '.' {
			break
		}

		// Masukkan karakter ke dalam array
		t[*n] = char
		*n++

		// Hentikan jika mencapai batas maksimum NMAX
		if *n >= NMAX {
			fmt.Println("Batas maksimum tercapai.")
			break
		}
	}
}

// Fungsi untuk mencetak isi array
func cetakArray(t tabel, n int) {
	for i := 0; i < n; i++ {
		fmt.Printf("%c", t[i])
	}
	fmt.Println()
}

// Fungsi untuk membalik isi array
func balikanArray(t *tabel, n int) {
	for i := 0; i < n/2; i++ {
		t[i], t[n-1-i] = t[n-1-i], t[i]
	}
}

// Fungsi untuk mengecek apakah array adalah palindrom
func palindrom(t tabel, n int) bool {
	for i := 0; i < n/2; i++ {
		if t[i] != t[n-1-i] {
			return false
		}
	}
	return true
}

func main() {
	var tab tabel
	var n int

	// Memanggil fungsi isiArray
	isiArray(&tab, &n)

	// Cetak array asli
	fmt.Print("Teks: ")
	cetakArray(tab, n)

	// Membalik array
	balikanArray(&tab, n)

	// Cetak array yang telah dibalik
	fmt.Print("Reverse teks: ")
	cetakArray(tab, n)

	// Mengecek apakah array adalah palindrom
	if palindrom(tab, n) {
		fmt.Println("Teks ini adalah palindrom.")
	} else {
		fmt.Println("Teks ini bukan palindrom.")
	}
}

```

## Output: ![Screenshot 2024-11-17 211047](https://github.com/user-attachments/assets/6e5ee8e9-f126-4c5a-a51a-e93a33f3abd0)

Program ini meminta pengguna untuk memasukkan teks
1. Membalik Teks: Program membalik urutan karakter dalam teks input, sehingga menampilkan teks terbalik.
2 Mengecek Palindrom atua tidak: Program memeriksa apakah teks input adalah palindrom, yaitu teks yang sama baik dibaca maju maupun mundur.

## KESIMPULAN
Secara keseluruhan, program ini menggabungkan berbagai konsep pemrograman untuk menyelesaikan masalah yang berbeda, memberikan pengguna alat yang berguna untuk analisis geometris, manipulasi data, pencatatan hasil, dan pengolahan teks.


