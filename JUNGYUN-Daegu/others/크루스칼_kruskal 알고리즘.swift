
func kruskal() {
    // 노드의 개수
    let v = Int(readLine()!)!
    // 간선의 개수
    let e = Int(readLine()!)!
    
    // 모든 간선을 담을 리스트와 최종 비용을 담을 변수
    var edges: [(from: Int, to: Int, cost: Int)] = []
    var result: Int = 0
    var parent = Array(repeating: 0, count: v + 1)
    
    // 특정 원소가 속한 집합을 찾기
    func findParent(of node: Int) -> Int {
        //루트 노드가 아니라면 루트 노드를 찾을 때까지 재귀적으로 호출
        if parent[node] != node {
            parent[node] = findParent(of: parent[node])
        }
        
        return parent[node]
    }
    
    //두 원소가 속한 집합을 합치기
    func unionParent(a: Int, b: Int) {
        var a = a
        var b = b
        
        a = findParent(of: a)
        b = findParent(of: b)
        
        if a < b {
            parent[b] = a
        } else {
            parent[a] = b
        }
    }
    
    // 부모 테이블 상에서, 부모를 자기 자신으로 초기화
    for i in 1..<v + 1 {
        parent[i] = i
    }
    
    // 모든 간선에 대한 정보를 입력받기
    for _ in 0..<e {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        let from = input[0]
        let to = input[1]
        let cost = input[2]
        
        edges.append((from: from, to: to, cost: cost))
    }
    
    // 간선을 비용순으로 정렬
    edges.sort { line1, line2 in
        line1.cost < line2.cost
    }
    
    // 간선을 하나씩 확인하며
    for edge in edges {
        let from = edge.from
        let to = edge.to
        let cost = edge.cost
        
        // 사이클이 발생하지 않는 경우에만 집합에 포함
        if findParent(of: from) != findParent(of: to) {
            unionParent(a: from, b: to)
            result += cost
        }
    }
    
    print(result)
}

kruskal()

/*
 
 INPUT
 
7
9
1 2 29
1 5 75
2 3 35
2 6 34
3 4 7
4 6 23
4 7 13
5 6 53
6 7 25
 
 OUTPU
 
 159
 */
