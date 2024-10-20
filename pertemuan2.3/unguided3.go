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