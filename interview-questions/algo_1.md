Algo & DFS L 1

1. How many of you are there in your class. Given the Marks of all the students find the person 
who has scored the mid value or median in the class, you are supposed to find in the shortest possible way. Also mention the time complexity of that algorithm

2. You are supposed to write a function isprime( N ). The function should return TRUE if N is prime and FALSE otherwise

3. Find GCD Greatest Common Divisor of 3 Non Zero Integers. For eg GCD of 10,40,8 is 2 also give its time complexity

4. Reverse a given number without any string function given 325 output should be 523

5. Write the Binary Search algorithm in recursive way 

int binary_search(int A[], int key, int imin, int imax)
{
  // test if array is empty
  if (imax < imin)
    // set is empty, so return value showing not found
    return KEY_NOT_FOUND;
  else
    {
      // calculate midpoint to cut set in half
      int imid = midpoint(imin, imax);
 
      // three-way comparison
      if (A[imid] > key)
        // key is in lower subset
        return binary_search(A, key, imin, imid-1);
      else if (A[imid] < key)
        // key is in upper subset
        return binary_search(A, key, imid+1, imax);
      else
        // key has been found
        return imid;
    }
}

6. Write the binary search algorithm in iterative way

int binary_search(int A[], int key, int imin, int imax)
{
  // continue searching while [imin,imax] is not empty
  while (imax >= imin)
    {
      // calculate the midpoint for roughly equal partition
      int imid = midpoint(imin, imax);
      if(A[imid] == key)
        // key found at index imid
        return imid; 
      // determine which subarray to search
      else if (A[imid] < key)
        // change min index to search upper subarray
        imin = imid + 1;
      else         
        // change max index to search lower subarray
        imax = imid - 1;
    }
  // key is not found
  return KEY_NOT_FOUND;
}

7. Implement Stack using linked list and perform POP(), PUSH() operation, Count(), getNth(), DeleteList() operation on them and 

8. Implement Queue using linked list and perform isEmpty(), createQueue(), destroyQueue(), Insert(), Delete()

9. implement Circular Queue using linked list and perform insert(), 
Into an empty queue
NewPtr -> Next = NewPtr
BackPtr = NewPtr

insert into non empty queue
NewPtr -> Next = BackPtr-> Next
BackPtr -> Next = NewPtr
BackPtr = NewPtr

10. Delete operation in circular queue
deletePtr = BackPtr -> Next
If (deletePtr = BackPtr)
	BackPtr = NULL
delete deletePtr