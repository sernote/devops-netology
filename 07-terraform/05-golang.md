Задание 3. \
перевода метров в футы:
````
package main

import "fmt"

func main() {
    fmt.Print("Enter a number: ")
    var input float64
    fmt.Scanf("%f", &input)

    output := input * 0.3048

    fmt.Println(output)    
}
````
наименьший элемент в любом заданном списке:
````
package main

import "fmt"
import "sort"

func main() {

	x := []int{48,96,86,68,57,82,63,70,37,34,83,27,19,97,9,17,}
	
	fmt.Println(FindMin(x))    
}

func FindMin(list []int) int {
	
	if len(list) == 0 {
		panic("Список не должен быть пустым")
	}
	
	sort.Ints(list)
	return list[0]
}
````
числа от 1 до 100, которые делятся на 3:
````
package main

import "fmt"

func main() {
	
	var resultList []int

	for i := 1; i < 100; i++{
        	if i % 3 == 0 {
			resultList = append(resultList, i)
	}
    }
		
	fmt.Println(resultList)    
}
````

