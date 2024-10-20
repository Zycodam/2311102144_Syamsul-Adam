package main

import (
	"fmt"
	"math"
)

// Fungsi untuk menghitung jarak antara dua titik (a, b) dan (c, d)
func jarak(a, b, c, d float64) float64 {
	return math.Sqrt(math.Pow(a-c, 2) + math.Pow(b-d, 2))
}

// Fungsi untuk menentukan apakah titik (x, y) berada di dalam lingkaran dengan pusat (cx, cy) dan radius r
func didalam(cx, cy, r, x, y float64) bool {
	return jarak(cx, cy, x, y) <= r
}

// Fungsi untuk mengecek posisi titik terhadap dua lingkaran
func checkPosition(cx1, cy1, r1, cx2, cy2, r2, x, y float64) string {
	inCircle1 := didalam(cx1, cy1, r1, x, y)
	inCircle2 := didalam(cx2, cy2, r2, x, y)

	if inCircle1 && inCircle2 {
		return "Titik di dalam lingkaran 1 dan 2"
	} else if inCircle1 {
		return "Titik di dalam lingkaran 1"
	} else if inCircle2 {
		return "Titik di dalam lingkaran 2"
	} else {
		return "Titik di luar lingkaran 1 dan 2"
	}
}

func main() {
	var cx1, cy1, r1, cx2, cy2, r2, x, y float64

	// Masukkan data sesuai dengan format yang diberikan
	fmt.Println("Masukkan koordinat pusat dan radius lingkaran 1:")
	fmt.Scan(&cx1, &cy1, &r1)

	// Validasi input radius
	for r1 < 0 {
		fmt.Println("Radius tidak boleh negatif. Silakan masukkan nilai yang valid.")
		fmt.Scan(&r1)
	}

	fmt.Println("Masukkan koordinat pusat dan radius lingkaran 2:")
	fmt.Scan(&cx2, &cy2, &r2)

	// Validasi input radius
	for r2 < 0 {
		fmt.Println("Radius tidak boleh negatif. Silakan masukkan nilai yang valid.")
		fmt.Scan(&r2)
	}

	fmt.Println("Masukkan koordinat titik sembarang:")
	fmt.Scan(&x, &y)

	// Cek posisi titik sembarang
	result := checkPosition(cx1, cy1, r1, cx2, cy2, r2, x, y)
	fmt.Println(result)
}