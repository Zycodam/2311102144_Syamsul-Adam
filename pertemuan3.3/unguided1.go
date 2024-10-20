package main

import (
	"fmt"
)

// Fungsi untuk menghitung faktorial
func factorial(x int) int {
	if x == 0 {
		return 1
	}
	result := 1
	for i := 1; i <= x; i++ {
		result *= i
	}
	return result
}

// Fungsi untuk menghitung permutasi
func permutation(y, z int) int {
	return factorial(y) / factorial(y-z)
}

// Fungsi untuk menghitung kombinasi
func combination(w, v int) int {
	return factorial(w) / (factorial(v) * factorial(w-v))
}

func main() {
	// Input empat bilangan: e, f, g, h
	var e, f, g, h int
	fmt.Print("Masukkan 4 bilangan: ")
	fmt.Scan(&e, &f, &g, &h)

	// Baris pertama: permutasi dan kombinasi e terhadap g
	p1 := permutation(e, g)
	c1 := combination(e, g)
	fmt.Printf("%d %d\n", p1, c1)

	// Baris kedua: permutasi dan kombinasi f terhadap h
	p2 := permutation(f, h)
	c2 := combination(f, h)
	fmt.Printf("%d %d\n", p2, c2)
}

