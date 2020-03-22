#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
       int n = number.intValue;
       NSMutableArray *array = [NSMutableArray new];
       int firstElement = 0;
       int currentElement = 1;
       while (currentElement < n) {
           int sum = firstElement + currentElement;
           firstElement = currentElement;
           currentElement  = sum;
           if (firstElement * currentElement == n) {
               array = [NSMutableArray arrayWithObjects:@(firstElement),@(currentElement),@1, nil];
               break;
           }else if (firstElement * currentElement > n) {
               array = [NSMutableArray arrayWithObjects:@(firstElement),@(currentElement),@0, nil];
               break;
           }
       }
    return array;
}
@end
