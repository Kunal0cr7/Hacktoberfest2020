#include <iostream>

int main(){
    int h = 5;
    
    for(int i=0; i< h; ++i)
    {
        int starCount = i + (i+1); 
        int spaceCount = h - i;
        
        for(int d = 0; d<spaceCount; ++d)
            std::cout<<' ';
        for(int j=0; j<starCount; ++j)
            std::cout<<'*';       
        
        std::cout << '\n';
    }   
}


// Output:

//     *

//    ***

//   *****

//  *******

// *********