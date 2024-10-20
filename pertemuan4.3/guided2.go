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