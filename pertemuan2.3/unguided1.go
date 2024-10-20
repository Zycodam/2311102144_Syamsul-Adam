package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
	"strconv"
)

func main() {
	// Membuat reader untuk membaca input dari pengguna
	reader := bufio.NewReader(os.Stdin)

	// Meminta input jumlah bunga yang akan dimasukkan (bilangan bulat positif N)
	fmt.Print("N: ")
	var N int
	for {
		// Baca input dari pengguna
		input, err := reader.ReadString('\n')
		if err != nil {
			fmt.Printf("Error membaca input: %v", err)
			return
		}

		// Konversi input ke integer
		N, err = strconv.Atoi(strings.TrimSpace(input))
		if err != nil || N <= 0 {
			fmt.Println("Harap masukkan bilangan bulat positif.")
		} else {
			break
		}
	}

	// Inisialisasi variabel pita (string) untuk menyimpan nama 33bunga
	var pita string
	var count int 

	// Loop untuk menerima input nama bunga sebanyak N kali
	for i := 1; i <= N; i++ {
		fmt.Printf("Bunga %d: ", i) 

		// Membaca input dari pengguna
		input, err := reader.ReadString('\n')
		if err != nil {
			fmt.Printf("Error: %v", err)
			return // Keluar dari program jika ada kesalahan
		}

		// Menghapus spasi dan karakter newline dari input
		input = strings.TrimSpace(input)

		// Cek jika pengguna mengetik "SELESAI"
		if strings.ToUpper(input) == "SELESAI" {
			break 
		}

		// Menggabungkan nama bunga dengan pita menggunakan " – " sebagai pemisah
		if pita == "" {
			pita = input 
		} else {
			pita = pita + " – " + input // Jika sudah ada isinya, tambahkan dengan pemisah " – "
		}

		count++ // Menambah jumlah bunga yang dimasukkan
	}

	// Menampilkan isi pita dan bunga setelah semua input dimasukkan
	fmt.Println("Pita:", pita)
	fmt.Printf("Bunga: %d\n", count)

	// Tambahkan fitur baru: menampilkan nama bunga yang paling panjang
	var longestFlower string
	maxLength := 0
	for _, flower := range strings.Split(pita, " – ") {
		if len(flower) > maxLength {
			maxLength = len(flower)
			longestFlower = flower
		}
	}
	fmt.Printf("Bunga terpanjang: %s\n", longestFlower)
}