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
