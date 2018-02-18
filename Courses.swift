/*
Possibility of finishing all courses given pre-requisites
Problem Setter: mihai.gheorghe 
Problem Tester: sneh_gupta
 There are a total of N courses you have to take, labeled from 1 to N. Some courses may have prerequisites, for example to take course 2 you have to first take course 1, which is expressed as a pair: [1,2]. 
Given the total number of courses and a list of prerequisite pairs, is it possible for you to finish all courses. return 1/0 if it is possible/not possible.
The list of prerequisite pair are given in two integer arrays B and C where B[i] is a prerequisite for C[i].

 Example: If N = 3 and the prerequisite pairs are [1,2] and [2,3], then you can finish courses in the following order: 1, 2 and 3. But if N = 2 and the prerequisite pairs are [1,2] and [2,1], then it is not possible for you to finish all the courses. 
*/

import Foundation

class Solution {

    func makeGraph(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int:Set<Int>] {
        var result = [Int:Set<Int>]()
        for i in 0..<prerequisites.count {
            var course1 = prerequisites[i][1]
            var course0 = prerequisites[i][0]
            var set = result[course1]
            if(set != nil) {
                set?.insert(course0)
                result[course1] = set
            }  
            else {
                var set1 = Set<Int>()
                set1.insert(course0)
                result[course1] = set1
            }
        }
    
        return result
    }
    
    func dfs_cycle(_ graph: [Int:Set<Int>], _ courseNum: Int, _ visited: inout [Bool], _ onPath: inout [Bool]) -> Bool {
        if(visited[courseNum]) {
            return false //No need to do the computation again
        }
        
        visited[courseNum] = true
        onPath[courseNum] = true
        var setExists = graph[courseNum+1] != nil
    
        if(setExists) {
            for neigh in graph[courseNum+1]! {
                if(onPath[neigh-1] || dfs_cycle(graph,neigh-1,&visited,&onPath)) {
                    return true // Yes cycle is present
                }
                
            }
        }
        
        onPath[courseNum] = false
        return false
    }
    
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var graph = makeGraph(numCourses,prerequisites)
        var visited = Array(repeating: false,count: numCourses)
        var onPath = Array(repeating: false, count: numCourses)
        
        for i in 0..<numCourses {
            if(!visited[i] && dfs_cycle(graph,i,&visited,&onPath)) {
                return false
            }
        }
        return true
    }
    
	func solve(_ A: inout Int, _ B: inout [Int], _ C: inout [Int]) -> Int {
        var prerequisites = [[Int]]()
        for i in 0..<B.count {
            
            var course0 = B[i]
            var course1 = C[i]
            var pair = [course0, course1]
            prerequisites.append(pair)
            
        }
        
        
        if(canFinish(A,prerequisites)) {
            return 1
        }
        else {
            return 0
        }
	}
}
