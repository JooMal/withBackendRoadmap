#include "pch.h"

#include <iostream>	
#include <vector>
#include <string>
#include <algorithm>
#include <stdio.h>

using namespace std;
int main()
{
	vector<int> arr = { 1,2,3,4 };
	vector<int>::iterator it;
	int idx = 0;
	for (it = arr.begin(); it < arr.end(); it++) {
		printf("idx[%d] address is %p\n", idx++, it);
	}
	
	auto ptr = arr.end();
	printf("arr.end() address is %p\n", ptr);

	
	return 0;
}
