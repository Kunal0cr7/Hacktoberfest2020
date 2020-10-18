#include<iostream>
#include<vector>

using namespace std;

int main()
{
    vector<int> vec1(20); //vector define who's size is 20;
    /* for(int i=0;i<vec1.size();i++)
    {
        cin >> vec1;
    }*/
    vec1.push_back(8);
    int c = vec1.at(1); // vector at 1 position;
    cout << c<<endl; // printing data stored in c i.e vector vec1 at position 1.

    vector<double> vec2(7); 
    bool em=vec2.empty(); // check whether vec2 is empty or not;
    cout << vec2.size()<<endl; // printing size of vec2;
    vec2.push_back(100);  // push_back means entering data from backward, within bracket is the data which is we are entring;
    cout << vec2.size()<<endl; // size of vec2; now it will be increased by 1 cause we have entered a new value in the vec2;

    vector<int> vec3; // defining vector, size 0;
    vec3.push_back(2); // entering data in vec3 from backside;
    vec3.pop_back(); // deleting data from backside;
    cout << vec3.size()<<endl; // size of vec3 which is 0 as after adding and deleting it is again zero;
    vector<int> vec4(7,26); // defining vec4, size = 7 and data in it at ll 7 position is 26;
    
     int s =vec2.size(); // variable s storing size of vec2;
    unsigned int vec1_size=vec1.size(); // ab bhi nahi samjh to kuch nahi ho sakta tera;
    cout << vec1.size() << " "<< s<< " " << vec4.size()<<endl;  //printing size of vec1, variable s, size of vec4;
    double vec2_size=vec2.size(); 
    unsigned int vec3_size=vec3.size();

    //loop for printing the value of vec2 at all postions;
    for(int i=0; i<vec2.size();++i) // 
    {
        cout <<vec2[i] << " ";

    }

    vec3.pop_back(); // deleting the value of vec3 from backside
    

    cout <<endl;

    vector<int> vec5{5,4,3,2,1}; // another way of defining vector,just like array;
    cout << vec5.front() << endl;
    for(int i:vec5)
    cout << i << " "<<endl; // printing values of vec5
    
    vec5.pop_back(); // deleting data from backside;

    //loop for printing vector data;
    for(int i=0; i<vec5.size();++i)
    {
        cout <<vec5[i] << " "; 

    }


    return 0;
}