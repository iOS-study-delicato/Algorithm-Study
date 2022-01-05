// 프로그래머스 해시 > 베스트앨범
// https://programmers.co.kr/learn/courses/30/lessons/42579
// 22.01.05

import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    
    
    typealias GenreData = (total: Int, song: [(index: Int, play: Int)])
    
    var dict: [String: GenreData] = [:]
    

    
    for i in 0..<genres.count {
        if dict[genres[i]] != nil {
            dict[genres[i]]!.total += plays[i]
            dict[genres[i]]!.song.append((index: i, play: plays[i]))
        } else {
            dict[genres[i]] = (total: plays[i], song: [(index: i, play: plays[i])])
        }
    }
    
    
    
    let sortedGenres = dict.sorted { first, second in
        return first.value.total > second.value.total
    }
    
    
    
    var result: [Int] = []
    
    
    
    for genre in sortedGenres {
        let sorted = genre.value.song.sorted { first, second in
            first.play > second.play
        }
        
        for j in 0..<2 {
            guard sorted.count > j else { continue }
            result.append(sorted[j].index)
        }
    }
    
    
    
    return result
}


