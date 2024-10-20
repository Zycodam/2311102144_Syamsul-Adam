package main 
import "fmt"

// Prosedur untuk mencetak deret
func cetakDeret(n int) {
	for n != 1 {
		fmt.Printf("%d ", n)
		if n%2 == 0 {
			n /= 2
		} else {
			n = 3*n + 1
		}
	}
	// Cetak angka terakhir (1)
	fmt.Printf("%d\n", n)
}

func main() {
	var n int

	// Input bilangan awal
	fmt.Print("Masukkan nilai: ")
	fmt.Scan(&n)

	// Cetak deret
	cetakDeret(n)
}