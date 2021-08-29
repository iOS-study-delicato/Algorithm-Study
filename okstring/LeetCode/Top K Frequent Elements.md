### Top K Frequent Elements



### 시간복잡도를 고려하지 않은 오답

```swift
class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        let dict = Dictionary(grouping: nums, by: { $0 })
        return dict
            .sorted(by: { $0.value.count > $1.value.count })
            .prefix(k)
            .map({ Int($0.key) })
    }
}
```





### 힙정렬

```swift
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
    for i in stride(from: count / 2 - 1, through: 0, by: -1) {
        heapify(unsorted: &unsorted, index: i, heapSize: count)
    }
    for i in stride(from: count - 1, through: 0, by: -1) {
        unsorted.swapAt(0, i)
        heapify(unsorted: &unsorted, index: 0, heapSize: i)
    }
    return unsorted
}
```



### 답안

