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