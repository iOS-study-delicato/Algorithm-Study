// 시간 초과 풀이 !!

// BOJ 18258 큐 2
// https://www.acmicpc.net/problem/18258
// 22.03.10

import Foundation

let N = Int(readLine()!)!

var enque = [Int]()
var deque = [Int]()

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { $0 }
    
    switch input.first! {
    case "push":
        enque.append(Int(input.last!)!)
    case "pop":
        if deque.isEmpty {
            deque = enque.reversed()
            enque = []
            if deque.isEmpty {
                print("-1")
            } else {
                print(deque.popLast()!)
            }
        } else {
            print(deque.popLast()!)
        }
    case "size":
        print(enque.count + deque.count)
    case "empty":
        if enque.isEmpty && deque.isEmpty {
            print("1")
        } else {
            print("0")
        }
    case "front":
        if deque.isEmpty {
            if enque.isEmpty {
                print("-1")
            } else {
                print(enque.first!)
            }
        } else {
            print(deque.last!)
        }
    case "back":
        if enque.isEmpty {
            if deque.isEmpty {
                print("-1")
            } else {
                print(deque.first!)
            }
        } else {
            print(enque.last!)
        }
    default:
        print("INVALID INPUT")
    }
}
