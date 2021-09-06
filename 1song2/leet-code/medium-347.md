# LeetCode

## [347. Top K Frequent Elements](https://leetcode.com/problems/top-k-frequent-elements/)

* 난이도: Medium
* 풀이 언어: Swift
* 문제 요약: 주어진 배열에서 가장 자주 나오는 요소를 k번째까지 반환

### 코드

##### `Dictionary` 사용 풀이

```swift
class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dict = [Int: Int]()
        for num in nums {
            dict[num] = (dict[num] ?? 0) + 1
        }
        let sorted = dict.sorted { $0.value > $1.value }
        return (0..<k).map { sorted[$0].key }
    }
}

// `grouping`을 사용해서 한줄로도 표현할 수 있다!
class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        return Dictionary(grouping: nums) { $0 }
            .sorted { $0.value.count > $1.value.count }
            .prefix(k)
            .map { $0.key }
    }
}
```

##### Quickselect 사용 풀이

```swift
class Solution {
    var dict = [Int: Int]()
    var unique = [Int]()

    func swap(_ a: Int, _ b: Int) {
        let temp = unique[a]
        unique[a] = unique[b]
        unique[b] = temp
    }

    func quickselect(_ left: Int, _ right: Int, _ kSmallest: Int) {
        /*
        Sort a list within left..right till kth less frequent element
        takes its place.
        */

        // base case: the list contains only one element
        if left == right { return }

        // select a random pivot_index
        let randomNum = Int.random(in: 0..<right - left)
        var pivotIndex = left + randomNum

        // find the pivot position in a sorted list
        pivotIndex = partition(left, right, pivotIndex)

        // if the pivot is in its final sorted position
        if kSmallest == pivotIndex {
            return
        } else if kSmallest < pivotIndex {
            // go left
            quickselect(left, pivotIndex - 1, kSmallest)
        } else {
            // go right
            quickselect(pivotIndex + 1, right, kSmallest)
        }
    }

    func partition(_ left: Int, _ right: Int, _ pivotIndex: Int) -> Int {
        let pivotFrequency = dict[unique[pivotIndex]]!
        // 1. move pivot to end
        swap(pivotIndex, right)
        var storeIndex = left

        // 2. move all less frequent elements to the left
        for i in left...right {
            if dict[unique[i]]! < pivotFrequency {
                swap(storeIndex, i)
                storeIndex += 1
            }
        }

        // 3. move pivot to its final place
        swap(storeIndex, right)

        return storeIndex
    }

    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        // build hash map : character and how often it appears
        for num in nums {
            dict[num] = (dict[num] ?? 0) + 1
        }
        // array of unique elements
        unique = dict.map { $0.key }

        // kth top frequent element is (n - k)th less frequent.
        // Do a partial sort: from less frequent to the most frequent, till
        // (n - k)th less frequent element takes its place (n - k) in a sorted array.
        // All element on the left are less frequent.
        // All the elements on the right are more frequent.
        let n = dict.count
        quickselect(0, n - 1, n - k)
        // Return top k frequent elements
        return Array(unique.suffix(k))
    }
}
```

### 회고

* Quickselect 풀이는 문제와 함께 제공되는 [Solution](https://leetcode.com/problems/top-k-frequent-elements/solution/)을 참고했다.
* 제출한 어떤 풀이든 런타임은 96 ms, 메모리는 16 MB 정도에 머물렀다. 더 효율이 좋은 풀이가 있는걸까? 🤔