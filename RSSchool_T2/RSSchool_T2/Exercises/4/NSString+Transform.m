#import "NSString+Transform.h"

@implementation NSString (Transform)

-(NSString*)transform {
    NSDictionary *dictionary = @{@"A" : @NO, @"B" : @NO, @"C" : @NO, @"D" : @NO, @"E" : @NO, @"F" : @NO, @"G" : @NO, @"H" : @NO, @"I" : @NO, @"J" : @NO, @"K" : @NO, @"L" : @NO, @"M" : @NO, @"N" : @NO, @"O" : @NO, @"P" : @NO, @"Q" : @NO, @"R" : @NO, @"S" : @NO, @"T" : @NO, @"U" : @NO, @"V" : @NO, @"W" : @NO, @"X" : @NO, @"Y" : @NO, @"Z" : @NO
    };
    
    NSMutableArray *resultArray = [NSMutableArray new];
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:dictionary];
    NSMutableString *stringMutable = [NSMutableString stringWithString:[self uppercaseString]];
    
    BOOL isPangram = true;
    
    
    for (int i = 0; i < stringMutable.length; i++) {
        NSString *letter = [stringMutable substringWithRange:NSMakeRange(i, 1)];
        if ([letter rangeOfCharacterFromSet:[NSCharacterSet letterCharacterSet]].location != NSNotFound) {
            [dict setObject:@YES forKey:letter];
        }
    }
    
    for (NSNumber *temp in [dict allValues]) {
        if (temp.boolValue == NO) {
            isPangram = false;
            break;
        }
    }
    NSCharacterSet *workSet = [NSCharacterSet characterSetWithCharactersInString:isPangram ? @"AEIOUYaeiouy" : @"BCDFGHJKLMNPQRSTVWXZbcdfghjklmnpqrstvwxz"];
    
    NSMutableArray *words = [NSMutableArray arrayWithArray:[self componentsSeparatedByString:@" "]];
    
    for (NSString *word in words) {
        if ([word isEqualToString:@""]) {
            continue;
        }
        
        int countOfChar = 0;
        NSMutableString *string = [NSMutableString stringWithString:word];
        
        for (int i = 0; i < string.length; i++) {
            NSString *character = [word substringWithRange:NSMakeRange(i, 1)];
            
            if ([character rangeOfCharacterFromSet:workSet].location != NSNotFound){
                [string replaceCharactersInRange:NSMakeRange(i, 1) withString:[character uppercaseString]];
                countOfChar++;
            }
        }
        [resultArray addObject:[NSString stringWithFormat:@"%d%@", countOfChar, string]];
        
    }
    resultArray = [NSMutableArray arrayWithArray:[self sortArray:resultArray]];
    NSString * resultString = [resultArray componentsJoinedByString:@" "];
    return resultString;
}



-(NSMutableArray *)sortArray:(NSMutableArray*) array {
    [array sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSString *firstWord = (NSString*)obj1;
        NSString *secondWord = (NSString*)obj2;
        NSRange range = NSMakeRange(0, 1);
        int firstLetterInWord = [firstWord substringWithRange:range].intValue;
        int secondLetterInWord = [secondWord substringWithRange:range].intValue;
        
        return (firstLetterInWord < secondLetterInWord ? NSOrderedAscending : firstLetterInWord > secondLetterInWord ? NSOrderedDescending : NSOrderedSame);
    }];
    return array;
}

@end
