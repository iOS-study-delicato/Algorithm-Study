
// 프로그래머스 스택/큐 > 다리를 지나는 트럭
// https://programmers.co.kr/learn/courses/30/lessons/42583
// 21.12.31

import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var time: Int = 0
    var bridge: [(progress: Int, weight: Int)] = []
    // make sure making reversed collection into actual array to proceed
    var q = Array(truck_weights.reversed())
    // trucks passed through the bridged
    var stack = [Int]()
    
    func currentBridgeWeight() -> Int {
        var result: Int = 0
        
        for truck in bridge {
            result += truck.weight
        }
        
        return result
    }
    
    func moveTrucksOnBridgeForward() {
        for i in 0..<bridge.count {
            bridge[i].progress += 1
        }
    }
    
    while stack.count < truck_weights.count {
        
        if bridge.count > 0 {
            let firstTruck = bridge[0]
            
            if firstTruck.progress == bridge_length {
                stack.append(bridge.removeFirst().weight)
            }
        }
        
        if let nextTruck = q.popLast() {
            if nextTruck + currentBridgeWeight() <= weight && bridge.count + 1 <= bridge_length {
                bridge.append((progress: 0, weight: nextTruck))
            } else {
                q.append(nextTruck)
            }
        }
        
        moveTrucksOnBridgeForward()
        time += 1
    }
    
    return time
}

