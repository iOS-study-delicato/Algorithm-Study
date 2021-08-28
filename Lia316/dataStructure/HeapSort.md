# Data Strucure

### Heap Sort

: Heap Sort 직접 구현해보기


### 코드

```swift
import Foundation

protocol Initable {
    init()
}

class Heap<T> where T: Initable & Comparable {
    
    private(set) var heap : [T]
    
    init() {
        self.heap = [T()]
    }
    
}


extension Heap {
    
    private func swap(_ a: Int, _ b: Int) {
        let temp = heap[a]
        heap[a] = heap[b]
        heap[b] = temp
    }
    
    func insert(_ element: T) {
        var childIndex = heap.count
        var parentIndex = childIndex / 2
        
        // 1. 마지막 위치에 새 element 삽입
        heap.append(element)
        
        // 2. 자식 노드 > 부모 노드 일때 서로 교환
        while(heap[childIndex] > heap[parentIndex] && parentIndex > 0) {
            swap(childIndex, parentIndex)
            
            childIndex = parentIndex
            parentIndex /= 2
        }
    }
    
    func removeTop() -> T {
        let rootNode = heap[1]
        var parentIndex = 1
        var childIndex : Int
        
        // 1. 루트 노드 삭제 (마지막 노드로 채워넣기)
        if heap.count > 2 { heap[1] = heap.removeLast() }
        
        switch heap.count {
        case 3: childIndex = 2
        case 2: return rootNode
        case 1: return rootNode
        default: childIndex = heap[2] > heap[3] ? 2 : 3
        }
        
        // 2. 삽입 노드 < 자식 노드(둘 중 큰 값) 일때 서로 교환
        while(heap[childIndex] > heap[parentIndex]) {
            swap(childIndex, parentIndex)
            
            parentIndex = childIndex
            let nextIdx = childIndex * 2
            
            if nextIdx >= heap.count {
                return rootNode
            } else if nextIdx == heap.count - 1 {
                childIndex = nextIdx
            } else {
                childIndex = heap[nextIdx] > heap[nextIdx + 1] ? nextIdx : nextIdx + 1
            }
        }
        return rootNode
    }
    
    static func sort(_ arr: [T]) -> [T] {
        let heap = Heap<T>()
        var result = [T]()
        
        for i in arr {
            heap.insert(i)
        }
        for _ in arr {
            result.append(heap.removeTop())
        }
        return result
    }
    
}

extension Int: Initable {
}

func test() {
    let integers = [2, 5, 4, 8, 2, 1, 3, 4, 9, 11, 15, 3, 6]
    let sortedInt = [15, 11, 9, 8, 6, 5, 4, 4, 3, 3, 2, 2, 1]
    print(Heap<Int>.sort(integers) == sortedInt)
}
```



### 설명

- 내림차순 정렬을 위한 최대힙(완전이진트리) 구현
- `부모 노드 = 자식노드 / 2`
- `자식 노드 = 부모 노드 * 2  or  부모 노드 * 2 + 1`

- 삽입 or 삭제 :  부모 노드 < 자식 노드일 때 정렬
  - 삽입 :  가장 마지막 노드에 새로운 노드 삽입
  - 삭제 :  루트 노드 삭제, 그 자리를 마지막 노드로 채움
