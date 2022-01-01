// BOJ 9251 LCS
// https://www.acmicpc.net/problem/9251
// 21.12.03

//import Foundation

var A = readLine()!.map { String($0) }
var B = readLine()!.map { String($0) }

var table = Array(repeating: Array(repeating: 0, count: B.count + 1), count: A.count + 1)
/*
if a = bd, b = abcd
            a b c d
        0   1 2 3 4
        ----------
    0 | 0   0 0 0 0
b   1 | 0   0 1 1 1
d   2 | 0   0 1 1 2
 */

// filling table
for j in 1..<table[0].count {
    for i in 1..<table.count {
        if A[i - 1] == B[j - 1] {
            table[i][j] = 1 + table[i-1][j-1]
        } else {
            table[i][j] = max(table[i-1][j], table[i][j-1])
        }
    }
}

// then what is longest subsequence?
// you need to trace back the table
// 2 :d -> since both [i][j-1], [i-1][j] are 1, trace back to [i-1][j-1]
// 1 :c -> since the 1 was comming from [i][j-1], skip this and go to [i][j-1]
// 1 :b -> since both [i][j-1], [i-1][j] are 0, trace back to [i-1][j-1]
//result: bd

print(table[A.count][B.count])
