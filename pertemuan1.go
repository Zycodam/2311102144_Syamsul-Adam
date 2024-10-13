package main

import "fmt"

func main() {
 correctOrder := []string {"merah", "kuning", "hijau","ungu"}

reader := bufio.NewReader(os.Stdin)
success := true

for i := 1; i <= 5; i++ {
    fmt.printf ("Percobaan %d: ", i)

    input, _ := reader.ReadString('\n')
    input  = string.TrimSpace(input)
    colors := strings. Split (input," ")

    for 
}

}

