// Leetcode > 47. Permutations II
// https://leetcode.com/problems/permutations-ii/
// 22.03.02

func disjointSetAlgorithm() {
    let numCount: Int = Int(readLine()!)!
    let commandCount: Int = Int(readLine()!)!
    var par: [Int] = Array(repeating: 0, count: numCount + 1)
    
    for i in 1...numCount {
        par[i] = i
    }
    
    func find(node: Int) -> Int {
        // is root node of group
        if par[node] == node {
            return node
        } else {
            return find(node: par[node])
        }
    }
    
    func union(x: Int, y: Int) {
        par[find(node: y)] = find(node: x)
    }
    
    for _ in 0..<commandCount {
        let input: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
        let cmd = input[0]
        let x = input[1]
        let y = input[2]
        
        // union command
        if cmd == 1 {
            union(x: x, y: y)
        // tell if same group
        } else {
            if find(node: x) == find(node: y) {
                print(1)
            } else {
                print(0)
            }
        }
    }
}

/*
 test case
 5
 8
 1 1 2
 1 3 4
 1 4 5
 2 3 4
 Output(1)
 2 2 4
 Output(0)
 1 2 4
 2 3 4
 Output(1)
 2 1 5
 Output(1)
 */

disjointSetAlgorithm()

