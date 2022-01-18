
let INF = Int.max // 무한을 의미하는 숫자

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm.first!// 노드의 개수
let m = nm.last! // 간선의 개수

let start = Int(readLine()!)! // 시작 노드 번호를 입력받기

// 각 노드에 연결돼 있는 노드에 대한 정보를 담는 리스트를 만들기
var graph = Array(repeating: [(to: Int, cost: Int)](), count: n + 1)
// 방문한 적이 있는지 체크하는 목적의 리스트 만들기
var visited = Array(repeating: false, count: n + 1)
// 최단거리 테이블을 모두 무한으로 초기화
var distance = Array(repeating: INF, count: n + 1)

// 모든 간선 정보를 입력받기
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let from = input[0]
    let to = input[1]
    let cost = input[2]

    graph[from].append((to: to, cost: cost))
}

// 방문하지 않은 노드 중에서, 가장 최단 거리가 짧은 노드의 번호를 반환
func getSmallestNode() -> Int {
    var min = INF
    var index = 0 // 가장 최단 거리가 짧은 노드(인덱스)

    for i in 1..<n + 1{
        if distance[i] < min && !visited[i] {
            min = distance[i]
            index = i
        }
    }
    
    return index
}

func dijkstra(start: Int) {
    // 시작 노드에 대해서 초기화
    // 시작노드까지 도달하는 거리는 0, 시작노드는 문제에서 주어진 초기 최단 거리 노드다.
    distance[start] = 0
    visited[start] = true
    
    // 출발점에서 연결되는 노드들의 거리 업데이트(일부는 후에 업데이트 될 수 있다)
    for j in graph[start] {
        distance[j.to] = j.cost
    }

    // 시작 노드를 제외한 전체 n - 1개의 노드에 대해 반복
    for _ in 0..<n - 1 {
        
        // 현재 최단 거리가 가장 짧은 노드를 꺼내서, 방문 처리
        let now = getSmallestNode()
        visited[now] = true
        
            //현재 노드와 연결된 다른 노드를 확인
            for k in graph[now] {
                let cost = distance[now] + k.cost
        
                //현재 노드를 거쳐서 다른 노드로 이동하는 거리다 더 짧은 경우
                if cost < distance[k.to] {
                    distance[k.cost] = cost
                }
            }
        
    }
}

dijkstra(start: start)

for i in 1..<n + 1 {
    if distance[i] == INF {
        print("INF")
    } else {
        print(distance[i])
    }
}

/*
 IN
6 11
1
1 2 2
1 3 5
1 4 1
2 3 3
2 4 2
3 2 3
3 6 5
4 3 3
4 5 1
5 3 1
5 6 2
 
OUT
 0
 2
 3
 1
 2
 4
 */
