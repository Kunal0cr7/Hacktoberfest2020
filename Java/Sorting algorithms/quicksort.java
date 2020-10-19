// Quicksort implementation in Java 
class QuickSort 
{ 
    //partition the array with last element as pivot
    int partition(int arr[], int low, int high) 
    { 
        int pivot = arr[high];  
        int i = (low-1); // index of smaller element 
        for (int j=low; j<high; j++) 
        { 
            // If current element is smaller than or 
            // equal to pivot,then swap the elements 
            if (arr[j] <= pivot) 
            { 
                i++; 
                int temp = arr[i]; 
                arr[i] = arr[j]; 
                arr[j] = temp; 
            } 
        } 
   
        // swap arr[i+1] and arr[high] (or pivot) 
        int temp = arr[i+1]; 
        arr[i+1] = arr[high]; 
        arr[high] = temp; 
   
        return i+1; 
    } 
   
     //quicksort function
    void quick_sort(int arr[], int low, int high) 
    { 
        if (low < high) 
        { 
            //partition the array around pivot
            int pivot = partition(arr, low, high); 
   
            //call quick_sort recursively to sort sub arrays
            quick_sort(arr, low, pivot-1); 
            quick_sort(arr, pivot+1, high); 
        } 
    } 
    //display the contents of array
    static void displayArray(int arr[]) 
    { 
        int n = arr.length; 
        for (int i=0; i<n; ++i) 
            System.out.print(arr[i]+" "); 
        System.out.println(); 
    } 
   
}
class Main{
    public static void main(String args[]) 
    { 
        int arr[] = {12,23,3,43,51,35,19,45}; 
        int n = arr.length; 
   
        QuickSort obj = new QuickSort(); 
        System.out.println("Input array"); 
        obj.displayArray(arr);
         
        obj.quick_sort(arr, 0, n-1); 
   
        System.out.println("Array after sorting with quick sort"); 
        obj.displayArray(arr); 
    } 
}
