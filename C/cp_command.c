//Program to simulate cp command in linux using command line arguments

#include <stdio.h> 
#include <stdlib.h>
#include<string.h>
int main(int argc, char *argv[]) 
{ 
	if(argc ==1){
        printf("No arguments given retry");
        exit(0);
    }else if(argc ==2&&!strcmp(argv[1],"-help")){
		printf("Program to copy 2 file: \nUsage ./mycopy sourcefile destination");
		exit(0);
	}
	else if (argc ==2)
    {
        printf("No destination provided");
        exit(0);
    }
    else if(argc>3){
        printf("Only one source and destination is expected");
        exit(0);
    }
    FILE *fp1,*fp2; 
	char x; 
	fp1 = fopen(argv[1], "r"); 
	if (fp1 == NULL) 
	{ 
		printf("Source file dosen't exist ..remember to use extension...exiting\n"); 
		exit(0); 
	} 
	fp2 = fopen(argv[2], "w"); 
	if (fp2 == NULL) 
	{ 
		printf("Memory error.. \n"); 
		exit(0); 
	}  
	x = fgetc(fp1); 
	while (x != EOF) 
	{ 
		fputc(x,fp2); 
		x = fgetc(fp1); 
	} 
	printf("\nCopy completed"); 
	fclose(fp1); 
	fclose(fp2); 
	return 0; 
}
