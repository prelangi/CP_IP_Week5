/*
Knight movement on a chess board

Given any source point and destination point on a chess board, we need to find whether Knight can move to the destination or not.

Knight's movements on a chess board

The above figure details the movements for a knight ( 8 possibilities ). Note that a knight cannot go out of the board.

If yes, then what would be the minimum number of steps for the knight to move to the said point.
If knight can not move from the source point to the destination point, then return -1

Input:

N, M, x1, y1, x2, y2
where N and M are size of chess board
x1, y1  coordinates of source point
x2, y2  coordinates of destination point
Output:

return Minimum moves or -1
Example

Input : 8 8 1 1 8 8
Output :  6
*/

import Foundation

class Solution {
	class knightPosition {
        var x:Int
        var y:Int
        var dist: Int
    
        init(_ x1:Int, _ y1:Int, _ d1:Int) {
            x = x1
            y = y1
            dist = d1
        }
    }

func knightWrapper(_ start: knightPosition, _ end: knightPosition,_ X:Int, _ Y:Int,_ visited: inout [[Bool]],_ queue: inout [knightPosition],_ dist: Int) -> Int {
                        
    //((1,2),(-1,2),(1,-2),(-1,-2),(2,1),(-2,1),(2,-1),(-2,-1))
    var possibleX = [1,-1,1,-1,2,-2,2,-2]
    var possibleY = [2,2,-2,-2,1,1,-1,-1]
    
    //print("\nstart: x = \(start.x), y = \(start.y), dist: \(dist)")
    for i in 0..<8 {
        var newX = start.x + possibleX[i]
        var newY = start.y + possibleY[i]
        //print("X: \(newX), Y: \(newY)", terminator:" ")
        if(newX>=1 && newX<=X && newY>=1 && newY<=Y && !visited[newX-1][newY-1]) {
            //print("i: \(i), X: \(newX), Y: \(newY)", terminator:" ")
            queue.append(knightPosition(newX,newY,dist+1))
            visited[newX-1][newY-1] = true
        }
    }
    
            
    while(!queue.isEmpty) {
        var newPoint = queue.removeFirst()
        //print("newPoint.x = \(newPoint.x), y = \(newPoint.y)")
        if(newPoint.x == end.x && newPoint.y == end.y) {
            return newPoint.dist
        }
        else {
            return knightWrapper(newPoint,end,X,Y,&visited,&queue,newPoint.dist)
        }
    }

    return -1
}
	
	
	func knight(_ A: inout Int, _ B: inout Int, _ C: inout Int, _ D: inout Int, _ E: inout Int, _ F: inout Int) -> Int {
        var start =  knightPosition(C,D,0)
        var end = knightPosition(E,F,0)
        var dimX = A
        var dimY = B
    
        var visited = Array(repeating:Array(repeating:false,count:dimY),count:dimX)
        var queue = [knightPosition]()
    
        visited[C-1][D-1] =  true
        queue.append(start)
    
        return knightWrapper(start,end,A,B,&visited,&queue,0)
	}
}
