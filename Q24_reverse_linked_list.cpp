/*

	Question 24:

	Hooray! It's opposite day. Linked lists go the opposite way today.

	Write a function for reversing a linked list. Do it in-place.

	Your function will have one input: the head of the list. 

*/

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
    void addValue(int val){
        Node *n = new Node();   
        n->val = val;             
        n->next = head;                       
        head = n;               
    }

    int popValue(){
        Node *node = head;
        int ret = node->val;
        head = head->next;
        delete node;
        return ret;
    }

    //reverse the linked list
    void reverse(){
    	if(head != NULL){
	    	// get the first item
	    	Node *cur = head;
	    	// get the next item
	    	Node *nxt = cur->next;
	    	// create child node (for next-next)
	    	Node *child = NULL;
	    	// make the first (now last) point to nothing
	    	cur->next = NULL;

	    	while(nxt){
	    		// get nxt's child element
	    		child = nxt->next;
	    		// point int he opposite direction
	    		nxt->next = cur;
	    		// the current item is now nxt
	    		cur = nxt;
	    		// child of nxt becomes next element
	    		nxt = child;
	    	}

	    	// set the current head
	    	head = cur;
    	}
    }

// private member
private:
    Node *head;
};

int main() {
    LinkedList list;

    list.addValue(5);
    list.addValue(10);
    list.addValue(20);
    list.addValue(25);
    list.addValue(30);
    list.addValue(40);
    
    
    cout << list.popValue() << endl;
    cout << list.popValue() << endl;
    cout << list.popValue() << endl;
    cout << list.popValue() << endl;
    cout << list.popValue() << endl;
    cout << list.popValue() << endl;
    
    cout << "-------" << endl;
    
    list.addValue(5);
    list.addValue(10);
    list.addValue(20);
    list.addValue(25);
    list.addValue(30);
    list.addValue(40);
    
    list.reverse();

    cout << list.popValue() << endl;
    cout << list.popValue() << endl;
    cout << list.popValue() << endl;
    cout << list.popValue() << endl;
    cout << list.popValue() << endl;
    cout << list.popValue() << endl;
    
    return 0;
}