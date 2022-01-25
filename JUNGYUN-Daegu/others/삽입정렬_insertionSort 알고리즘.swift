
func insertionSort(seq: inout [Int]) {
    
    for i in 0..<seq.count {
        for j in stride(from: i + 1, to: 0, by: -1) {
            
            if i + 1 == seq.count {
                return
            }
            
            if seq[j] < seq[j - 1] {
                seq.swapAt(j, j - 1)
            } else {
                break
            }
            
        }
    }
}

var testCases = [[1,2,3,4],
                 [4,3,2,1],
                 [-9,-8,-7,1],
                 [99,9,0,1,3]]

for i in 0..<testCases.count {
    insertionSort(seq: &testCases[i])
    print(testCases[i])
}

