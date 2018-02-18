/*
Given N * M field of O's and X's, where O=white, X=black
Return the number of black shapes. A black shape consists of one or more adjacent X's (diagonals not included)

Example:

OOOXOOO
OOXXOXO
OXOOOXO

answer is 3 shapes are  :
(i)    X
     X X
(ii)
      X
 (iii)
      X
      X
Note that we are looking for connected shapes here.

For example,

XXX
XXX
XXX
is just one single connected black shape.
*/

import Foundation

class Solution {
    
    func dfs(_ i:Int, _ j: Int, _ xdim: Int, _ ydim: Int, _ isLand: inout [[Bool]], _ visited: inout [[Bool]]) {
        
        //check bounds on i,j
        //print("i: \(i), j: \(j),xdim: \(xdim),ydim: \(ydim)")
        if(i<0 || i>xdim || j<0 || j>ydim) {
            return
        }
        
        
        if(isLand[i][j]==false) {
            return
        }
        
        if(visited[i][j]) {
            return
        }
        visited[i][j] = true
        //print("i: \(i), j: \(j)")
        
        dfs(i-1,j,xdim,ydim, &isLand, &visited)
        dfs(i+1,j,xdim,ydim, &isLand, &visited)
        dfs(i,j-1,xdim,ydim, &isLand, &visited)
        dfs(i,j+1,xdim,ydim, &isLand, &visited)
        
    }
    
    
    func numIslands(_ grid: [[Character]]) -> Int {
        
        var numIslands = 0
        
        if(grid.count==0) {
            return numIslands
        }
        
        var isLand = Array(repeating: Array(repeating:false,count:grid[0].count),count: grid.count)
        var visited = Array(repeating: Array(repeating:false,count:grid[0].count),count: grid.count)
        var xdim = grid.count-1
        var ydim = grid[0].count-1
        
        //Mark the land points on the grid
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if(grid[i][j]=="X") {
                    isLand[i][j]=true
                }
            }
        }
        //print(isLand)
        
        //Connect land points to form islands
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if(grid[i][j]=="X" && !visited[i][j]) {
                    dfs(i,j,xdim,ydim,&isLand,&visited)
                    //print("Incrementing numIslands")
                    numIslands += 1
                }
                
            }
        }
        
        return numIslands
        
    }
	func black(_ A: inout [String]) -> Int {
	    var islands = [[Character]]()
        for i in 0..<A.count {
            var temp = Array(A[i].characters)
            var result = [Character]()
            for k in 0..<temp.count {
                result.append(temp[k])
        
            }
            islands.append(result)
        }
        //print(islands)
	    
	    return numIslands(islands)

	}
}
