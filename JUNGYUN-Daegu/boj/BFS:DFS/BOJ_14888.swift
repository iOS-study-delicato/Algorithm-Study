// BOJ 14888 연산자 끼워넣기
// https://www.acmicpc.net/problem/14888
// 22.03.18

let N = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map { Int($0)! }

let operatorInput = readLine()!.split(separator: " ").map { Int($0)! }
var operators: Dictionary<String, Int> = [:]

for i in 0..<operatorInput.count {
    if i == 0 {
        operators["+"] = operatorInput[i]
    } else if i == 1 {
        operators["-"] = operatorInput[i]
    } else if i == 2 {
        operators["*"] = operatorInput[i]
    } else {
        operators["/"] = operatorInput[i]
    }
}

func divide(num: Int, divisor: Int) -> Int {
    if num < 0 {
        let newVal = ((num * -1) / divisor) * -1
        return newVal
    } else {
        let newVal = num / divisor
        return newVal
    }
}

var max: Int = Int.min
var min: Int = Int.max

func dfs(idx: Int, val: Int) {
    if idx == nums.count {
        if val > max {
            max = val
        }
        
        if val < min {
            min = val
        }
        
        return
    }
    
    for key in operators.keys {
        if operators[key]! > 0 {
            operators[key]! -= 1
            switch key {
            case "+" :
                let newVal = val + nums[idx]
                dfs(idx: idx + 1, val: newVal)
            case "-" :
                let newVal = val - nums[idx]
                dfs(idx: idx + 1, val: newVal)
            case "*" :
                let newVal = val * nums[idx]
                dfs(idx: idx + 1, val: newVal)
            case "/" :
                let newVal = divide(num: val, divisor: nums[idx])
                dfs(idx: idx + 1, val: newVal)
            default: return
            }
            operators[key]! += 1
        }
    }
}

dfs(idx: 1, val: nums[0])

print(max)
print(min)
