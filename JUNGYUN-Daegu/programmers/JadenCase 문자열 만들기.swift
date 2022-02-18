// 프로그래머스 JadenCase 문자열 만들기
// https://programmers.co.kr/learn/courses/30/lessons/12951
// 22.02.16

func solution(_ s:String) -> String {
    var ans = ""
    var toUppercase = true
    
    for char in s {
        if char != " " {
            if toUppercase {
                if let _ = Int(String(char)) {
                    ans += String(char)
                } else {
                    ans += String(char.uppercased())
                }
                toUppercase = false
            } else {
                ans += String(char.lowercased())
            }
        } else {
            ans += " "
            toUppercase = true
        }
    }

    return ans
}



