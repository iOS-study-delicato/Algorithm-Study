

//노드와 간선의 정보 개수 입력받기
let vertex = Int(readLine()!)!
let edge = Int(readLine()!)!

//진입차수
var indegree = Array(repeating: 0, count: vertex + 1)
var graph = Array(repeating: [Int](), count: vertex + 1)

//방향 그래프의 모든 간선 정보를 입력받기
for _ in 0..<edge {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let from = input[0]
    let to = input[1]
    
    graph[from].append(to)
    indegree[to] += 1
}

var result = [Int]()

func topologicalSort() {
    //deque를 이용해 시간 복잡도 개선 가능
    var q = [Int]()
    
    // 처음 시작할 때 진입 차수가 0인 노드를 큐에 삽입
    for i in 1...vertex {
        if indegree[i] == 0 {
            q.append(i)
        }
    }
    
    while !q.isEmpty {
        let now = q.removeFirst()
        result.append(now)
        
        for to in graph[now] {
            indegree[to] -= 1
            
            if indegree[to] == 0 {
                q.append(to)
            }
        }
    }
}

topologicalSort()

for ele in result {
    print(ele)
}

/*
 TC
7
8
1 2
1 5
2 3
2 6
3 4
4 7
5 6
6 4
 */


