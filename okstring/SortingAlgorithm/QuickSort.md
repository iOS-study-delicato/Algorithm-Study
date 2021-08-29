### Quick Sort

[reference](https://github.com/samyanez94/Swift-Algorithms/blob/master/Quicksort.playground/Sources/Quicksort.swift)

```swift
import Foundation


public func quicksortNaive<T: Comparable>(_ a: [T]) -> [T] {
    guard a.count > 1 else { // 1
        return a
    }
    
    let pivot = a[a.count / 2] // 2
    
    let less = a.filter { $0 < pivot } // 3
    let equal = a.filter { $0 == pivot }
    let greater = a.filter { $0 > pivot }
    
    return quicksortNaive(less) + equal + quicksortNaive(greater)
}


print(quicksortNaive([1, 5, 2, 4, 3]))

```

