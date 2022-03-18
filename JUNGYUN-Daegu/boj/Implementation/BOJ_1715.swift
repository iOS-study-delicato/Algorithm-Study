// BOJ 1715 카드 정렬하기
// https://www.acmicpc.net/problem/1715
// 22.03.14

class PriorityQueue<T: Comparable> {
    var heap: [T] = []
    private let comparing: (_ upper: T, _ lower: T) -> Bool
    
    init(comparing: @escaping (_ upper: T, _ lower: T) -> Bool) {
        self.comparing = comparing
    }
    
    func peek() -> T? {
        return heap.first
    }
    
    func push(_ input: T) {
        heap.append(input)
        var new = heap.count - 1
        var parent = (new - 1) / 2
        while new > 0 && comparing(heap[new], heap[parent]) {
            heap.swapAt(new, parent)
            new = parent
            parent = (new - 1) / 2
        }
    }
    
    func pop() -> T? {
        guard !heap.isEmpty else { return nil }
        
        if heap.count == 1 {
            return heap.removeFirst()
        }
        
        // result is first element of heap. The element will be swapped with the last element, removed from heap at the end
        let result = heap.first
        heap.swapAt(0, heap.count - 1)
        heap.removeLast()
        
        var parent = 0
        
        // move down parent(if smaller than a child)
        while parent < heap.count {
            let left = (parent * 2) + 1
            let right = left + 1
            
            if right < heap.count {
                if comparing(heap[right], heap[left]) {
                    if comparing(heap[right], heap[parent]) {
                        heap.swapAt(right, parent)
                        parent = right
                    } else if comparing(heap[left], heap[parent]){
                        heap.swapAt(left, parent)
                        parent = left
                    } else {
                        break
                    }
                } else {
                    if comparing(heap[left], heap[parent]) {
                        heap.swapAt(left, parent)
                        parent = left
                    } else if comparing(heap[right], heap[parent]) {
                        heap.swapAt(right, parent)
                        parent = right
                    } else {
                        break
                    }
                }
            } else if left < heap.count {
                if comparing(heap[left], heap[parent]) {
                    heap.swapAt(left, parent)
                    parent = left
                } else {
                    break
                }
            } else {
                break
            }
        }
        
        return result
    }
}

let N = Int(readLine()!)!
var result = 0
var pq = PriorityQueue<Int> { upper, lower in
    return upper < lower
}

for _ in 0..<N {
    let next = Int(readLine()!)!
    pq.push(next)
}

while pq.heap.count != 1 {
    let first = pq.pop()!
    let second = pq.pop()!
    
    result += first + second
    pq.push(first + second)
}

print(result)

