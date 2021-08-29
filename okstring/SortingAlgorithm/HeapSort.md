### Heap Sort(힙 정렬)

```swift
import Foundation

//힙 생성 알고리즘(Heapify Algorithm)
//로그2의n * n/2 - n log n
func heapify(unsorted: inout [Int], index: Int, heapSize: Int) {
    var largest = index
    let leftIndex = 2 * index + 1
    let rightIndex = 2 * index + 2
    
    if leftIndex < heapSize && unsorted[leftIndex] > unsorted[largest] {
        largest = leftIndex
    }
    if rightIndex < heapSize && unsorted[rightIndex] > unsorted[largest] {
        largest = rightIndex
    }
    if largest != index {
        unsorted.swapAt(largest, index)
        heapify(unsorted: &unsorted, index: largest, heapSize: heapSize)
    }
}

func heapSort(arr: [Int]) -> [Int] {
    let count = arr.count
    var unsorted = arr
    //꼬꼬마 빼고
    for i in stride(from: count / 2 - 1, through: 0, by: -1) {
        heapify(unsorted: &unsorted, index: i, heapSize: count)
    }
    for i in stride(from: count - 1, through: 0, by: -1) {
        unsorted.swapAt(0, i)
        heapify(unsorted: &unsorted, index: 0, heapSize: i)
    }
    return unsorted
}

print(heapSort(arr: [5, 3, 16, 2, 10, 14]))

```



힙 정렬이 가장 유용한 경우는 전체 자료를 정렬하는 것이 아니라 **가장 큰 값 몇개만 필요할 때**

우선순위 큐는 "리스트"나 "맵"과 같이 추상적인 개념이다

**우선순위 큐(Priority Queue)는 들어간 순서에 상관없이** **우선순위가 높은 데이터가 먼저 나오는 것**

