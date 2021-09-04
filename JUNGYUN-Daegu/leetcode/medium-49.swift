class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        
        var dict: [String: [String]] = [:]
        
        for word in strs {
            let key = String(word.sorted())
            
            if dict.keys.contains(key) {
                dict[key]?.append(word)
            } else {
                dict[key] = [word]
            }
        }
        return Array(dict.values)
    }
}
