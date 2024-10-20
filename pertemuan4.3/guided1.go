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