
let INF = Int.max // 무한한 수를 의미

// 노드의 개수 및 간선의 개수 입력받기
let n = Int(readLine()!)!
let m = Int(readLine()!)!

//2 차원 리스트를 만들고 모든 값을 무한으로 초기화
var graph = Array(repeating: Array(repeating: INF, count: n + 1), count: n + 1)

// 자기 자신에서 자기 자신으로 가는 비용은 0으로 초기화
for a in 1..<n+1 {
    for b in 1..<n+1 {
        if a == b {
            graph[a][b] = 0
        }
    }
}

// 각 간선에 대한 정보를 입력받아, 그 값으로 초기화
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let from = input[0]
    let to = input[1]
    let cost = input[2]
    
    graph[from][to] = cost
}

// 점화식에 따라 플로이드 워셜 알고리즘을 수행
for k in 1..<n+1 { // k는 거쳐갈 노드 번호
    for i in 1..<n+1 {
        for j in 1..<n+1 {
            if graph[i][k] == INF || graph[k][j] == INF {
                continue
            } else {
                graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])
            }
        }
    }
}

// 수행된 결과를 출력
for row in 1..<n+1 {
    for column in 1..<n+1 {
        if graph[row][column] == INF {
            print("INF", terminator: " ")
        } else {
            print(graph[row][column], terminator: " ")
        }
    }
    print()
}

/*
 INPUT
4
7
1 2 4
1 4 6
2 1 3
2 3 7
3 1 5
3 4 4
4 3 2
 
 OUTPUT
 
 0 4 8 6
 3 0 7 9
 5 9 0 4
 7 11 2 0
 */

