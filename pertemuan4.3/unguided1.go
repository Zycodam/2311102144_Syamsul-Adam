package main
import (
	"fmt"
)

// Prosedur untuk menghitung faktorial dari suatu bilangan bulat positif.
func faktorial(n int, hasil *int) {
	*hasil = 1
	if n == 0 {
		*hasil = 1
		return
	}
	for i := 1; i <= n; i++ {
		*hasil *= i
	}
}

// Prosedur untuk menghitung permutasi dari n terhadap r, dengan n >= r.
func permutasi(n, r int, hasil *int) {
	var fn, fnr int
	faktorial(n, &fn)
	faktorial(n-r, &fnr)
	*hasil = fn / fnr
}

// Prosedur untuk menghitung kombinasi dari n terhadap r, dengan n >= r.
func kombinasi(n, r int, hasil *int) {
	var fn, fr, fnr int
	faktorial(n, &fn)
	faktorial(r, &fr)
	faktorial(n-r, &fnr)
	*hasil = fn / (fr * fnr)
}

func main() {
	// Input empat bilangan asli a, b, c, d
	var a, b, c, d int
	fmt.Print("Masukkan 4 bilangan: ")
	fmt.Scan(&a, &b, &c, &d)

	// Variabel untuk menyimpan hasil permutasi dan kombinasi
	var x1, y1, x2, y2 int

	// Baris pertama: permutasi dan kombinasi a terhadap c
	permutasi(a, c, &x1)
	kombinasi(a, c, &y1)
	fmt.Printf("%d %d\n", x1, y1)

	// Baris kedua: permutasi dan kombinasi b terhadap d
	permutasi(b, d, &x2)
	kombinasi(b, d, &y2)
	fmt.Printf("%d %d\n", x2, y2)
}