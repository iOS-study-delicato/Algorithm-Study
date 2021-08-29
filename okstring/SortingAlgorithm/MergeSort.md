### Merge Sort



- 정렬되지 않은 목록을 여러 하위 목록으로 나누고(Divide)

- 각 하위목록을 재귀적으로 정렬(Conquer)

- 정렬된 하위 목록을 병합하여 새 정렬된 목록을 생성(Combine)

```swift
import Foundation

func merge(l: [Int], r: [Int]) -> [Int] {
    var i = 0
    var j = 0
    var sorted = [Int]()
    while i < l.count && j < r.count {
        if l[i] < r[j] {
            sorted.append(l[i])
            i += 1
        } else {
            sorted.append(r[j])
            j += 1
        }
    }
    if i < l.count {
        sorted.append(contentsOf: l[i...])
    }
    if j < r.count {
        sorted.append(contentsOf: r[j...])
    }
    return sorted
}

func mergeSort(arr: [Int]) -> [Int] {
    if arr.count <= 1 {
        return arr
    }
    let mid = arr.count / 2
    let leftList = Array(arr[0..<mid])
    let rightList = Array(arr[mid..<arr.count])
    let left = mergeSort(arr: leftList)
    let right = mergeSort(arr: rightList)
    return merge(l: left, r: right)
}

print(mergeSort(arr: [3, 2, 4, 1, 2, 3, 5]))
```



- 병합 정렬의 핵심은 **divide and conquer**
- **정렬이 된 array**들을 합치기 때문에 n의 시간복잡도가 든다

