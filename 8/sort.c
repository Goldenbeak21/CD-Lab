#include <stdio.h>

void swap(int *a, int *b){
	int t = *a;
	*a = *b;
	*b = t;
}

int main(){

	int i,j,k;
	int arr[] = {2,5,3,1};

	for(i=0;i<4;i++)
		for(j=i+1;j<4;j++)
			if(arr[i]>arr[j])
				swap(&arr[i],&arr[j]);

	return 0;

}