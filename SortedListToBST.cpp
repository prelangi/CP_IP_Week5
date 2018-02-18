/*
Given a singly linked list where elements are sorted in ascending order, convert it to a height balanced BST.

 A height balanced BST : a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1. 
Example :


Given A : 1 -> 2 -> 3
A height balanced BST  :

      2
    /   \
   1     3
*/
/**
 * Definition for binary tree
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 * };
 */
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
 TreeNode *sortedListToBSTRecur(ListNode *head, ListNode *tail)
    {
    	if( head == tail )
    		return NULL;
    	if( head->next == tail )    // 
    	{	
    		TreeNode *root = new TreeNode( head->val );
    		return root;
    	}
    	ListNode *slow = head, *fast = head;
    	
    	while( fast != tail && fast->next != tail )  
    	{
    	    slow = slow->next;
    		fast = fast->next->next;
    	}
    	
    	TreeNode *root = new TreeNode( slow->val );
    	root->left = sortedListToBSTRecur( head, slow );
    	root->right = sortedListToBSTRecur( slow->next, tail );
    	return root;
    }
    
TreeNode* Solution::sortedListToBST(ListNode* A) {
    // Do not write main() function.
    // Do not read input, instead use the arguments to the function.
    // Do not print the output, instead return values as specified
    // Still have a doubt. Checkout www.interviewbit.com/pages/sample_codes/ for more details

    
    return sortedListToBSTRecur(A,NULL);
}
