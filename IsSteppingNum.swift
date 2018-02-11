/*
Given N and M find all stepping numbers in range N to M

The stepping number:

A number is called as a stepping number if the adjacent digits have a difference of 1.
e.g 123 is stepping number, but 358 is not a stepping number

Example:

N = 10, M = 20
all stepping numbers are 10 , 12 
Return the numbers in sorted order.
*/

import Foundation

class Solution {
    func isSteppingNum(_ num: Int) -> Bool {
        var n1 = -1
        var n2 = -1
        var num1 = num
        var prevDigit = 0
        
        //print("\n ////// isSteppingNum: \(num) ///////")
        
        if(num1 > 0) {
            var digit = num1%10
            if(digit==0) {
                n1 = -1
                n2 = 1
            }
            else if(digit==9) {
                n1 = 8
                n2 = -1
            }
            else {
                n1 = digit-1
                n2 = digit+1
            }
            prevDigit = digit
            //print("Digit: \(digit), n1: \(n1), n2: \(n2)")
            
            num1 = num1/10
            
            while(num1 > 0) { 
                digit = num1%10
                //print("Digit: \(digit), prevDigit: \(prevDigit), n1: \(n1), n2: \(n2)")
                if(prevDigit==0 && digit != n2) {
                    return false
                }
                else if(prevDigit==9 && digit != n1) {
                    return false
                }
                else if((prevDigit>0 && prevDigit<9) && (digit != n1 && digit != n2)) {
                    return false
                }
                
                //print("Set expected n1 and n2 values")
                if(digit==0) {
                    n1 = -1
                    n2 = 1
                }
                else if(digit==9) {
                    n1 = 8
                    n2 = -1
                }
                else {
                    n1 = digit-1
                    n2 = digit+1
                }
                
                num1 = num1/10
                prevDigit = digit
                //print("num1: \(num1)")
            }
            
        }
        
        //print("YES!!")
        return true
        
    }
    
	func stepnum(_ A: inout Int, _ B: inout Int) -> [Int] {
        var res = [Int]()
        for i in A...B {
            if(isSteppingNum(i)) {
                res.append(i)
            }
        }
        
        return res
	}
}
