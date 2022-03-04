import Foundation

//MARK: - Using Built in API
func convert1(n: Int, radix: Int) -> String {
    return String(n, radix: radix)
}

print(convert1(n: 25, radix: 2))

func convertToDecimal1(n: String, radix: Int) -> Int {
    // this time radix papam receive radix value of the source, not the target
    let decimal: Int = Int(n, radix: 2)!
    return decimal
}

//MARK: - Custom Conversion
func convert2(n: Int, radix: Int) -> String {
    var result: [Int] = []
    var n = n
    
    while n != 0 {
        result.append(n % radix)
        n /= radix
    }
    
    return result.reversed().map {String($0)}.joined()
}

print(convert2(n: 25, radix: 2))

func convertToDecimal2(n: String, radix: Int) -> Int {
    let n = n.map{ $0 }.reversed()
    var result = 0
    
    for (i, c) in n.enumerated() {
        let num = Int(String(c))!
        result += num * Int((pow(Double(radix), Double(i))))
    }
    return result
}

print(convertToDecimal2(n: "11001", radix: 2))

// note that conversion from other radix to decimal returns Integer
// note that this does not work when n is too long (implying result decimal number is greater than compiler's capacity)
// in that case, you may divide the string into chucks (divide and conquer)
// example: https://github.com/JUNGYUN-Daegu/Algorithm-Study/blob/master/JUNGYUN-Daegu/boj/Math/BOJ_1373.swift
