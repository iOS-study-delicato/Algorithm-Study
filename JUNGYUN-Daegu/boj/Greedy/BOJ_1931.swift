
// BOJ 1931 회의실 배정
// https://www.acmicpc.net/problem/1931
// 21.10.15

let N = Int(readLine()!)!
var meetings: [(start: Int, end: Int)] = []

for _ in 0..<N {
    let meeting = readLine()!.split(separator: " ").map { Int($0)!}
    meetings.append((start: meeting[0], end: meeting[1]))
}

let sortedMeetings = meetings.sorted {
    if $0.end == $1.end {
        return $0.start < $1.start
    } else {
        return $0.end < $1.end
    }
}

var meetingStack: [(start: Int, end: Int)] = []

sortedMeetings.forEach { meeting in
    guard meetingStack.count > 0 else {
        meetingStack.append(meeting)
        return
    }
    
    let previousMeeting = meetingStack.popLast()!
    
    if previousMeeting.end <= meeting.start {
        meetingStack.append(previousMeeting)
        meetingStack.append(meeting)
    } else {
        meetingStack.append(previousMeeting)
    }
}

print(meetingStack.count)
