// BOJ 14502 연구소
// https://www.acmicpc.net/problem/14502
// 22.01.27

let nm = readLine()!.split(separator: " ").map { Int($0)! }

let height = nm.first!
let width = nm.last!

var lab: Array<[Int]> = []

for _ in 0..<height {
    lab.append(readLine()!.split(separator: " ").map({ Int($0)! }))
}

func create3Walls(lab: [[Int]], w1: Int, w2: Int, w3: Int) -> [[Int]]? {
    var newLab = lab
    let width = lab[0].count
    
    let w1Cor = (row: w1 / width, column: w1 % width)
    let w2Cor = (row: w2 / width, column: w2 % width)
    let w3Cor = (row: w3 / width, column: w3 % width)
    
    if newLab[w1Cor.row][w1Cor.column] != 0 {
        return nil
    } else {
        newLab[w1Cor.row][w1Cor.column] = 1
    }
    
    if newLab[w2Cor.row][w2Cor.column] != 0 {
        return nil
    } else {
        newLab[w2Cor.row][w2Cor.column] = 1
    }
    
    if newLab[w3Cor.row][w3Cor.column] != 0 {
        return nil
    } else {
        newLab[w3Cor.row][w3Cor.column] = 1
    }
    
    return newLab
}

func getSafeArea(of lab: [[Int]]) -> Int {
    
    var labToTest = lab
    var q: [(row: Int, column: Int)] = []
    
    // spread virus
    for r in 0..<height {
        for c in 0..<width {
            
            if labToTest[r][c] == 2 {
                q.append((row: r, column : c))
            } else {
                continue
            }
            
            while !q.isEmpty {
                let next = q.popLast()!
                labToTest[next.row][next.column] = Int.max
                
                let i = next.row
                let j = next.column
                
                if i - 1 >= 0 && (labToTest[i - 1][j] == 2 || labToTest[i - 1][j] == 0) {
                    q.append((row: i - 1, column: j))
                }
                
                if j + 1 < labToTest[0].count && (labToTest[i][j + 1] == 2 || labToTest[i][j + 1] == 0) {
                    q.append((row: i, column: j + 1))
                }
                
                if i + 1 < labToTest.count && (labToTest[i + 1][j] == 2 || labToTest[i + 1][j] == 0) {
                    q.append((row: i + 1, column: j))
                }
                
                if j - 1 >= 0 && (labToTest[i][j - 1] == 2 || labToTest[i][j - 1] == 0) {
                    q.append((row: i, column: j - 1))
                }
                
            }
            
        }
    }
    
    var result = 0
    
    for row in labToTest {
        result += row.filter { $0 == 0 }.count
    }
    
    return result
}

var answer: Int = 0


for i in 0...(height * width) - 3 {
    for j in i + 1...(height * width) - 2 {
        for k in j + 1...(height * width) - 1 {
            if let newLab = create3Walls(lab: lab, w1: i, w2: j, w3: k) {
                answer = max(getSafeArea(of: newLab), answer)
            }
        }
    }
}

print(answer)


