// 백준 6603 로또
// https://www.acmicpc.net/problem/6603
// 21.08.19

func combos(startIdx: Int, count: Int) {
    if count == numbersToPick {
        for (idx, isSelect) in selection.enumerated() {
            if isSelect {
                print(numbers[idx], terminator: " ")
            }
            print()
        }
        return
    }

    guard startIdx < selection.count else { return }

    selection[startIdx] = true
    combos(startIdx: startIdx + 1, count: count + 1)
    selection[startIdx] = false
    combos(startIdx: startIdx + 1, count: count)

}

let numbersToPick = 6
var selection = [Bool]()
var numbers = [Int]()


while true {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    guard input.first! != 0 else { break }
    numbers = [Int](input.dropFirst())
    selection = [Bool](repeating: false, count: numbers.count)
    combos(startIdx: 0, count: 0)
}
