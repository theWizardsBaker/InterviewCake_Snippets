
/*

	Question 25:
	
	You have a linked list ↴ and want to find the kkkth to last node.
	Write a function kth_to_last_node() that takes an integer k and the 
	head_node of a singly linked list, and returns the kth to last node in the list. 

*/

// No real error checking with this one. My first thought is to just move a second pointer k spaces from
// a pointer that walks through the list. This way it's kth from last when the first pointer eventually 
// hits the end

#include <iostream>
using namespace std;

class LinkedList{

	struct Node {
		int val;
		Node *next;
	};

// public member
public:
	// constructor
	LinkedList(){
		head = NULL; 
	}

	// This prepends a new value at the beginning of the list
	void push(int val){
		Node *n = new Node();   
		n->val = val;             
		n->next = head;                       
		head = n;               
	}

	int pop(){
		Node *node = head;
		int ret = node->val;
		head = head->next;
		delete node;
		return ret;
	}
	
	int kth_to_last_node(int k){
		// set head pointer and K pointers
		Node *head_node = head;
		Node *k_node = head;
		// walk along the entire list until we hit the end
		do{
			// if we're k away from the first pointer, 
			// start walking k along
			if(k == 0){
				k_node = k_node->next;
			} else {
				// otherwise make k 1 step closer to running
				k--;
			}
			head_node = head_node->next;
		} while( head_node->next != NULL );
		// return the value of k
		return k_node->val;
	}


// private member
private:
	Node *head;
};


int main() {
	LinkedList list;
	int last_node = 5;
	
	list.push(5);
	list.push(10);
	list.push(20);
	list.push(25);
	list.push(30);
	list.push(40);
	list.push(45);
	list.push(55);
	list.push(60);
	list.push(70);

	cout << last_node << "th to last node: " << list.kth_to_last_node(last_node - 1) << endl;

	
	return 0;
}

