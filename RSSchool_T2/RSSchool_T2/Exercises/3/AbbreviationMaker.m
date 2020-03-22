#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    NSMutableString *aString = [NSMutableString stringWithString:[a uppercaseString]];
    
    unichar findOne;
    unichar findTwo;
    
    for (int i = 0 ; i < b.length; i++) {
        findOne = [b characterAtIndex:i];
        for (int j = i; j < aString.length; j++) {
            findTwo = [aString characterAtIndex:j];
            if (findOne != findTwo) {
                NSRange range = NSMakeRange(j, 1);
                [aString deleteCharactersInRange:range];
                j--;
            }else {
                if (i == b.length - 1) {
                    NSRange rangeNew = NSMakeRange(j + 1, aString.length - j - 1);
                    [aString deleteCharactersInRange:rangeNew];
                }
                break;
            }
        }
    }
    if ([b isEqualToString:aString]) {
        return @"YES";
    }else {
        return @"NO";
    }
}



@end
