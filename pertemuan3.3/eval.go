package main

import "fmt"

func main() {
	// Input:
	// - w, h: original width and height
	// - s: scale symbol ('+' for zoom-in, '-' for zoom-out)
	// - scale: scale factor
	w, h, s, scale := 640, 320, '+', 4
	// Calculate new width and height
	var newW, newH int
	if s == '+' {
		newW = w * scale
		newH = h * scale
	} else {
		newW = w / scale
		newH = h / scale
	}
	// Output:
	// - newW, newH: new width and height
	fmt.Println("New width:", newW)
	fmt.Println("New height:", newH)
}
