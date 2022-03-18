// 프로그래머스 > 2018 KAKAO BLIND RECRUITMENT > [1차] 추석 트래픽
// https://programmers.co.kr/learn/courses/30/lessons/17676
// 22.03.12

func solution(_ lines:[String]) -> Int {
    var dayInSeconds = Array(repeating: 0, count: 86400)
    
    for line in lines {
        let info = line.split(separator: " ")
        
        // need to format these
        let completed = info[1]
        let time = info[2]
    }
    
    return dayInSeconds.max()!
}
