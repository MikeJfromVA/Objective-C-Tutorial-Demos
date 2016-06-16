#import <Foundation/foundation.h>

@interface BT: NSObject {
	@public
	int val;
	BT *left;
	BT *right;
}
- (void) inOrder;

@end

@implementation BT
- (void) inOrder {
	[left inOrder];
	printf("%d\n",val);
	[right inOrder];
}
@end

int main() {
	BT *t1 = [[BT alloc] init];
	t1->val=1;
	BT *t2 = [[BT alloc] init];
	t2->val=2;
	BT *t3 = [[BT alloc] init];
	t3->val=3;

	t1->left=t2;
	t1->right=t3;

	BT *t4 = [[BT alloc] init];
	t4->val=4;
	BT *t5 = [[BT alloc] init];
	t5->val=5;

	t2->left=t4;
	t2->right=t5;

	BT *t6 = [[BT alloc] init];
	t6->val=6;
	BT *t7 = [[BT alloc] init];
	t7->val=7;

	t3->left=t6;
	t3->right=t7;

	[t1 inOrder];
}

