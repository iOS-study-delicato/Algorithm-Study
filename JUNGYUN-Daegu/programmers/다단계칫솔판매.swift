// Programmars 다단계 칫솔 판매
// https://programmers.co.kr/learn/courses/30/lessons/77486
// 21.11.19

import Foundation

func solution(_ enroll:[String], _ referral:[String], _ seller:[String], _ amount:[Int]) -> [Int] {
    var namdAndEnrollmentIndex: [String: Int] = [:]
    
    for (index, name) in enroll.enumerated() {
        namdAndEnrollmentIndex[name] = index
    }
    
    var earn: [Int] = Array(repeating: 0, count: enroll.count)
    
    func divideIncome(_ income: Int) -> (nine: Int, one: Int) {
        guard income / 10 >= 1 else {
            return (nine: income, one: 0)
        }
        
        let one = income / 10
        let nine = income - one
        
        return (nine: nine, one: one)
    }
    
    func addIncome(to enrolledIndex: Int, income: Int) {
        guard income > 0 else { return }
        
        let dividedIncome = divideIncome(income)
        earn[enrolledIndex] += dividedIncome.nine
        
        if referral[enrolledIndex] != "-" {
            let receiverIndex = namdAndEnrollmentIndex[referral[enrolledIndex]]!
            addIncome(to: receiverIndex, income: dividedIncome.one)
        } else {
            return
        }
        
    }
    
    for (index, name) in seller.enumerated() {
        let income = amount[index] * 100
        
        let enrolledIndexOfSeller = namdAndEnrollmentIndex[name]!
        addIncome(to: enrolledIndexOfSeller, income: income)
    }
    
    return earn
    
}

let result = solution(["john", "mary", "edward", "sam", "emily", "jaimie", "tod", "young"], ["-", "-", "mary", "edward", "mary", "mary", "jaimie", "edward"], ["young", "john", "tod", "emily", "mary"], [12, 4, 2, 5, 10])
print(result)
