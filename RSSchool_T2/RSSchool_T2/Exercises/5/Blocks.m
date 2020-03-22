#import "Blocks.h"

@implementation Blocks
   NSArray *finalArray;

- (BlockA)blockA {
    return [^(NSArray *someArray){
        finalArray = someArray;
    }copy];
}


- (BlockB)blockB {
    return [^(Class class){
        if ([class isEqual:[NSString class]]){
            NSString *finalString = @"";
            
            for (NSObject *temp in finalArray) {
                if([temp isKindOfClass:[NSString class]]) {
                    finalString = [finalString stringByAppendingString:(NSString*)temp];
                }
            }
            _blockC(finalString);
        }else if ([class isEqual:[NSNumber class]]) {
            int finalSum = 0;
            
            for(NSObject *temp in finalArray) {
                if([temp isKindOfClass:[NSNumber class]]){
                    int newElement = [(NSNumber*)temp intValue];
                    finalSum += newElement;
                }
            }
            NSNumber *sum = [NSNumber numberWithInt:finalSum];
            _blockC(sum);
        }else if ([class isEqual:[NSDate class]]) {
            NSDate *date = [NSDate dateWithTimeIntervalSince1970:0];
            
            for (NSObject *temp in finalArray) {
                if([temp isKindOfClass:[NSDate class]]) {
                    date = [date laterDate: (NSDate*)temp];
                }
            }
            NSDateFormatter *dateFormatter = [NSDateFormatter new];
            dateFormatter.dateFormat = @"dd.MM.yyy";
        
            _blockC([dateFormatter stringFromDate:date]);
        }
    }copy];
}


@end

