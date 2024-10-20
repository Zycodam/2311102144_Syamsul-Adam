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