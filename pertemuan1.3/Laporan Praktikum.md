# <h2 align="center">LAPORAN PRAKTIKUM</h2>
# <h2 align="center">ALGORITMA DAN PEMROGRAMAN 2</h2>
# <h2 align="center">MODUL 2</h2>
# <h2 align="center"> REVIEW STRUKTUR KONTROL</h2>
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
1. Struktur kontrol dalam bahasa Go (Go) sangat penting untuk menentukan alur eksekusi kode dan memastikan bahwa program berjalan dengan efisien dan terstruktur. Berikut adalah ulasan modul review struktur kontrol dalam bahasa Go:
Struktur Kontrol Utama
Untuk Perulangan
Sintaks : loop dalam Go memiliki tiga bagian: inisialisasi, kondisi, dan post (peningkatan/penurunan). Contoh:for
pergi
sum := 0
for i := 0; i < 10; i++ {
    sum += i
}

Fleksibilitas : loop dapat digunakan untuk berbagai keperluan, termasuk loop tradisional dan loop berbasis kondisifor
1
2
.
Jika dan Jika-Lainnya
Sintaks : If-else dalam Go dapat digunakan untuk memeriksa kondisi dan menjalankan blok kode yang sesuai. Contoh:
pergi
age := 25
if age < 18 {
    fmt.Println("You are a minor.")
} else {
    fmt.Println("You are an adult.")
}

Fleksibilitas : If-else dapat digunakan secara luas untuk memeriksa kondisi yang lebih kompleks
1
2
.
Mengalihkan
Sintaks : Switch dalam Go dapat digunakan untuk memeriksa nilai dan menjalankan blok kode yang sesuai. Contoh:
pergi
switch day := time.Now().Weekday(); day {
    case time.Saturday, time.Sunday:
        fmt.Println("Weekend!")
    default:
        fmt.Println("Weekday.")
}

Fleksibilitas : Switch dapat digunakan untuk memeriksa nilai yang lebih kompleks dan memiliki beberapa case
1
2
.
Looping Berbasis Range
Sintaks : Looping berbasis range dalam Go dapat digunakan untuk mengiterasi array, slice, string, atau map. Contoh:
pergi
for key, value := range oldMap {
    newMap[key] = value
}

Fleksibilitas : Perulangan berbasis rentang memungkinkan pengguna untuk mengiterasi struktur data yang berbeda dengan cara yang sederhana
1
2
.
Struktur Kontrol Lanjutan
Istirahat dan Lanjutkan
Sintaks : Break dan continue dalam Go dapat digunakan untuk menghentikan atau melanjutkan loop. Contoh:
pergi
for i := 0; i < 10; i++ {
    if i == 5 {
        break
    }
    fmt.Println(i)
}

Fleksibilitas : Break dan continue memungkinkan pengguna untuk mengontrol alur loop dengan lebih fleksibel
1
.
Memilih
Sintaks : Select dalam Go digunakan untuk mengelola komunikasi multipleks antara goroutine. Contoh:
pergi
select {
    case msg := <-ch1:
        fmt.Println(msg)
    case msg := <-ch2:
        fmt.Println(msg)
}

Fleksibilitas : Pilihan yang memungkinkan pengguna untuk mengelola komunikasi antara goroutine dengan cara yang aman dan efisien
2
.

### II. GUIDED

### 1. Hasill Penjumlahan

``` go
package main

import "fmt"

func main(){

	var a, b, c, d, e int
	var hasil int 
	fmt.Scanln(&a, &b, &c, &d, &e)

	hasil = a+b+c+d+e
	fmt.Println("Hasil Penjumlahan ", a, b, c, d, e, "adalah = ", hasil)

}
```
## Output: ![Screenshot Output guided 1](output- guided1.png)

Program ini digunakan untuk menjumlahkan 5 bilangan bulat yang diinput oleh pengguna dan menampilkan hasilnya.

## 2.  Siswa kelas IPA di salah satu sekolah menengah atas di Indonesia sedang mengadakan praktikum kimia. Di setiap percobaan akan menggunakan 4 tabung reaksi, yang mana susunan warna cairan di setiap tabung akan menentukan hasil percobaan. Siswa diminta untuk mencatat hasil percobaan tersebut. Percobaan dikatakan berhasil apabila susunan warna zat cair pada gelas 1 hingga gelas 4 secara berturut-turut adalah ‘merah’, ‘kuning’, ‘hijau’, dan ‘ungu’ selama 5 kali percobaan berulang.<br/> Buatlah sebuah program yang menerima input berupa warna dari ke 4 gelas reaksi sebanyak 5 kali percobaan. Kemudian program akan menampilkan true apabila urutan warna sesuai dengan informasi yang diberikan pada paragraf sebelumnya, dan false untuk urutan warna lainnya.<br/>

```go
package main

import (
	"bufio"    // Package untuk membaca input dari pengguna melalui terminal
	"fmt"      // Package untuk menampilkan output ke terminal
	"os"       // Package untuk interaksi dengan sistem operasi
	"strings"  // Package untuk manipulasi string
)

func main() {
	// Array yang menyimpan urutan warna yang benar
	correctOrder := []string{"merah", "kuning", "hijau", "ungu"}

	// Membuat reader untuk membaca input pengguna dari terminal
	reader := bufio.NewReader(os.Stdin)
	success := true // Flag untuk menandai apakah input sesuai urutan warna yang benar

	// Loop untuk percobaan sebanyak 5 kali
	for i := 1; i <= 5; i++ {
		fmt.Printf("Percobaan %d: ", i)   // Menampilkan percobaan ke berapa
		input, _ := reader.ReadString('\n') // Membaca input dari pengguna hingga baris baru ('\n')
		input = strings.TrimSpace(input)    // Menghapus spasi atau karakter newline dari input

		colors := strings.Split(input, " ") // Memecah string input berdasarkan spasi menjadi slice
		for j := 0; j < 4; j++ {            // Mengecek apakah setiap warna sesuai dengan urutan yang benar
			if colors[j] != correctOrder[j] {  // Jika ada warna yang salah urutan
				success = false  // Tandai success sebagai false
				break            // Hentikan pengecekan lebih lanjut
			}
		}
		if !success {  // Jika success sudah false, hentikan percobaan lebih lanjut
			break
		}
	}

	// Menampilkan hasil akhir
	if success {
		fmt.Println("BERHASIL : true")  // Jika semua input sesuai urutan
	} else {
		fmt.Println("BERHASIL : false") // Jika ada urutan warna yang salah
	}
}
```
### Output: 
![Screenshot Output guided 2](output- guided2.png)

Program ini digunakan untuk memeriksa apakah pengguna dapat mengingat urutan warna yang benar dalam 5 percobaan.

## 3. Diberikan sebuah nilai akhir mata kuliah (NAM) [0..100] dan standar penilaian nilai mata kuliah (NMK) sebagai berikut:<br/>![image](https://github.com/user-attachments/assets/247bc3eb-b356-4b1e-9b96-228289ff956d)![image](https://github.com/user-attachments/assets/99019855-2c34-479d-ac84-f5036b1303e9)<br/> Program berikut menerima input sebuah bilangan rill yang menyatakan NAM. Program menghitung NMK dan menampilkannya.<br/>

```go
package main

import "fmt"

func main() {
	var nam float64
	var nmk string

	// Meminta input nilai
	fmt.Print("Nilai akhir mata kuliah: ")
	fmt.Scan(&nam)

	// Logika penentuan nilai huruf berdasarkan nilai numerik
	if nam > 80 {
		nmk = "A"
	} if nam > 72.5 {
		nmk = "AB"
	} if nam > 65 {
		nam = "B"
	} if nam > 57.5 {
		nmk = "BC"
	} if nam > 50 {
		nmk = "C"
	} if nam > 40 {
		nmk = "D"
	} else if nam <= 40 {
		nam = "E"
	}

	// Menampilkan hasil
	fmt.Printf("Nilai mata kuliah:" ,nmk)
}
```

## Jawablah pertanyaan-pertanyaan berikut:<br/>a. Jika nam diberikan adalah 80.1, apa keluaran dari program tersebut? Apakah eksekusi program tersebut sesuai spesifikasi soal?<br/>
- Jika nilai namyang diberikan adalah 80.1, maka keluaran dari program tersebut adalah "A".

Namun, eksekusi program tersebut tidak sesuai soal. Program tersebut memiliki beberapa kesalahan logika dalam penentuan nilai huruf.

Pada kondisi if nam > 72.5, program tersebut tidak menyetel nilai nmkke "B", melainkan menyetel nilai namke "B" yang tidak memiliki arti dalam konteks ini. Selain itu, kondisi if nam > 65juga tidak mengatur nilai nmkke "B", melainkan mengatur nilai namke "B" lagi.

Kondisi if nam > 57.5dan if nam > 50juga memiliki kesalahan yang sama.

Kondisi if nam > 40dan else if nam <= 40juga tidak mengatur nilai nmkke "D" dan "E" secara benar.

## Apa saja kesalahan dari program tersebut? Mengapa demikian? Jelaskan alur program seharusnya!<br/>
- Program yang Andaberikan memilikibeberapa area yang dapat menghasilkan hasilyang tidak tepat atau bahkan kes alahan saat menjalkan programBerikut adalahanalisis kes alahan dan penjelas alur programyang seharusnya.
Kesalahan Penamaan Variabel :
Pada baris dan , Anda seharusnya menggunakan sebagai variabel untuk menyimpan nilai huruf, bukan . Variabel dideklarasikan sebagai , sehingga tidak dapat menyimpan string.nam = "B"nam = "E"nmknamnamfloat64
Penggunaan Struktur Kontrol :
Anda menggunakan beberapa pernyataan tanpa secara konsisten. Hal ini dapat menyebabkan beberapa kondisi dievaluasi meskipun kondisi sebelumnya sudah terpenuhi. Misalnya, jika nilainya 85, maka akan mengatur menjadi "A" dan kemudian melanjutkan untuk memeriksa kondisi berikutnya, yang tidak diinginkan.ifelse ifnmk
Format Keluaran :
Pada bagian keluaran, Anda menggunakan . Format ini salah karena Anda tidak menggunakan format string untuk menampilkan nilai dari . Seharusnya menggunakan sebagai placeholder untuk string.fmt.Printf("Nilai mata kuliah:", nmk)nmk%s
## Perbaiki program tersebut! Ujilah dengan masukan: 93.5; 70.6; 49.5. Seharusnya keluaran yang diperoleh adalah 'A', 'B', dan 'D'.<br/>

```go
package main

import "fmt"

func main() {
	var nam float32
	var nmk string

	fmt.Print("Masukkan nilai:")
	fmt.Scan(&nam)

	if nam > 80 {
		nmk = "A"
	} else if nam > 72.5 {
		nmk = "B"
	} else if nam > 65 {
		nmk = "C"
	} else if nam > 50 {
		nmk = "D"
	} else if nam > 40 {
		nmk = "E"
	} else {
		nmk = "F"
	}

	fmt.Printf("Nilai Indeks untuk nilai %.2f adalah %s\n", nam, nmk)
}

```

## Output: ![Screenshot Output guided 3](output- guided3.png)<br/>

Program ini bertujuan untuk mengkonversi nilai numerik (dalam format float) yang dimasukkan oleh pengguna menjadi indeks nilai huruf berdasarkan kriteria tertentu. Indeks nilai huruf ini sering digunakan dalam sistem penilaian akademis.
Struktur Program
Paket Impor :
import "fmt": Mengimpor paket yang digunakan untuk format input dan output.fmt
Deklarasi Variabel :
var nam float32: Mendeklarasikan variabel dengan tipe data untuk menyimpan nilai yang dimasukkan oleh pengguna.namfloat32
var nmk string: Mendeklarasikan variabel dengan tipe data untuk menyimpan indeks nilai huruf.nmkstring
Menerima Masukan dari Pengguna :
fmt.Print("Masukkan nilai:"): Menampilkan pesan kepada pengguna untuk memasukkan nilai.
fmt.Scan(&nam): Menerima masukan dari pengguna dan menyimpannya dalam variabel .nam
Logika Penentuan Indeks Nilai :
Menggunakan kontrol struktur untuk menentukan indeks nilai huruf berdasarkan rentang nilai yang telah ditentukan:if-else if-else
Jika , maka diatur menjadi "A".nam > 80nmkJika , maka diatur menjadi "B".nam > 72.5nmk Jika , maka diatur menjadi "C".nam > 65nm  Jika , maka diatur menjadi "D".nam > 50nmk Jika , maka diatur menjadi "E".nam > 40nmk Jika tidak ada kondisi di atas yang terpenuhi (artinya nilai kurang dari atau sama dengan 40), maka diatur menjadi “F”.nmk


### UNGUIDED ###

### 1. Suatu pita (string) berisi kumpulan nama-nama bunga yang dipisahkan oleh spasi dan '–', contoh pita diilustrasikan seperti berikut ini.<br/>Pita: mawar – melati – tulip – teratai – kamboja – anggrek<br/>Buatlah sebuah program yang menerima input sebuah bilangan bulat positif (dan tidak nol) N, kemudian program akan meminta input berupa nama bunga secara berulang sebanyak N kali dan nama tersebut disimpan ke dalam pita.<br/> (Petunjuk: gunakan operasi penggabungan string dengan operator “+”.)<br/>Tampilkan isi pita setelah proses input selesai.<br/>Modifikasi program sebelumnya, proses input akan berhenti apabila user mengetikkan `SELESAI`. Kemudian tampilkan isi pita beserta banyaknya bunga yang ada di dalam pita<br/>

```go
package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
	"strconv"
)

func main() {
	// Membuat reader untuk membaca input dari pengguna
	reader := bufio.NewReader(os.Stdin)

	// Meminta input jumlah bunga yang akan dimasukkan (bilangan bulat positif N)
	fmt.Print("N: ")
	var N int
	for {
		// Baca input dari pengguna
		input, err := reader.ReadString('\n')
		if err != nil {
			fmt.Printf("Error membaca input: %v", err)
			return
		}

		// Konversi input ke integer
		N, err = strconv.Atoi(strings.TrimSpace(input))
		if err != nil || N <= 0 {
			fmt.Println("Harap masukkan bilangan bulat positif.")
		} else {
			break
		}
	}

	// Inisialisasi variabel pita (string) untuk menyimpan nama 33bunga
	var pita string
	var count int 

	// Loop untuk menerima input nama bunga sebanyak N kali
	for i := 1; i <= N; i++ {
		fmt.Printf("Bunga %d: ", i) 

		// Membaca input dari pengguna
		input, err := reader.ReadString('\n')
		if err != nil {
			fmt.Printf("Error: %v", err)
			return // Keluar dari program jika ada kesalahan
		}

		// Menghapus spasi dan karakter newline dari input
		input = strings.TrimSpace(input)

		// Cek jika pengguna mengetik "SELESAI"
		if strings.ToUpper(input) == "SELESAI" {
			break 
		}

		// Menggabungkan nama bunga dengan pita menggunakan " – " sebagai pemisah
		if pita == "" {
			pita = input 
		} else {
			pita = pita + " – " + input // Jika sudah ada isinya, tambahkan dengan pemisah " – "
		}

		count++ // Menambah jumlah bunga yang dimasukkan
	}

	// Menampilkan isi pita dan bunga setelah semua input dimasukkan
	fmt.Println("Pita:", pita)
	fmt.Printf("Bunga: %d\n", count)

	// Tambahkan fitur baru: menampilkan nama bunga yang paling panjang
	var longestFlower string
	maxLength := 0
	for _, flower := range strings.Split(pita, " – ") {
		if len(flower) > maxLength {
			maxLength = len(flower)
			longestFlower = flower
		}
	}
	fmt.Printf("Bunga terpanjang: %s\n", longestFlower)
}
```
### Output: ![Screenshot Output unguided 1](output- unguided1.png)

Menjawab
Program ini adalah aplikasi sederhana yang dirancang untuk mengumpulkan dan menampilkan informasi tentang bunga-bunga yang dimasukkan oleh pengguna. Berikut adalah deskripsi singkatnya:
Tujuan
Mengumpulkan Nama Bunga : Mengumpulkan nama-nama bunga dari pengguna.
Menampilkan Informasi : Menampilkan informasi tentang bunga-bunga yang telah dimasukkan, termasuk isi pita dan jumlah bunga.
Menemukan Bunga Terpanjang : Menemukan dan menampilkan nama bunga yang paling panjang..<br/>

### 2. Setiap hari Pak Andi membawa banyak barang belanjaan dari pasar dengan mengendarai sepeda motor. Barang belanjaan tersebut dibawa dalam kantong terpal di kiri-kanan motor. Sepeda motor tidak akan oleng jika selisih berat barang di kedua kantong sisi tidak lebih dari 9 kg. Buatlah program Pak Andi yang menerima input dua buah bilangan real positif yang menyatakan berat total masing-masing isi kantong terpal. Program akan terus meminta input bilangan tersebut hingga salah satu kantong terpal berisi 9 kg atau lebih.<br/>Pada modifikasi program tersebut, program akan menampilkan true jika selisih kedua isi kantong lebih dari atau sama dengan 9 kg. Program berhenti memproses apabila total berat isi kedua kantong melebihi 150 kg atau salah satu kantong beratnya negatif.

# Sebelum di modifikasi

```go
package main

import (
	"fmt"
)

func main() {
	var beratKiri, beratKanan float64

	for {
		// Menerima input berat kedua kantong dalam satu baris
		fmt.Print("Masukan berat belanjaan di kedua kantong: ")
		fmt.Scan(&beratKiri, &beratKanan)

		// Cek jika salah satu kantong mencapai atau lebih dari 9 kg
		if beratKiri >= 9 || beratKanan >= 9 {
			fmt.Println("Proses selesai.")
			break
		}

		// Hitung selisih berat antara kantong kiri dan kanan
		selisih := beratKiri - beratKanan
		if selisih < 0 {
			selisih = -selisih
		}

		// Cek apakah selisih berat melebihi 9 kg
		if selisih > 9 {
			fmt.Println("Selisih berat antara kantong kiri dan kanan melebihi 9 kg.")
		}
	}
}

```
## Output:![image](https://github.com/user-attachments/assets/e28b4ab7-67eb-499e-b445-28104b997a8f)<br/>

# Setelah di modifikasi

```go
package main

import (
	"fmt"
)

func main() {
	var beratKiri, beratKanan float64

	for {
		// Menerima input berat kedua kantong dalam satu baris
		fmt.Print("Masukan berat belanjaan di kedua kantong: ")
		fmt.Scan(&beratKiri, &beratKanan)

		// Cek jika salah satu kantong memiliki berat negatif
		if beratKiri < 0 || beratKanan < 0 {
			fmt.Println("Proses selesai.")
			break
		}

		// Cek jika total berat kedua kantong melebihi 150 kg
		totalBerat := beratKiri + beratKanan
		if totalBerat > 150 {
			fmt.Println("Proses selesai.")
			break
		}

		// Hitung selisih berat antara kantong kiri dan kanan
		selisih := beratKiri - beratKanan
		if selisih < 0 {
			selisih = -selisih
		}

		// Menampilkan hasil apakah sepeda motor akan oleng atau tidak
		if selisih >= 9 {
			fmt.Println("Sepeda motor Pak Andi akan oleng: true")
		} else {
			fmt.Println("Sepeda motor Pak Andi akan oleng: false")
		}
	}
}
```
### Output: ![Screenshot Output unguided 2](output- unguided2.png)<br/>

Input : Pengguna memasukkan berat kantong kiri dan kanan, misalnya .70 60
Output : Program menghitung selisih dan menentukan stabilitas sepeda motor berdasarkan input tersebut.
Program ini dirancang untuk membantu pengguna memahami bagaimana perbedaan berat dapat mempengaruhi stabilitas saat berkendara dengan sepeda motor.

### 3. Diberikan sebuah persamaan sebagai berikut ini.<br/>
![image](https://github.com/user-attachments/assets/ddea519e-dd44-437b-9403-a5d66b26462a)<br/>
Buatlah sebuah program yang menerima input sebuah bilangan sebagai K, kemudian menghitung dan menampilkan nilai f(K) sesuai persamaan di atas. Akar 2 merupakan bilangan Irasional. Meskipun demikian, nilai tersebut dapat dihampiri dengan rumus beriku:<br/>
![image](https://github.com/user-attachments/assets/f174cfd9-2bc7-4383-8cae-d87a9d80648a)<br/>
Modifikasi program sebelumnya yang menerima input integer K dan menghitung akar 2 untuk K tersebut. Hampiran akar 2 dituliskan dalam ketelitian 10 angka di belakang koma.

```go
package main

import (
	"fmt"
)

// Fungsi untuk menghitung nilai hampiran akar 2 berdasarkan iterasi K
func calculateSqrt2(k int) float64 {
	product := 1.0 

	// Iterasi dari 0 hingga K
	for i := 0; i <= k; i++ {
		numerator := (4*float64(i) + 2) * (4*float64(i) + 2) 
		denominator := (4*float64(i) + 1) * (4*float64(i) + 3) 
		product *= numerator / denominator
	}

	return product 
}

func main() {
	var k int

	// Membaca input nilai K
	fmt.Print("Masukkan nilai K: ")
	fmt.Scan(&k)

	// Menghitung nilai hampiran sqrt(2)
	result := calculateSqrt2(k)

	// Menampilkan hasil dengan 10 angka di belakang koma
	fmt.Printf("Nilai akar 2 = %.10f\n", result)

	// Tambahkan fitur baru: menampilkan perbedaan antara nilai hampiran dan nilai sebenarnya
	actualSqrt2 := 1.4142135623730951 
	diff := actualSqrt2 - result
	fmt.Printf("Perbedaan dengan nilai sebenarnya: %.10f\n", diff)
}
```
### Output: ![Screenshot Output unguided 3](output- unguided3.png)

Program ini menggunakan metode iteratif untuk memperkirakan nilai akar 2 dan menampilkan perbedaan antara hasil perkiraan dengan nilai sebenarnya, memberikan gambaran tentang presisi hasil berdasarkan jumlah iterasi.<br/>

### 4. PT POS membutuhkan aplikasi perhitungan biaya kirim berdasarkan berat parsel. Maka, buatlah program BiayaPos untuk menghitung biaya pengiriman tersebut dengan ketentuan sebagai berikut!<br/> Dari berat parsel (dalam gram), harus dihitung total berat dalam kg dan sisanya (dalam gram). Biaya jasa pengiriman adalah Rp. 10.000,- per kg. Jika sisa berat tidak kurang dari 500 gram, maka tambahan biaya kirim hanya Rp. 5,- per gram saja. Tetapi jika kurang dari 500 gram, maka tambahan biaya akan dibebankan sebesar Rp. 15,- per gram. Sisa berat (yang kurang dari 1kg) digratiskan biayanya apabila total berat ternyata lebih dari 10kg.<br/>

```go
package main

import (
	"fmt"
)

func hitungBiayaKirim(berat int) int {
	// Menghitung berat dalam kilogram dan gram
	kg := berat / 1000
	gram := berat % 1000

	// Biaya pengiriman per kilogram
	biayaPerKg := 10000
	biayaTotal := kg * biayaPerKg

	// Biaya tambahan untuk sisa gram
	biayaTambahan := 0
	if kg >= 10 {
		biayaTambahan = 0 // Gratis biaya tambahan jika berat lebih dari 10 kg
	} else {
		if gram >= 500 {
			biayaTambahan = gram * 5 // Rp. 5 per gram jika sisa >= 500 gram
		} else {
			biayaTambahan = gram * 15 // Rp. 15 per gram jika sisa < 500 gram
		}
	}

	// Total biaya
	return biayaTotal + biayaTambahan
}

func main() {
	var berat int

	// Meminta input berat dari pengguna
	fmt.Print("Berat parsel (gram): ")
	fmt.Scan(&berat)

	// Menghitung berat dalam kg dan gram
	kg := berat / 1000
	gram := berat % 1000

	// Menghitung total biaya pengiriman
	biayaPerKg := 10000 * kg
	biayaTambahan := 0

	// Kondisi untuk biaya tambahan berdasarkan sisa berat gram
	if kg >= 10 {
		biayaTambahan = 0 // Gratis biaya tambahan jika lebih dari 10 kg
	} else {
		if gram >= 500 {
			biayaTambahan = gram * 5 // Rp. 5 per gram untuk sisa >= 500 gram
		} else {
			biayaTambahan = gram * 15 // Rp. 15 per gram untuk sisa < 500 gram
		}
	}

	// Menghitung total biaya
	totalBiaya := biayaPerKg + biayaTambahan

	// Menampilkan hasil
	fmt.Printf("Detail berat: %d kg + %d gr\n", kg, gram)
	fmt.Printf("Detail biaya: Rp. %d + Rp. %d\n", biayaPerKg, biayaTambahan)
	fmt.Printf("Total biaya: Rp. %d\n", totalBiaya)
}
```

## Output: ![Screenshot Output unguided 4](output- unguided4.png)

Input : Pengguna memasukkan berat parsel, misalnya gram.1500
Keluaran :
teks
Detail berat: 1 kg + 500 gr
Detail biaya: Rp. 10.000 + Rp. 2.500
Total biaya: Rp. 12.500

Program ini dirancang untuk menghitung biaya pengiriman berdasarkan berat parsel yang diberikan, dengan mempertimbangkan biaya tambahan berdasarkan sisa gram.


### 5. Sebuah bilangan bulat b memiliki faktor bilangan f > 0 jika f habis membagi b. Contoh: 2 merupakan faktor dari bilangan 6 karena 6 habis dibagi 2. <br/> Buatlah program yang menerima input sebuah bilangan bulat b dan b > 1. Program harus dapat mencari dan menampilkan semua faktor dari bilangan tersebut!<br/>
![image](https://github.com/user-attachments/assets/8330a3c8-b137-481a-bfc7-353406f0fcad)<br/>

## Bilangan bulat b > 0 merupakan bilangan prima p jika dan hanya jika memiliki persis dua faktor bilangan saja, yaitu 1 dan dirinya sendiri. <br/> Lanjutkan program sebelumnya. Setelah menerima masukan sebuah bilangan bulat b > 0. Program tersebut mencari dan menampilkan semua faktor bilangan tersebut. Kemudian, program menentukan apakah b merupakan bilangan prima.<br/>

![image](https://github.com/user-attachments/assets/a1a6ef25-8bef-4722-ae96-7037e09a440a)<br/>

```go
package main

import (
	"fmt"
)

func main() {
	var b int

	// Menerima input dari pengguna
	fmt.Print("Masukkan bilangan bulat: ")
	fmt.Scan(&b)

	// Memeriksa apakah b lebih besar dari 0
	if b <= 0 {
		fmt.Println("Bilangan harus lebih besar dari 0.")
		return
	}

	fmt.Printf("Bilangan: %d\nFaktor: ", b)

	factors := []int{} 

	// Mencari faktor dari b
	for i := 1; i <= b; i++ {
		if b%i == 0 {
			factors = append(factors, i)
			if i == b {
				fmt.Print(i)
			} else {
				fmt.Print(i, ", ")
			}
		}
	}

	// Menentukan apakah b adalah bilangan prima
	isPrime := len(factors) == 2

	// Menampilkan hasil
	fmt.Printf("\nPrima: %t\n", isPrime)
}
```

## Output: ![Screenshot Output unguided 5](output- unguided5.png)

Program ini bertujuan untuk menerima masukan bilangan bulat dari pengguna, mencari faktor-faktor dari bilangan tersebut, dan menentukan apakah bilangan bulat tersebut merupakan bilangan prima.Program ini efektif dalam menghitung faktor dari suatu bilangan bulat positif dan menentukan apakah bilangan tersebut adalah bilangan prima. Dengan validasi input yang tepat dan penggunaan struktur kontrol yang sederhana, program ini memberikan informasi yang jelas kepada pengguna tentang bilangan yang dimasukkan.

### KESIMPULAN
Pemrograman bahasa Go didasarkan pada prinsip modular yang memungkinkan pengembangan aplikasi yang terstruktur dan efisien. Berikut adalah penjelasan lebih detail beberapa mengenai aspek penting dari bahasa Go berdasarkan hasil pencarian yang relevan:.<br/>

### REFERENSI
[1] https://go.dev/doc/effective_go
