/*
How many minimum numbers from fibonacci series are required such that sum of numbers should be equal to a given Number N?
Note : repetition of number is allowed.

Example:

N = 4
Fibonacci numbers : 1 1 2 3 5 .... so on
here 2 + 2 = 4 
so minimum numbers will be 2 
*/

import Foundation

class Solution {
	func fibsum(_ A: inout Int) -> Int {
        var fib = [Int]()
        var n1 = 1
        var n2 = 1
        var cnt = 0

        
        while(n1 <= A) {
            fib.append(n1)
            var temp = n1 + n2
            n1 = n2
            n2 = temp
        }
        
        var fibIndex = fib.count-1
        while(fibIndex >= 0 && A>0) {
            var currNum = fib[fibIndex]
            if(A >= currNum) {
                A -= currNum
                cnt += 1
            }
            
            fibIndex -= 1
        }
        
        return cnt
    
	}
}
