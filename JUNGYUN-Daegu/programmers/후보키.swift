// Programmars 2019 KAKAO BLIND RECRUITMENT 후보키
// https://programmers.co.kr/learn/courses/30/lessons/42890
// 21.11.12

var combinations = [[Int]]()

func solution(_ relation:[[String]]) -> Int {
    
    let colSize = Array(0..<relation[0].count)
    var candidateKeys = [[Int]]()
    
    for i in 0..<colSize.count {
        comb(n: colSize, k: i+1, current: 0, pickedArray: [])
    }
    
    outer: for c in combinations {
        let set = Set(c)
    inner: for key in candidateKeys {
        if set.isSuperset(of: key) {
            continue outer
        }
    }
    
    var attributeArrays = [[String]]()
    
    for row in relation {
        var attributeArray = [String]()
        
        for i in c {
            attributeArray.append(row[i])
        }
        
        if !attributeArrays.contains(attributeArray) {
            attributeArrays.append(attributeArray)
        } else {
            break
        }
        
        if attributeArrays.count == relation.count {
            candidateKeys.append(c)
        }
    }
}
    return candidateKeys.count
}

func comb(n: [Int], k: Int, current index: Int, pickedArray: [Int]) {
    if k == 0 {
        combinations.append(pickedArray)
    } else if index == n.count {
        return
    } else {
        var newSelected = pickedArray
        newSelected.append(n[index])
        comb(n: n, k: k - 1, current: index + 1, pickedArray: newSelected)
        comb(n: n, k: k, current: index + 1, pickedArray: pickedArray)
    }
}

