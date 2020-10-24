//Program to simulate rm command in c (dosen't support any flags and all)

#include <stdio.h>
#include <stdlib.h>
#include<string.h>
int main(int argc,char* argv[])
{
  if(argc ==1){
        printf("No arguments given retry");
        exit(0);
    }else if(argc ==2&&!strcmp(argv[1],"-help")){
		printf("Program to delete files: \nUsage: ./executable file1 file2..");
		exit(0);
	}
  for(int i=1;i<argc;i++){
  int flag= remove(argv[i]);
  if (flag == 0)
    printf("deleted :%s \n",argv[i]);
  else
  {
    printf("Unable to delete %s \n",argv[i]);
    perror("error identified");
  }
  }
 return 0;
}
