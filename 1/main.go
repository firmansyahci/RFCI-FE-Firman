package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Scan()

	dataInput := strings.Split(scanner.Text(), " ")
	numbers := ArrayStringToInt(dataInput)
	Sort(numbers)
}

func Sort(numbers []int) {
	var no int
	for i := len(numbers); i > 0; i-- {
		for j := 1; j < i; j++ {
			if numbers[j-1] > numbers[j] {
				temp := numbers[j]
				numbers[j] = numbers[j-1]
				numbers[j-1] = temp
				no++
				fmt.Printf("%v. [%v, %v] -> %v \n", no, numbers[j-1], numbers[j], numbers)
			}
		}
	}
	fmt.Printf("Jumlah swap: %v \n", no)
}

func ArrayStringToInt(data []string) []int {
	result := []int{}

	for _, v := range data {
		n, _ := strconv.Atoi(v)
		result = append(result, n)
	}

	return result
}
