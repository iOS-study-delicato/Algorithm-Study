
import Foundation

let size = readLine()!
let blocks = readLine()!

let height = Int(size.split(separator: " ").first!) ?? 0
let width = Int(size.split(separator: " ").last!) ?? 0

var blockArray = blocks.split(separator: " ").map { (string) -> Int in
    return Int(String(string)) ?? 0
}

func findStartIndex(newStart: Int) -> Int {
    var startIndex = newStart
    for i in newStart..<width {
        startIndex = i
        if i < width - 1 && blockArray[i] <= blockArray[i + 1] {
            continue
        } else if blockArray[i] == 0 {
            continue
        } else {
            break
        }
    }
    return startIndex
}

func findEndIndex(with startIndex: Int) -> Int? {
    var result: Int? = nil
    
    for i in startIndex + 1..<width {
        if blockArray[i] >= blockArray[startIndex] {
            result = i
            break
        }
        
        if blockArray[i - 1] >= blockArray[i] {
            continue
        } else {
            if result != nil {
                result = blockArray[result!] >= blockArray[i] ? result : i
            } else {
                result = i
            }
            
            if i < width - 1 && blockArray[i] <= blockArray[i + 1] {
                continue
            }
        }
    }
    return result
}

func calculateWateryBlockSize(startIndex: Int, endIndex: Int) -> Int {
    let wallHeight = min(blockArray[startIndex], blockArray[endIndex])
    var tempResult = 0
    
    for i in startIndex...endIndex {
        var depth = wallHeight - blockArray[i]
        depth = depth < 0 ? 0 : depth
        tempResult += depth
    }
    
    return tempResult
}

func process() -> Int {
    var result = 0
    
    var startIndex = 0
    var endIndex: Int? = 0
    
    while endIndex != nil {
        startIndex = findStartIndex(newStart: endIndex!)
        
        if startIndex >= width - 2 { break }
        endIndex = findEndIndex(with: startIndex)
        if endIndex == nil { break }

        result += calculateWateryBlockSize(startIndex: startIndex, endIndex: endIndex!)
    }
    
    return result
}

print(process())
