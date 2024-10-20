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