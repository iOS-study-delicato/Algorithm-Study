import Foundation

func solution(_ record:[String]) -> [String] {
    var result: [String] = []
    let behavior = ["Enter", "Leave", "Change"]
    var dict: [String: String] = [:]
    
    for r in record {
        let input = r.split(separator: " ").map { String($0) }
        
        if input[0] == behavior[0] {
            dict[input[1]] = input[2]
            result.append("\(input[1]) \(behavior[0])")
        } else if input[0] == behavior[1] {
            result.append("\(input[1]) \(behavior[1])")
        } else {
            dict[input[1]] = input[2]
        }
    }
    
    return result.map { s in
        let i = s.split(separator: " ").map { String($0) }
        let j = i[1] == behavior[0] ? "님이 들어왔습니다." : "님이 나갔습니다."
        return "\(dict[i[0]]!)\(j)"
    }
}
