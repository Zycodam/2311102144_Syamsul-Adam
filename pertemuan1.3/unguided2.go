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