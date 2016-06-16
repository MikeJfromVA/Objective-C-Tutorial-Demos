#import <Foundation/Foundation.h>

typedef double(^binaryOp)(double a, double b);

int main() {
	binaryOp mult = ^(double a, double b) {
		return a*b;
	};
	binaryOp add = ^(double a, double b) {
		return a+b;
	};

	printf("%f\n",mult(2.0,3.0));
	printf("%f\n",add(4.0,5.0));

	// Works as closure
	int x = 2;
	int z = 5;
	int(^addAll)(int y, int q) = ^int(int y, int q){
		return x + y + z + q;
	};
	x = 0;
	z = 0;
	printf("%d\n",addAll(3,4));
}

