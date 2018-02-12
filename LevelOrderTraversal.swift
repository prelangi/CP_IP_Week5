/*
Given a binary tree, return the level order traversal of its nodes’ values. (ie, from left to right, level by level).

Example :
Given binary tree

    3
   / \
  9  20
    /  \
   15   7
return its level order traversal as:

[
  [3],
  [9,20],
  [15,7]
]
Also think about a version of the question where you are asked to do a level order traversal of the tree when depth of the tree is much greater than number of nodes on a level.
*/

import Foundation

/**
 * Definition for a binary tree node
 *
 * class TreeNode {
 *    var val: Int = 0
 *    var left: TreeNode?
 *    var right: TreeNode?
 * }
 *
 */

class Solution {
	func levelOrder(_ A: TreeNode?) -> [[Int]] {
	    var result = [[Int]]()
	    var queue = [TreeNode]()
	    var values = [Int]()
	    
	    if(A==nil) { 
	        return result
	    }
	    
	    
	    queue.append(A!)
	    values.append(A!.val)
	    result.append(values)
	    
	    while(!queue.isEmpty) {
	        var queueSize = queue.count
	        var nodeArray = [Int]()
	        //print("QueueSize: \(queueSize)")
	        
	        while(queueSize>0) {
	        
	            //print("QueueSize: \(queueSize)")
	            var currNode = queue.removeFirst()
	            if(currNode.left != nil) {
	                queue.append(currNode.left!)
	                nodeArray.append(currNode.left!.val)
	            }
	            
	            if(currNode.right != nil) {
	                queue.append(currNode.right!)
	                nodeArray.append(currNode.right!.val)
	            }
	            
	            queueSize -= 1
	        }
	        
	        //print("nodeArray count: \(nodeArray.count)")
	        if(nodeArray.count > 0) { 
	            result.append(nodeArray)
	        }

	    }
	    
	    return result
	    

	}
}
