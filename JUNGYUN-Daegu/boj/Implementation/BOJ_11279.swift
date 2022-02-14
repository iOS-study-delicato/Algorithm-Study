class PriorityQueue {
    var heap: [Int] = []
    private let comparing: (_ upper: Int, _ lower: Int) -> Bool
    
    init(comparing: @escaping (_ upper: Int, _ lower: Int) -> Bool) {
        self.comparing = comparing
    }
    
    func peek() -> Int? {
        return heap.first
    }
    
    func push(_ input: Int) {
        heap.append(input)
        var new = heap.count - 1
        var parent = (new - 1) / 2
        while new > 0 && comparing(heap[new], heap[parent]) {
            heap.swapAt(new, parent)
            new = parent
            parent = (new - 1) / 2
        }
    }
    
    func pop() -> Int? {
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

var pq = PriorityQueue { (upper, lower) -> Bool in
    upper > lower
}

let N = Int(readLine()!)!
var result = [Int]()
for _ in 0..<N {
    let input = Int(readLine()!)!

    if input == 0 {
        result.append(pq.pop() ?? 0)
    } else {
        pq.push(input)
    }
}

for element in result {
    print(element)
}


